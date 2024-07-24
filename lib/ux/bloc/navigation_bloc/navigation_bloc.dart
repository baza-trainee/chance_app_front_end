import 'dart:async';

import 'package:chance_app/api_keys.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/select_place.dart';
import 'package:chance_app/ux/model/ward_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<UpdateMarkers>(_onUpdateMarkers);
    on<UpdatePolyline>(_onUpdatePolyline);
    on<UpdateFirstPickResult>(_onUpdateFirstPickResult);
    on<UpdateSecondPickResult>(_onUpdateSecondPickResult);
    on<BuildRoute>(_onBuildRoute);
    on<ChangeWardLocation>(_onChangeWardLocation);
  }

  FutureOr<void> _onUpdateMarkers(
      UpdateMarkers event, Emitter<NavigationState> emit) {
    emit(state.copyWith(setMarkers: event.markers));
  }

  FutureOr<void> _onUpdatePolyline(
      UpdatePolyline event, Emitter<NavigationState> emit) {
    emit(state.copyWith(polylines: event.polylines));
  }

  FutureOr<void> _onUpdateFirstPickResult(
      UpdateFirstPickResult event, Emitter<NavigationState> emit) {
    emit(state.copyWith(firstPickResult: event.firstPickResult));
  }

  FutureOr<void> _onUpdateSecondPickResult(
      UpdateSecondPickResult event, Emitter<NavigationState> emit) {
    emit(state.copyWith(secondPickResult: event.secondPickResult));
  }

  FutureOr _onBuildRoute(
      BuildRoute event, Emitter<NavigationState> emit) async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: false));
      PickResult? firstPickResult = state.firstPickResult,
          secondPickResult = state.secondPickResult;
      if (firstPickResult != null && secondPickResult != null) {
        PolylinePoints polylinePoints = PolylinePoints();
        PointLatLng? firstPointLatLng;
        if (firstPickResult.id != "me") {
          try {
            firstPointLatLng = PointLatLng(
                firstPickResult.geometry!.location.lat,
                firstPickResult.geometry!.location.lng);
          } catch (e) {
            firstPointLatLng = await getPositionOfPoint(firstPickResult);
          }
        } else {
          firstPointLatLng = PointLatLng(firstPickResult.geometry!.location.lat,
              firstPickResult.geometry!.location.lng);
        }
        PointLatLng? secondPointLatLng;
        if (secondPickResult.id != "me") {
          try {
            secondPointLatLng = PointLatLng(
                secondPickResult.geometry!.location.lat,
                secondPickResult.geometry!.location.lng);
          } catch (e) {
            secondPointLatLng = await getPositionOfPoint(secondPickResult);
          }
        } else {
          secondPointLatLng = PointLatLng(
              secondPickResult.geometry!.location.lat,
              secondPickResult.geometry!.location.lng);
        }
        if (firstPointLatLng == null || secondPointLatLng == null) {
          return null;
        }
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPIKey,
          firstPointLatLng,
          secondPointLatLng,
        );
        List<LatLng> polylineCoordinates = [];
        if (result.points.isNotEmpty) {
          for (var point in result.points) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }
        }
        Polyline polyline = Polyline(
          polylineId: const PolylineId("route"),
          color: red900,
          points: polylineCoordinates,
          width: 3,
        );
        Set<Polyline> polylines = {};
        polylines.add(polyline);
        BitmapDescriptor? bitmapDescriptor =
            await getMarkerIcon(PickResultFor.first);
        Marker? pointA;
        if (bitmapDescriptor != null) {
          pointA = Marker(
              markerId: const MarkerId("point_a"),
              draggable: false,
              position:
                  LatLng(firstPointLatLng.latitude, firstPointLatLng.longitude),
              icon: bitmapDescriptor,
              infoWindow: InfoWindow(
                  title: firstPickResult.name,
                  snippet: firstPickResult.formattedAddress,
                  onTap: () {
                    isNotTapedOnMyLocationButton = true;
                    mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(firstPointLatLng!.latitude,
                            firstPointLatLng.longitude),
                        18));
                  }));
        }
        Set<Marker> setMarkers = {};
        if (pointA != null) {
          setMarkers.add(pointA);
        }
        Marker? pointB;
        bitmapDescriptor = await getMarkerIcon(PickResultFor.second);
        if (bitmapDescriptor != null) {
          pointB = Marker(
              markerId: const MarkerId("point_b"),
              draggable: false,
              position: LatLng(
                  secondPointLatLng.latitude, secondPointLatLng.longitude),
              icon: bitmapDescriptor,
              infoWindow: InfoWindow(
                  title: secondPickResult.name,
                  snippet: secondPickResult.formattedAddress,
                  onTap: () {
                    isNotTapedOnMyLocationButton = true;
                    mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(secondPointLatLng!.latitude,
                            secondPointLatLng.longitude),
                        18));
                  }));
        }
        if (pointB != null) {
          setMarkers.add(pointB);
        }
        if (mapController != null) {
          mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(
                  LatLng(
                      state.setMarkers.first.position
                          .latitude,
                      state.setMarkers.first.position
                          .longitude),
                  18));
        }
        emit(state.copyWith(
            setMarkers: setMarkers, polylines: polylines, isLoading: false));
      }
    }
  }

  FutureOr<void> _onChangeWardLocation(
      ChangeWardLocation event, Emitter<NavigationState> emit) async {
    List<WardLocationModel> list = List.from(state.wardLocations);
    if (list.any((element) => element.id == event.wardLocationModel.id)) {
      list.removeWhere((element) => element.id == event.wardLocationModel.id);
    }
    list.add(event.wardLocationModel);
    BitmapDescriptor? bitmapDescriptor = await getMarkerIcon(null);
    List<Marker> markers = state.setMarkers.toList();
    if (bitmapDescriptor != null) {
      for (int i = 0; i < markers.length; i++) {
        if (list.any((element) => element.id == markers[i].markerId.value)) {
          markers.removeAt(i);
        }
      }

      for (int i = 0; i < list.length; i++) {
        markers.add(Marker(
            markerId: MarkerId(list[i].id),
            draggable: false,
            position: LatLng(list[i].latitude, list[i].longitude),
            icon: bitmapDescriptor,
            infoWindow: InfoWindow(
                title: list[i].myName,
                snippet:
                    "${AppLocalizations.instance.translate("whenUserWereHere")}: ${list[i].when.sinceDate}",
                onTap: () {
                  isNotTapedOnMyLocationButton = true;
                  mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                      LatLng(list[i].latitude, list[i].longitude), 18));
                })));
      }
    }
    emit(state.copyWith(wardLocations: list, setMarkers: markers.toSet()));
  }
}
