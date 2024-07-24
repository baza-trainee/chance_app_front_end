import 'dart:async';

import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/place_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/components/animated_pin.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/components/floating_card.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/bounds.dart'
    as mybounds;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/circle_area.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geocoding_result.dart'
    as my;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geometry.dart'
    as mygeometry;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/location.dart'
    as mylocation;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/address_component.dart'
as myaddresscomponent;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/place_picker.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/geocoding.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

typedef SelectedPlaceWidgetBuilder = Widget Function(
  BuildContext context,
  PickResult? selectedPlace,
  SearchingState state,
  bool isSearchBarFocused,
);

typedef PinBuilder = Widget Function(
  BuildContext context,
  PinState state,
);

class GoogleMapPlacePicker extends StatefulWidget {
  const GoogleMapPlacePicker({
    super.key,
    required this.initialTarget,
    required this.appBarKey,
    this.selectedPlaceWidgetBuilder,
    this.pinBuilder,
    this.onSearchFailed,
    this.onMoveStart,
    this.onMapCreated,
    this.debounceMilliseconds,
    this.onToggleMapType,
    this.onmylocation,
    this.onPlacePicked,
    this.usePinPointingSearch,
    this.usePlaceDetailSearch,
    this.selectInitialPosition,
    this.language,
    this.pickArea,
    this.forceSearchOnZoomChanged,
    this.hidePlaceDetailsWhenDraggingPin,
    this.onCameraMoveStarted,
    this.onCameraMove,
    this.onCameraidle,
    this.selectText,
    this.outsideOfPickAreaText,
    this.zoomGesturesEnabled = true,
    this.fullMotion = false,
  });

  final LatLng initialTarget;
  final GlobalKey appBarKey;

  final SelectedPlaceWidgetBuilder? selectedPlaceWidgetBuilder;
  final PinBuilder? pinBuilder;

  final ValueChanged<String>? onSearchFailed;
  final VoidCallback? onMoveStart;
  final MapCreatedCallback? onMapCreated;
  final VoidCallback? onToggleMapType;
  final VoidCallback? onmylocation;
  final ValueChanged<PickResult>? onPlacePicked;

  final int? debounceMilliseconds;

  final bool? usePinPointingSearch;
  final bool? usePlaceDetailSearch;

  final bool? selectInitialPosition;

  final String? language;
  final CircleArea? pickArea;

  final bool? forceSearchOnZoomChanged;
  final bool? hidePlaceDetailsWhenDraggingPin;

  /// GoogleMap pass-through events:
  final Function(PlaceProvider)? onCameraMoveStarted;
  final CameraPositionCallback? onCameraMove;
  final Function(PlaceProvider)? onCameraidle;

  // strings
  final String? selectText;
  final String? outsideOfPickAreaText;

  /// Zoom feature toggle
  final bool zoomGesturesEnabled;

  /// Use never scrollable scroll-view with maximum dimensions to prevent unnecessary re-rendering.
  final bool fullMotion;

  @override
  State<GoogleMapPlacePicker> createState() => _GoogleMapPlacePickerState();
}

class _GoogleMapPlacePickerState extends State<GoogleMapPlacePicker> {
  MeUser meUser = HiveCRUD().user!;

