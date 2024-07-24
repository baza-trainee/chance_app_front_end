import 'dart:async';
import 'dart:io' show Platform;

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/place_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/google_map_place_picker.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/circle_area.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

typedef IntroModalWidgetBuilder = Widget Function(
  BuildContext context,
  Function? close,
);

enum PinState { preparing, idle, dragging }

enum SearchingState { idle, searching }

class PlacePicker extends StatefulWidget {
  const PlacePicker({
    super.key,
    required this.apiKey,
    this.onPlacePicked,
    required this.initialPosition,
    this.useCurrentLocation,
    this.desiredLocationAccuracy = LocationAccuracy.high,
    this.onMapCreated,
    this.hintText,
    this.searchingText,
    this.selectText,
    this.outsideOfPickAreaText,
    this.onGeocodingSearchFailed,
    this.proxyBaseUrl,
    this.httpClient,
    this.selectedPlaceWidgetBuilder,
    this.pinBuilder,
    this.introModalWidgetBuilder,
    this.autoCompleteDebounceInMilliseconds = 500,
    this.cameraMoveDebounceInMilliseconds = 750,
    this.initialMapType = MapType.normal,
    this.myLocationButtonCooldown = 10,
    this.usePinPointingSearch = true,
    this.usePlaceDetailSearch = false,
    this.autocompleteOffset,
    this.autocompleteRadius,
    this.autocompleteLanguage,
    this.autocompleteComponents,
    this.autocompleteTypes,
    this.strictbounds,
    this.region,
    this.pickArea,
    this.selectInitialPosition = false,
    this.resizeToAvoidBottomInset = true,
    this.initialSearchString,
    this.searchForInitialValue = false,
    this.forceSearchOnZoomChanged = false,
    this.automaticallyImplyAppBarLeading = true,
    this.autocompleteOnTrailingWhitespace = false,
    this.hidePlaceDetailsWhenDraggingPin = true,
    this.ignoreLocationPermissionErrors = false,
    this.onTapBack,
    this.onCameraMoveStarted,
    this.onCameraMove,
    this.onCameraIdle,
    this.onMapTypeChanged,
    this.zoomGesturesEnabled = true,
  });

  final String apiKey;

  final LatLng initialPosition;
  final bool? useCurrentLocation;
  final LocationAccuracy desiredLocationAccuracy;

  final String? hintText;
  final String? searchingText;
  final String? selectText;
  final String? outsideOfPickAreaText;


  final ValueChanged<String>? onGeocodingSearchFailed;
  final int autoCompleteDebounceInMilliseconds;
  final int cameraMoveDebounceInMilliseconds;

  final MapType initialMapType;
  final int myLocationButtonCooldown;

  final bool usePinPointingSearch;
  final bool usePlaceDetailSearch;

  final num? autocompleteOffset;
  final num? autocompleteRadius;
  final String? autocompleteLanguage;
  final List<String>? autocompleteTypes;
  final List<Component>? autocompleteComponents;
  final bool? strictbounds;
  final String? region;

  /// If set the picker can only pick addresses in the given circle area.
  /// The section will be highlighted.
  final CircleArea? pickArea;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool resizeToAvoidBottomInset;

  final bool selectInitialPosition;

  /// By using default setting of Place Picker, it will result result when user hits the select here button.
  ///
  /// If you managed to use your own [selectedPlaceWidgetBuilder], then this WILL NOT be invoked, and you need use data which is
  /// being sent with [selectedPlaceWidgetBuilder].
  final ValueChanged<PickResult>? onPlacePicked;

  /// optional - builds selected place's UI
  ///
  /// It is provided by default if you leave it as a null.
  /// INPORTANT: If this is non-null, [onPlacePicked] will not be invoked, as there will be no default 'Select here' button.
  final SelectedPlaceWidgetBuilder? selectedPlaceWidgetBuilder;

  /// optional - builds customized pin widget which indicates current pointing position.
  ///
  /// It is provided by default if you leave it as a null.
  final PinBuilder? pinBuilder;

