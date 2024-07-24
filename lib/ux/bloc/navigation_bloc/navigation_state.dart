part of 'navigation_bloc.dart';
@immutable
class NavigationState {
  final Set<Marker> setMarkers;
  final Set<Polyline> polylines;
  final PickResult? firstPickResult, secondPickResult;
  final List<WardLocationModel> wardLocations;
  final bool isLoading;

  const NavigationState({
    this.setMarkers = const {},
    this.polylines = const {},
    this.firstPickResult,
    this.secondPickResult,
    this.wardLocations=const [],
    this.isLoading=false,
  });

  NavigationState copyWith({
    Set<Marker>? setMarkers,
    Set<Polyline>? polylines,
    PickResult? firstPickResult,
    PickResult? secondPickResult,
    List<WardLocationModel>? wardLocations,
    bool? isLoading,
  }) {
    return NavigationState(
      setMarkers: setMarkers ?? this.setMarkers,
      polylines: polylines ?? this.polylines,
      firstPickResult: firstPickResult ?? this.firstPickResult,
      secondPickResult: secondPickResult ?? this.secondPickResult,
      wardLocations: wardLocations ?? this.wardLocations,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
