part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class UpdateMarkers extends NavigationEvent{
  final Set<Marker> markers;

  UpdateMarkers({required this.markers});
}
class UpdatePolyline extends NavigationEvent{
  final Set<Polyline> polylines;

  UpdatePolyline({required this.polylines});
}
class UpdateFirstPickResult extends NavigationEvent{
  final PickResult firstPickResult;

  UpdateFirstPickResult({required this.firstPickResult});
}
class UpdateSecondPickResult extends NavigationEvent{
  final PickResult secondPickResult;

  UpdateSecondPickResult({required this.secondPickResult});
}
class BuildRoute extends NavigationEvent{

  BuildRoute();
}
class ChangeWardLocation extends NavigationEvent{
  final WardLocationModel wardLocationModel;

  ChangeWardLocation(this.wardLocationModel);
}
