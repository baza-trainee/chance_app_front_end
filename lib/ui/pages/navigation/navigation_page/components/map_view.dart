import 'package:bottom_picker/resources/context_extension.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/build_route_bottom_sheet.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/saved_addresses_component.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:chance_app/ux/position_controller.dart';
import 'package:chance_app/ux/ward_position_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  MeUser meUser = HiveCRUD().user!;
  late AnimationController _controllerMyLocation,
      _controllerCloseMap,
      _controllerBuildPath,
      _controllerNormalMap,
      _controllerHybridMap,
      _controllerTerrainMap;
  double scaleMyLocation = 0,
      scaleBuildPath = 0,
      scaleCloseMap = 0,
      scaleNormalMap = 0,
      scaleTerrainMap = 0,
      scaleHybridMap = 0;
  late WardPositionController wardPositionController;

  Future<bool> checkLocationPermission(BuildContext context) async {
    bool isOkay = false;
    await Permission.location.request().then((status) async {
      if (status != PermissionStatus.denied &&
          status != PermissionStatus.permanentlyDenied) {
        isOkay = true;
      }
      if (!isOkay) {
        if (mounted) {
          await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    AppLocalizations.instance
                        .translate("allowTheAppToUseTheLocation"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, color: primaryText),
                  ),
                  content: Text(
                    AppLocalizations.instance.translate(
                        "forTheAppToWorkCorrectlyYouNeedToAllowThisPermissionToBeUsed"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: primaryText),
                  ),
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child:
                          Text(AppLocalizations.instance.translate("cancel")),
                    ),
                    TextButton(
                      onPressed: () async {
                        await Geolocator.openLocationSettings().then((value) {
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(AppLocalizations.instance.translate("goTo")),
                    ),
                  ],
                );
              }).then((value) => checkLocationPermission(context));
        }
      }
    });

    return isOkay;
  }

  @override
  void initState() {
    _controllerMyLocation = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controllerBuildPath = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controllerCloseMap = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controllerNormalMap = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controllerTerrainMap = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controllerHybridMap = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) setState(() {});
      });

    checkLocationPermission(context).then((value) async {
      if (providerPositionController == null ||
          providerPositionController!.myPosition == null) {
        if (value) {
          providerPositionController = PositionController();
        }
        setState(() {});
      }
    });
    wardPositionController = WardPositionController(context);

    super.initState();
  }

  @override
  void dispose() {
    _controllerMyLocation.dispose();
    _controllerCloseMap.dispose();
    _controllerNormalMap.dispose();
    _controllerTerrainMap.dispose();
    _controllerHybridMap.dispose();
    _controllerBuildPath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    scaleMyLocation = 1 - _controllerMyLocation.value;
    scaleCloseMap = 1 - _controllerCloseMap.value;
    scaleNormalMap = 1 - _controllerNormalMap.value;
    scaleTerrainMap = 1 - _controllerTerrainMap.value;
    scaleHybridMap = 1 - _controllerHybridMap.value;
    scaleBuildPath = 1 - _controllerBuildPath.value;
    return FGBGNotifier(
        onEvent: (event) {
          if (FGBGType.background == event ||
              AppLifecycleState.inactive.name == event.name ||
              AppLifecycleState.paused.name == event.name) {
            if (providerPositionController != null) {
              providerPositionController!.pause();
            }
            wardPositionController.pause();
          } else if (FGBGType.foreground == event ||
              AppLifecycleState.resumed.name == event.name) {
            wardPositionController.resume();
            if (providerPositionController != null) {
              providerPositionController!.pause();
            }
          }
          if (mounted) setState(() {});
        },
        child: providerPositionController != null
            ? ListenableBuilder(
                listenable: providerPositionController!,
                builder: (BuildContext context, Widget? child) {
                  Position? position = providerPositionController!.myPosition;
                  if (position != null) {
                    if (mapController != null) {
                      if (!isNotTapedOnMyLocationButton) {
                        print("object");
                        mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                            LatLng(position.latitude, position.longitude), 18));
                      }
                    }

                    return BlocBuilder<NavigationBloc, NavigationState>(
                      builder: (context, state) {
                        return SizedBox(
                            width: size.width,
                            height: size.height,
                            child: Stack(children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: GoogleMap(
                                      polylines: state.polylines,
                                      mapType: meUser.mapType == 0
                                          ? MapType.normal
                                          : meUser.mapType == 1
                                              ? MapType.terrain
                                              : MapType.hybrid,
                                      mapToolbarEnabled: false,
                                      myLocationButtonEnabled: false,
                                      compassEnabled: false,
                                      myLocationEnabled: true,
                                      zoomControlsEnabled: false,
                                      indoorViewEnabled: true,
                                      onMapCreated: (GoogleMapController
                                          controller) async {
                                        mapController = controller;
                                      },
                                      onCameraMoveStarted: () {
                                        isNotTapedOnMyLocationButton = true;
                                      },
                                      markers: state.setMarkers,
                                      initialCameraPosition: CameraPosition(
                                          zoom: 18,
                                          target: LatLng(position.latitude,
                                              position.longitude)))),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (state.setMarkers.any((element) =>
                                              element.markerId ==
                                              const MarkerId("point_a")) &&
                                          state.setMarkers.any((element) =>
                                              element.markerId ==
                                              const MarkerId("point_b"))) ...[
                                        GestureDetector(
                                          onTap: () {
                                            mapController!.animateCamera(
                                                CameraUpdate.newLatLngZoom(
                                                    LatLng(
                                                        state.setMarkers
                                                            .firstWhere((element) =>
                                                                element
                                                                    .markerId ==
                                                                const MarkerId(
                                                                    "point_a"))
                                                            .position
                                                            .latitude,
                                                        state.setMarkers
                                                            .firstWhere((element) =>
                                                                element
                                                                    .markerId ==
                                                                const MarkerId(
                                                                    "point_a"))
                                                            .position
                                                            .longitude),
                                                    18));
                                            isNotTapedOnMyLocationButton =
                                                true;
                                            if (mounted) setState(() {});
                                          },
                                          onTapDown: (TapDownDetails details) {
                                            _controllerMyLocation.forward();
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            _controllerMyLocation.reverse();
                                          },
                                          onTapCancel: () {
                                            _controllerMyLocation.reverse();
                                          },
                                          child: Transform.scale(
                                            scale: scaleMyLocation,
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              margin: const EdgeInsets.all(10),
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(90)),
                                                color: beigeTransparent,
                                              ),
                                              child: Image.asset(
                                                  "assets/icons/point_a.png"),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            mapController!.animateCamera(
                                                CameraUpdate.newLatLngZoom(
                                                    LatLng(
                                                        state.setMarkers
                                                            .firstWhere((element) =>
                                                                element
                                                                    .markerId ==
                                                                const MarkerId(
                                                                    "point_b"))
                                                            .position
                                                            .latitude,
                                                        state.setMarkers
                                                            .firstWhere((element) =>
                                                                element
                                                                    .markerId ==
                                                                const MarkerId(
                                                                    "point_b"))
                                                            .position
                                                            .longitude),
                                                    18));
                                            isNotTapedOnMyLocationButton =
                                                true;
                                            if (mounted) setState(() {});
                                          },
                                          onTapDown: (TapDownDetails details) {
                                            _controllerMyLocation.forward();
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            _controllerMyLocation.reverse();
                                          },
                                          onTapCancel: () {
                                            _controllerMyLocation.reverse();
                                          },
                                          child: Transform.scale(
                                            scale: scaleMyLocation,
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              margin: const EdgeInsets.all(10),
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(90)),
                                                color: beigeTransparent,
                                              ),
                                              child: Image.asset(
                                                  "assets/icons/point_b.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                      GestureDetector(
                                        onTap: () {
                                          mapController!.animateCamera(
                                              CameraUpdate.newLatLngZoom(
                                                  LatLng(position.latitude,
                                                      position.longitude),
                                                  18));
                                          isNotTapedOnMyLocationButton = false;
                                          if (mounted) setState(() {});
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          _controllerMyLocation.forward();
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          _controllerMyLocation.reverse();
                                        },
                                        onTapCancel: () {
                                          _controllerMyLocation.reverse();
                                        },
                                        child: Transform.scale(
                                          scale: scaleMyLocation,
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 6,
                                                    color: Colors.black26,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 2,
                                                    blurStyle: BlurStyle.normal)
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(90)),
                                              color: beigeTransparent,
                                            ),
                                            child: const Icon(
                                                Icons.location_searching,
                                                color: primaryText),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                                  isDismissible: true,
                                                  enableDrag: true,
                                                  showDragHandle: true,
                                                  constraints: BoxConstraints(
                                                    maxWidth: context
                                                        .bottomPickerWidth,
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return const BuildRouteBottomSheet();
                                                  })
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          _controllerBuildPath.forward();
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          _controllerBuildPath.reverse();
                                        },
                                        onTapCancel: () {
                                          _controllerBuildPath.reverse();
                                        },
                                        child: Transform.scale(
                                          scale: scaleBuildPath,
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 6,
                                                    color: Colors.black26,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 2,
                                                    blurStyle: BlurStyle.normal)
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(90)),
                                              color: beigeTransparent,
                                            ),
                                            child: const Icon(
                                                Icons.route_rounded,
                                                color: primaryText),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: kToolbarHeight + 40),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SavedAddressesComponent(
                                            onPress: (pickResult) {},
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            meUser =
                                                meUser.copyWith(mapType: 0);
                                            await HiveCRUD()
                                                .updateUser(meUser)
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                          onTapDown: (TapDownDetails details) {
                                            _controllerNormalMap.forward();
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            _controllerNormalMap.reverse();
                                          },
                                          onTapCancel: () {
                                            _controllerNormalMap.reverse();
                                          },
                                          child: Transform.scale(
                                            scale: scaleNormalMap,
                                            child: Container(
                                              margin: const EdgeInsets.all(10),
                                              width: size.width / 10,
                                              height: size.width / 10,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(90)),
                                                color: meUser.mapType == 0
                                                    ? primary400
                                                    : beigeTransparent,
                                              ),
                                              child: Icon(Icons.map,
                                                  color: meUser.mapType == 0
                                                      ? beigeTransparent
                                                      : primaryText),
                                              //  child: const Icon(Icons.terrain),
                                              // child: const Icon(Icons.satellite_alt),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            meUser =
                                                meUser.copyWith(mapType: 1);
                                            await HiveCRUD()
                                                .updateUser(meUser)
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                          onTapDown: (TapDownDetails details) {
                                            _controllerTerrainMap.forward();
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            _controllerTerrainMap.reverse();
                                          },
                                          onTapCancel: () {
                                            _controllerTerrainMap.reverse();
                                          },
                                          child: Transform.scale(
                                            scale: scaleTerrainMap,
                                            child: Container(
                                              margin: const EdgeInsets.all(10),
                                              width: size.width / 10,
                                              height: size.width / 10,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(90)),
                                                color: meUser.mapType == 1
                                                    ? primary400
                                                    : beigeTransparent,
                                              ),
                                              child: Icon(Icons.terrain,
                                                  color: meUser.mapType == 1
                                                      ? beigeTransparent
                                                      : primaryText),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            meUser =
                                                meUser.copyWith(mapType: 2);
                                            await HiveCRUD()
                                                .updateUser(meUser)
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                          onTapDown: (TapDownDetails details) {
                                            _controllerHybridMap.forward();
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            _controllerHybridMap.reverse();
                                          },
                                          onTapCancel: () {
                                            _controllerHybridMap.reverse();
                                          },
                                          child: Transform.scale(
                                            scale: scaleHybridMap,
                                            child: Container(
                                              margin: const EdgeInsets.all(10),
                                              width: size.width / 10,
                                              height: size.width / 10,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(90)),
                                                color: meUser.mapType == 2
                                                    ? primary400
                                                    : beigeTransparent,
                                              ),
                                              child: Icon(Icons.satellite_alt,
                                                  color: meUser.mapType == 2
                                                      ? beigeTransparent
                                                      : primaryText),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ]));
                      },
                    );
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 10,
                      color: primaryText,
                    ),
                  );
                },
              )
            : const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 10,
                  color: primaryText,
                ),
              ));
  }
}