  /// optional - builds customized introduction panel.
  ///
  /// None is provided / the map is instantly accessible if you leave it as a null.
  final IntroModalWidgetBuilder? introModalWidgetBuilder;

  /// optional - sets 'proxy' value in google_maps_webservice
  ///
  /// In case of using a proxy the baseUrl can be set.
  /// The apiKey is not required in case the proxy sets it.
  /// (Not storing the apiKey in the app is good practice)
  final String? proxyBaseUrl;

  /// optional - set 'client' value in google_maps_webservice
  ///
  /// In case of using a proxy url that requires authentication
  /// or custom configuration
  final BaseClient? httpClient;

  /// Initial value of autocomplete search
  final String? initialSearchString;

  /// Whether to search for the initial value or not
  final bool searchForInitialValue;

  /// Allow searching place when zoom has changed. By default searching is disabled when zoom has changed in order to prevent unwilling API usage.
  final bool forceSearchOnZoomChanged;

  /// Whether to display appbar backbutton. Defaults to true.
  final bool automaticallyImplyAppBarLeading;

  /// Will perform an autocomplete search, if set to true. Note that setting
  /// this to true, while providing a smoother UX experience, may cause
  /// additional unnecessary queries to the Places API.
  ///
  /// Defaults to false.
  final bool autocompleteOnTrailingWhitespace;

  /// Whether to hide place details when dragging pin. Defaults to true.
  final bool hidePlaceDetailsWhenDraggingPin;

  /// Whether to ignore location permission errors. Defaults to false.
  /// If this is set to `true` the UI will be blocked.
  final bool ignoreLocationPermissionErrors;

  // Raised when clicking on the back arrow.
  // This will not listen for the system back button on Android devices.
  // If this is not set, but the back button is visible through automaticallyImplyLeading,
  // the Navigator will try to pop instead.
  final VoidCallback? onTapBack;

  /// GoogleMap pass-through events:

  /// Callback method for when the map is ready to be used.
  ///
  /// Used to receive a [GoogleMapController] for this [GoogleMap].
  final MapCreatedCallback? onMapCreated;

  /// Called when the camera starts moving.
  ///
  /// This can be initiated by the following:
  /// 1. Non-gesture animation initiated in response to user actions.
  ///    For example: zoom buttons, my location button, or marker clicks.
  /// 2. Programmatically initiated animation.
  /// 3. Camera motion initiated in response to user gestures on the map.
  ///    For example: pan, tilt, pinch to zoom, or rotate.
  final Function(PlaceProvider)? onCameraMoveStarted;

  /// Called repeatedly as the camera continues to move after an
  /// onCameraMoveStarted call.
  ///
  /// This may be called as often as once every frame and should
  /// not perform expensive operations.
  final CameraPositionCallback? onCameraMove;

  /// Called when camera movement has ended, there are no pending
  /// animations and the user has stopped interacting with the map.
  final Function(PlaceProvider)? onCameraIdle;

  /// Called when the map type has been changed.
  final Function(MapType)? onMapTypeChanged;

  /// Toggle on & off zoom gestures
  final bool zoomGesturesEnabled;

  @override
  PlacePickerState createState() => PlacePickerState();
}

class PlacePickerState extends State<PlacePicker> {
  GlobalKey appBarKey = GlobalKey();
  late final Future<PlaceProvider> _futureProvider;
  PlaceProvider? provider;
  bool showIntroModal = true;

