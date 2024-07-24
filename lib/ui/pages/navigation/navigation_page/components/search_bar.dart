import 'package:chance_app/api_keys.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/controllers/autocomplete_search_controller.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/place_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/autocomplete_search.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/place_picker.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/select_place.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, MultiProvider;
import 'package:uuid/uuid.dart';

enum MenuItems {
  add,
  checkInvitation,
  myWards,
}

extension MenuItemDetails on MenuItems {
  int get id {
    switch (this) {
      case MenuItems.add:
        return 0;
      case MenuItems.checkInvitation:
        return 1;
      case MenuItems.myWards:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case MenuItems.add:
        return AppLocalizations.instance.translate("addWard");
      case MenuItems.checkInvitation:
        return AppLocalizations.instance.translate("invitation");
      case MenuItems.myWards:
        return AppLocalizations.instance.translate("myWards");
    }
  }
}

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {super.key, required this.appBarKey, required this.width});

  final GlobalKey appBarKey;
  final double width;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final Future<PlaceProvider> _futureProvider;
  PlaceProvider? provider;
  SearchBarController searchBarController = SearchBarController();
  MeUser meUser = HiveCRUD().user!;
  List<Map<String, dynamic>> predictionsForMapView = [];
  List<Prediction> predictionsForTapMapView = [];
  bool isPredictionsShow = false;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<PickResult> savedAddresses = HiveCRUD()
      .savedAddresses
      .where((element) => element.isRecentlySearched == true)
      .toList();
  MenuController menuController = MenuController();

  @override
  void initState() {
    _futureProvider = _initPlaceProvider();
    focusNode.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  Future<PlaceProvider> _initPlaceProvider() async {
    final headers = await const GoogleApiHeaders().getHeaders();
    final provider = PlaceProvider(
      googleAPIKey,
      null,
      null,
      headers,
    );
    provider.sessionToken = const Uuid().v4();
    provider.setMapType(
      meUser.mapType == 0
          ? MapType.normal
          : meUser.mapType == 1
              ? MapType.terrain
              : MapType.hybrid,
    );
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
                child: SizedBox(
                  width: widget.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: beigeTransparent,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.black26,
                                  offset: Offset(0, 0),
                                  spreadRadius: 2,
                                  blurStyle: BlurStyle.normal)
                            ],
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widget.width - 60,
                              child: AutoCompleteSearch(
                                textEditingController: textEditingController,
                                appBarKey: widget.appBarKey,
                                searchBarController: searchBarController,
                                sessionToken: provider!.sessionToken,
                                hintText: AppLocalizations.instance
                                    .translate("search"),
                                searchingText:
                                    "${AppLocalizations.instance.translate("search")}...",
                                focusNode: focusNode,
                                onPicked: (prediction) {
                                  //if (mounted) {
                                  //  _pickPrediction(prediction);
                                  //}
                                },
                                onTap: () {
                                  isPredictionsShow = true;
                                  if (mounted) setState(() {});
                                },
                                onTapCancel: () {
                                  predictionsForMapView.clear();
                                  predictionsForTapMapView.clear();
                                  isPredictionsShow = false;
                                  if (mounted) setState(() {});
                                },
                                prediction: (predictions) {
                                  predictionsForMapView = predictions
                                      .map((e) => {
                                            "id": e.id,
                                            "description": e.description,
                                            "distanceMeters": e.distanceMeters,
                                          })
                                      .toList();
                                  predictionsForTapMapView = predictions;
                                  if (mounted) setState(() {});
                                },
                              ),
                            ),
                            const Spacer(),
                            PopupMenuButton(
                                color: darkNeutral800,
                                surfaceTintColor: darkNeutral800,
                                child: SvgPicture.asset(
                                  "assets/icons/dots_vertical.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                onSelected: (e) async {
                                  switch (e) {
                                    case MenuItems.add:
                                      await Navigator.of(context)
                                          .pushNamed("/add_ward")
                                          .then((result) {
                                        //if (result is bool && result) {
                                        //  showDialog(
                                        //      context: context,
                                        //      builder: (context) {
                                        //        return AlertDialog(
                                        //          title: Column(
                                        //            children: [
                                        //              Icon(
                                        //                Icons.done,
                                        //                color: primaryText,
                                        //              ),
                                        //              const SizedBox(
                                        //                height: 24,
                                        //              ),
                                        //              Text(
                                        //                AppLocalizations.instance.translate("search")"Код надіслано",
                                        //                textAlign:
                                        //                    TextAlign.center,
                                        //                style: TextStyle(
                                        //                    color: primaryText,
                                        //                    fontSize: 20),
                                        //              ),
                                        //            ],
                                        //          ),
                                        //          content: const Text(
                                        //            AppLocalizations.instance.translate("search")"Встановіть застосунок Chance app на телефоні підопічного та введіть в меню надісланий код",
                                        //            textAlign: TextAlign.center,
                                        //          ),
                                        //          actions: [
                                        //            TextButton(
                                        //                onPressed: () {
                                        //                  Navigator.of(context)
                                        //                      .pop();
                                        //                },
                                        //                child: Text(
                                        //                  "OK",
                                        //                  style: TextStyle(
                                        //                      fontSize: 16,
                                        //                      color:
                                        //                          primary700),
                                        //                )),
                                        //          ],
                                        //        );
                                        //      });
                                        //}
                                      });
                                      break;
                                    case MenuItems.checkInvitation:
                                      Navigator.of(context)
                                          .pushNamed("/check_my_invitation");
                                      break;
                                    case MenuItems.myWards:
                                      await Navigator.of(context)
                                          .pushNamed("/my_wards");
                                      break;
                                  }
                                },
                                itemBuilder: (context) =>
                                    MenuItems.values.map((e) {
                                      return PopupMenuItem(
                                        value: e,
                                        child: Text(
                                          e.name,
                                          style: const TextStyle(
                                              color: primary50, fontSize: 16),
                                        ),
                                      );
                                    }).toList()),
                          ],
                        ),
                      ),
                      if ((predictionsForMapView.isNotEmpty ||
                              savedAddresses.isNotEmpty) &&
                          isPredictionsShow &&
                          focusNode.hasFocus)
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: beigeTransparent,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 6,
                                    color: Colors.black26,
                                    offset: Offset(0, 0),
                                    spreadRadius: 2,
                                    blurStyle: BlurStyle.normal)
                              ],
                              borderRadius: BorderRadius.circular(16)),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: predictionsForMapView.isNotEmpty
                                  ? predictionsForTapMapView.length
                                  : savedAddresses.length,
                              itemBuilder: (context, position) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (predictionsForTapMapView.isNotEmpty) {
                                      await _pickPrediction(
                                              predictionsForTapMapView[
                                                  position])
                                          .then((value) async {
                                        if (value == null) return;
                                        double? lat =
                                                value.geometry?.location.lat,
                                            lng = value.geometry?.location.lng;
                                        PointLatLng? pointLatLng;
                                        if (lat == null || lng == null) {
                                          pointLatLng =
                                              await getPositionOfPoint(value);
                                        } else {
                                          pointLatLng = PointLatLng(lat, lng);
                                        }
                                        if (pointLatLng != null) {
                                          Marker point = Marker(
                                              markerId: const MarkerId("point"),
                                              draggable: false,
                                              position: LatLng(
                                                  pointLatLng.latitude,
                                                  pointLatLng.longitude),
                                              icon: await getMarkerIcon(
                                                      PickResultFor.first) ??
                                                  await BitmapDescriptor.fromAssetImage(
                                                      const ImageConfiguration(),
                                                      "assets/icons/point_a.png"),
                                              infoWindow: InfoWindow(
                                                  title: value.name,
                                                  snippet:
                                                      value.formattedAddress,
                                                  onTap: () {
                                                    isNotTapedOnMyLocationButton =
                                                        true;
                                                    mapController!.animateCamera(
                                                        CameraUpdate.newLatLngZoom(
                                                            LatLng(
                                                                pointLatLng!
                                                                    .latitude,
                                                                pointLatLng
                                                                    .longitude),
                                                            18));
                                                  }));

                                          await HiveCRUD()
                                              .addSavedAddresses(value)
                                              .whenComplete(() {
                                            isNotTapedOnMyLocationButton = true;
                                            mapController!.animateCamera(
                                                CameraUpdate.newLatLngZoom(
                                                    LatLng(
                                                        pointLatLng!.latitude,
                                                        pointLatLng.longitude),
                                                    18));

                                            predictionsForMapView.clear();
                                            predictionsForTapMapView.clear();
                                            isPredictionsShow = false;
                                            textEditingController.text =
                                                value.formattedAddress!;
                                            BlocProvider.of<NavigationBloc>(
                                                    context)
                                                .add(UpdateMarkers(
                                                    markers: {point}));
                                            focusNode.unfocus();
                                          });
                                        }
                                      });
                                    } else {
                                      Marker point = Marker(
                                          markerId: const MarkerId("point"),
                                          draggable: false,
                                          position: LatLng(
                                              savedAddresses[position]
                                                  .geometry!
                                                  .location
                                                  .lat,
                                              savedAddresses[position]
                                                  .geometry!
                                                  .location
                                                  .lng),
                                          icon: await getMarkerIcon(
                                                  PickResultFor.first) ??
                                              await BitmapDescriptor
                                                  .fromAssetImage(
                                                      const ImageConfiguration(),
                                                      "assets/icons/point_a.png"),
                                          infoWindow: InfoWindow(
                                              title:
                                                  savedAddresses[position].name,
                                              snippet: savedAddresses[position]
                                                  .formattedAddress,
                                              onTap: () {
                                                isNotTapedOnMyLocationButton =
                                                    true;
                                                mapController!.animateCamera(
                                                    CameraUpdate.newLatLngZoom(
                                                        LatLng(
                                                            savedAddresses[
                                                                    position]
                                                                .geometry!
                                                                .location
                                                                .lat,
                                                            savedAddresses[
                                                                    position]
                                                                .geometry!
                                                                .location
                                                                .lng),
                                                        18));
                                              }));
                                      isNotTapedOnMyLocationButton = true;
                                      mapController!.animateCamera(
                                          CameraUpdate.newLatLngZoom(
                                              LatLng(
                                                  savedAddresses[position]
                                                      .geometry!
                                                      .location
                                                      .lat,
                                                  savedAddresses[position]
                                                      .geometry!
                                                      .location
                                                      .lng),
                                              18));

                                      predictionsForMapView.clear();
                                      predictionsForTapMapView.clear();
                                      isPredictionsShow = false;
                                      textEditingController.text =
                                          savedAddresses[position]
                                              .formattedAddress!;
                                     if(mounted){
                                       // ignore: use_build_context_synchronously
                                       BlocProvider.of<NavigationBloc>(context)
                                           .add(UpdateMarkers(markers: {point}));
                                     }
                                      focusNode.unfocus();
                                    }
                                    if (mounted) setState(() {});
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: darkNeutral600))),
                                    child: Row(
                                      children: [
                                        Icon(predictionsForTapMapView.isNotEmpty
                                            ? Icons.location_on_outlined
                                            : Icons.access_time),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Text(
                                          predictionsForMapView.isNotEmpty
                                              ? predictionsForMapView[position]
                                                  ["description"]
                                              : savedAddresses[position]
                                                  .formattedAddress,
                                          style: const TextStyle(
                                              fontSize: 16, color: primaryText),
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                    ],
                  ),
                ));
          }
          return const SizedBox();
        });
  }

  Future<PickResult?> _pickPrediction(Prediction prediction) async {
    if (provider == null) return null;
    provider!.placeSearchingState = SearchingState.searching;

    final PlacesDetailsResponse response =
        await provider!.places.getDetailsByPlaceId(
      prediction.placeId!,
      sessionToken: provider!.sessionToken,
    );

    if (response.errorMessage?.isNotEmpty == true ||
        response.status == "REQUEST_DENIED") {
      return null;
    }

    provider!.selectedPlace = getPickResult(response.result);

    provider!.isAutoCompleteSearching = true;

    provider!.placeSearchingState = SearchingState.idle;
    return provider!.selectedPlace;
  }
}