  _searchByCameraLocation(PlaceProvider provider) async {
    // We don't want to search location again if camera location is changed by zooming in/out.
    if (widget.forceSearchOnZoomChanged == false &&
        provider.prevCameraPosition != null &&
        provider.prevCameraPosition!.target.latitude ==
            provider.cameraPosition!.target.latitude &&
        provider.prevCameraPosition!.target.longitude ==
            provider.cameraPosition!.target.longitude) {
      provider.placeSearchingState = SearchingState.idle;
      return;
    }

    if (provider.cameraPosition == null) {
      // Camera position cannot be determined for some reason ...
      provider.placeSearchingState = SearchingState.idle;
      return;
    }

    provider.placeSearchingState = SearchingState.searching;

    final GeocodingResponse response =
        await provider.geocoding.searchByLocation(
      Location(
          lat: provider.cameraPosition!.target.latitude,
          lng: provider.cameraPosition!.target.longitude),
      language: widget.language,
    );

    if (response.errorMessage?.isNotEmpty == true ||
        response.status == "REQUEST_DENIED") {
      FlutterError("Camera Location Search Error: ${response.errorMessage!}");
      if (widget.onSearchFailed != null) {
        widget.onSearchFailed!(response.status);
      }
      provider.placeSearchingState = SearchingState.idle;
      return;
    }

    if (widget.usePlaceDetailSearch!) {
      final PlacesDetailsResponse detailResponse =
          await provider.places.getDetailsByPlaceId(
        response.results[0].placeId,
        language: widget.language,
      );

      if (detailResponse.errorMessage?.isNotEmpty == true ||
          detailResponse.status == "REQUEST_DENIED") {
        FlutterError("Fetching details by placeId Error: ${detailResponse.errorMessage!}");
        if (widget.onSearchFailed != null) {
          widget.onSearchFailed!(detailResponse.status);
        }
        provider.placeSearchingState = SearchingState.idle;
        return;
      }

      provider.selectedPlace =
          PickResult.fromJson(detailResponse.result.toJson());
    } else {
      Map<String, dynamic> map = response.results[0].toJson();
      map["geometry"] = mygeometry.Geometry(
              location: mylocation.Location(
                  lat: response.results[0].geometry.location.lat,
                  lng: response.results[0].geometry.location.lng),
              locationType: response.results[0].geometry.locationType,
              viewport: response.results[0].geometry.viewport != null
                  ? mybounds.Bounds(
                      northeast: mylocation.Location(
                          lat: response
                              .results[0].geometry.viewport!.northeast.lat,
                          lng: response
                              .results[0].geometry.viewport!.northeast.lng),
                      southwest: mylocation.Location(
                          lat: response
                              .results[0].geometry.viewport!.southwest.lat,
                          lng: response
                              .results[0].geometry.viewport!.southwest.lng))
                  : null,
              bounds: response.results[0].geometry.bounds != null
                  ? mybounds.Bounds(northeast: mylocation.Location(lat: response.results[0].geometry.bounds!.northeast.lat, lng: response.results[0].geometry.bounds!.northeast.lng), southwest: mylocation.Location(lat: response.results[0].geometry.bounds!.southwest.lat, lng: response.results[0].geometry.bounds!.southwest.lng))
                  : null)
          .toJson();
      map["address_components"] = response.results[0].addressComponents
          .map((e) => myaddresscomponent.AddressComponent(
          types: e.types, longName: e.longName, shortName: e.shortName))
          .toList();

      provider.selectedPlace =
          PickResult.fromGeocodingResult(my.GeocodingResult.fromJson(map));
    }

    provider.placeSearchingState = SearchingState.idle;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildPin(),
          _buildFloatingCard(),
          _buildMapIcons(context, size),
        ],
      ),
    );
  }

  Widget _buildGoogleMapInner(PlaceProvider provider, MapType mapType) {
    CameraPosition initialCameraPosition =
        CameraPosition(target: widget.initialTarget, zoom: 15);
    return GoogleMap(
      zoomGesturesEnabled: widget.zoomGesturesEnabled,
      zoomControlsEnabled: false,
      // we use our own implementation that supports iOS as well, see _buildZoomButtons()
      myLocationButtonEnabled: false,
      compassEnabled: false,
      mapToolbarEnabled: false,
      initialCameraPosition: initialCameraPosition,
      mapType: mapType,
      myLocationEnabled: true,
      circles: widget.pickArea != null && widget.pickArea!.radius > 0
          // ignore: prefer_collection_literals
          ? Set<Circle>.from([widget.pickArea])
          : <Circle>{},
      onMapCreated: (GoogleMapController controller) {
        provider.mapController = controller;
        provider.setCameraPosition(null);
        provider.pinState = PinState.idle;

        // When select initialPosition set to true.
        if (widget.selectInitialPosition!) {
          provider.setCameraPosition(initialCameraPosition);
          _searchByCameraLocation(provider);
        }
        widget.onMapCreated?.call(controller);
      },
      onCameraIdle: () {
        if (provider.isAutoCompleteSearching) {
          provider.isAutoCompleteSearching = false;
          provider.pinState = PinState.idle;
          provider.placeSearchingState = SearchingState.idle;
          return;
        }
        // Perform search only if the setting is to true.
        if (widget.usePinPointingSearch!) {
          // Search current camera location only if camera has moved (dragged) before.
          if (provider.pinState == PinState.dragging) {
            // Cancel previous timer.
            if (provider.debounceTimer?.isActive ?? false) {
              provider.debounceTimer!.cancel();
            }
            provider.debounceTimer =
                Timer(Duration(milliseconds: widget.debounceMilliseconds!), () {
              _searchByCameraLocation(provider);
            });
          }
        }
        provider.pinState = PinState.idle;
        widget.onCameraidle?.call(provider);
      },
      onCameraMoveStarted: () {
        widget.onCameraMoveStarted?.call(provider);
        provider.setPrevCameraPosition(provider.cameraPosition);
        // Cancel any other timer.
        provider.debounceTimer?.cancel();
        // Update state, dismiss keyboard and clear text.
        provider.pinState = PinState.dragging;
        // Begins the search state if the hide details is enabled
        if (widget.hidePlaceDetailsWhenDraggingPin!) {
          provider.placeSearchingState = SearchingState.searching;
        }
        widget.onMoveStart!();
      },
      onCameraMove: (CameraPosition position) {
        provider.setCameraPosition(position);
        widget.onCameraMove?.call(position);
      },
      // gestureRecognizers make it possible to navigate the map when it's a
      // child in a scroll view e.g ListView, SingleChildScrollView...
      gestureRecognizers: {}
        ..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Selector<PlaceProvider, MapType>(
        selector: (_, provider) => provider.mapType,
        builder: (_, data, __) => _buildGoogleMapInner(
            PlaceProvider.of(context, listen: false), data));
  }

  Widget _buildPin() {
    return Center(
      child: Selector<PlaceProvider, PinState>(
        selector: (_, provider) => provider.pinState,
        builder: (context, state, __) {
          if (widget.pinBuilder == null) {
            return _defaultPinBuilder(context, state);
          } else {
            return Builder(
                builder: (builderContext) =>
                    widget.pinBuilder!(builderContext, state));
          }
        },
      ),
    );
  }

  Widget _defaultPinBuilder(BuildContext context, PinState state) {
    if (state == PinState.preparing) {
      return Container();
    } else if (state == PinState.idle) {
      return Stack(
        children: <Widget>[
           const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.place, size: 36, color: red900),
                SizedBox(height: 42),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedPin(child: Icon(Icons.place, size: 36, color: red900)),
                SizedBox(height: 42),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildFloatingCard() {
    return Selector<PlaceProvider,
        Tuple4<PickResult?, SearchingState, bool, PinState>>(
      selector: (_, provider) => Tuple4(
          provider.selectedPlace,
          provider.placeSearchingState,
          provider.isSearchBarFocused,
          provider.pinState),
      builder: (context, data, __) {
        if ((data.item1 == null && data.item2 == SearchingState.idle) ||
            data.item3 == true ||
            data.item4 == PinState.dragging &&
                widget.hidePlaceDetailsWhenDraggingPin!) {
          return Container();
        } else {
          if (widget.selectedPlaceWidgetBuilder == null) {
            return _defaultPlaceWidgetBuilder(context, data.item1, data.item2);
          } else {
            return Builder(
                builder: (builderContext) => widget.selectedPlaceWidgetBuilder!(
                    builderContext, data.item1, data.item2, data.item3));
          }
        }
      },
    );
  }

  Widget _defaultPlaceWidgetBuilder(
      BuildContext context, PickResult? data, SearchingState state) {
    return FloatingCard(
      bottomPosition: MediaQuery.of(context).size.height * 0.1,
      leftPosition: MediaQuery.of(context).size.width * 0.15,
      rightPosition: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.7,
      borderRadius: BorderRadius.circular(12.0),
      elevation: 4.0,
      color: Theme.of(context).cardColor,
      child: state == SearchingState.searching
          ? _buildLoadingIndicator()
          : _buildSelectionDetails(context, data!),
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      height: 48,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildSelectionDetails(BuildContext context, PickResult result) {
    bool canBePicked = widget.pickArea == null ||
        widget.pickArea!.radius <= 0 ||
        Geolocator.distanceBetween(
                widget.pickArea!.center.latitude,
                widget.pickArea!.center.longitude,
                result.geometry!.location.lat,
                result.geometry!.location.lng) <=
            widget.pickArea!.radius;
    MaterialStateColor buttonColor = MaterialStateColor.resolveWith(
        (states) => canBePicked ? green : red900);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            result.formattedAddress!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          (canBePicked && (widget.selectText?.isEmpty ?? true)) ||
                  (!canBePicked &&
                      (widget.outsideOfPickAreaText?.isEmpty ?? true))
              ? SizedBox.fromSize(
                  size: const Size(56, 56), // button width and height
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                          overlayColor: buttonColor,
                          onTap: () {
                            if (canBePicked) {
                              widget.onPlacePicked!(result);
                            }
                          },
                          child: Icon(
                              canBePicked
                                  ? Icons.check_sharp
                                  : Icons.app_blocking_sharp,
                              color: buttonColor)),
                    ),
                  ),
                )
              : SizedBox.fromSize(
                  size: Size(MediaQuery.of(context).size.width * 0.8,
                      56), // button width and height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Material(
                      child: InkWell(
                          overlayColor: buttonColor,
                          onTap: () {
                            if (canBePicked) {
                              widget.onPlacePicked!(result);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  canBePicked
                                      ? Icons.check_sharp
                                      : Icons.app_blocking_sharp,
                                  color: buttonColor),
                              SizedBox.fromSize(size: const Size(10, 0)),
                              Text(
                                  canBePicked
                                      ? widget.selectText!
                                      : widget.outsideOfPickAreaText!,
                                  style: TextStyle(color: buttonColor))
                            ],
                          )),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildMapIcons(BuildContext context, Size size) {
    if (widget.appBarKey.currentContext == null) {
      return Container();
    }
    final RenderBox appBarRenderBox =
        widget.appBarKey.currentContext!.findRenderObject() as RenderBox;
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: appBarRenderBox.size.height,
            ),
            GestureDetector(
              onTap: () async {
                meUser = meUser.copyWith(mapType: 0);
                await HiveCRUD()
                    .updateUser(meUser)
                    .whenComplete(() => setState(() {}));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  color: meUser.mapType == 0 ? primary400 : beigeTransparent,
                ),
                child: Icon(Icons.map,
                    color:
                        meUser.mapType == 0 ? beigeTransparent : primaryText),
              ),
            ),
            GestureDetector(
              onTap: () async {
                meUser = meUser.copyWith(mapType: 1);
                await HiveCRUD()
                    .updateUser(meUser)
                    .whenComplete(() => setState(() {}));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  color: meUser.mapType == 1 ? primary400 : beigeTransparent,
                ),
                child: Icon(Icons.terrain,
                    color:
                        meUser.mapType == 1 ? beigeTransparent : primaryText),
              ),
            ),
            GestureDetector(
              onTap: () async {
                meUser = meUser.copyWith(mapType: 2);
                await HiveCRUD()
                    .updateUser(meUser)
                    .whenComplete(() => setState(() {}));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(90)),
                  color: meUser.mapType == 2 ? primary400 : beigeTransparent,
                ),
                child: Icon(Icons.satellite_alt,
                    color:
                        meUser.mapType == 2 ? beigeTransparent : primaryText),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: widget.onmylocation,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  color: beigeTransparent,
                ),
                child: const Icon(Icons.location_searching, color: primaryText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