  @override
  void initState() {
    super.initState();

    _futureProvider = _initPlaceProvider();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Future<PlaceProvider> _initPlaceProvider() async {
    final headers = await const GoogleApiHeaders().getHeaders();
    final provider = PlaceProvider(
      widget.apiKey,
      widget.proxyBaseUrl,
      widget.httpClient,
      headers,
    );
    provider.sessionToken = const Uuid().v4();
    provider.desiredAccuracy = widget.desiredLocationAccuracy;
    provider.setMapType(widget.initialMapType);
    if (widget.useCurrentLocation != null && widget.useCurrentLocation!) {
      await provider.updateCurrentLocation(
          gracefully: widget.ignoreLocationPermissionErrors);
    }
    return provider;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlaceProvider>(
      future: _futureProvider,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          provider = snapshot.data;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PlaceProvider>.value(value: provider!),
            ],
            child: Stack(children: [
              Scaffold(
                key: ValueKey<int>(provider.hashCode),
                resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  key: appBarKey,
                  automaticallyImplyLeading: false,
                  iconTheme: Theme.of(context).iconTheme,
                  elevation: 0,
                  titleSpacing: 0.0,
                  backgroundColor: Colors.transparent,
                  title: _buildSearchBar(context),
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                body: _buildMapWithLocation(),
              ),
              _buildIntroModal(context),
            ]),
          );
        }

        final children = <Widget>[];
        if (snapshot.hasError) {
          children.addAll([
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ]);
        } else {
          children.add(const CircularProgressIndicator());
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return provider!.placeSearchingState == SearchingState.idle &&
        (widget.automaticallyImplyAppBarLeading ||
            widget.onTapBack != null)
        ? GestureDetector(
      onTap: () {
        if (!showIntroModal ||
            widget.introModalWidgetBuilder == null) {
          provider?.debounceTimer?.cancel();
          if (widget.onTapBack != null) {
            widget.onTapBack!();
            return;
          }
          Navigator.maybePop(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 44,
        width: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: beigeTransparent),
        child: Center(
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          ),
        ),
      ),
    )
        : Container();
  }



  Widget _buildMapWithLocation() {
    if (provider!.currentPosition == null) {
      return _buildMap(widget.initialPosition);
    }
    return _buildMap(LatLng(provider!.currentPosition!.latitude,
        provider!.currentPosition!.longitude));
  }

  Widget _buildMap(LatLng initialTarget) {
    return GoogleMapPlacePicker(
      fullMotion: !widget.resizeToAvoidBottomInset,
      initialTarget: initialTarget,
      appBarKey: appBarKey,
      selectedPlaceWidgetBuilder: widget.selectedPlaceWidgetBuilder,
      pinBuilder: widget.pinBuilder,
      onSearchFailed: widget.onGeocodingSearchFailed,
      debounceMilliseconds: widget.cameraMoveDebounceInMilliseconds,
      usePinPointingSearch: widget.usePinPointingSearch,
      usePlaceDetailSearch: widget.usePlaceDetailSearch,
      onMapCreated: widget.onMapCreated,
      selectInitialPosition: widget.selectInitialPosition,
      language: widget.autocompleteLanguage,
      pickArea: widget.pickArea,
      forceSearchOnZoomChanged: widget.forceSearchOnZoomChanged,
      hidePlaceDetailsWhenDraggingPin: widget.hidePlaceDetailsWhenDraggingPin,
      selectText: widget.selectText,
      outsideOfPickAreaText: widget.outsideOfPickAreaText,
      onToggleMapType: () {
        if (provider == null) return;
        provider!.switchMapType();
        if (widget.onMapTypeChanged != null) {
          widget.onMapTypeChanged!(provider!.mapType);
        }
      },
      onMoveStart: () {
        if (provider == null) return;
      },
      onPlacePicked: widget.onPlacePicked,
      onCameraMoveStarted: widget.onCameraMoveStarted,
      onCameraMove: widget.onCameraMove,
      onCameraidle: widget.onCameraIdle,
      zoomGesturesEnabled: widget.zoomGesturesEnabled,
    );
  }

  Widget _buildIntroModal(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return showIntroModal && widget.introModalWidgetBuilder != null
          ? Stack(children: [
              const Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: Material(
                  type: MaterialType.canvas,
                  color: Color.fromARGB(128, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ClipRect(),
                ),
              ),
              widget.introModalWidgetBuilder!(context, () {
                if (mounted) {
                  setState(() {
                    showIntroModal = false;
                  });
                }
              })
            ])
          : Container();
    });
  }
}
