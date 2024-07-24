import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/select_place.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SavedAddressesComponent extends StatefulWidget {
  const SavedAddressesComponent({super.key, required this.onPress});

  final Function(PickResult) onPress;

  @override
  State<SavedAddressesComponent> createState() =>
      _SavedAddressesComponentState();
}

class _SavedAddressesComponentState extends State<SavedAddressesComponent> {
  List<PickResult> savedAddresses = HiveCRUD()
      .savedAddresses
      .where((element) => element.isRecentlySearched == false)
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: savedAddresses.isNotEmpty ? 40 : 0,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: savedAddresses.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () async {
                Marker point = Marker(
                    markerId: const MarkerId("point"),
                    draggable: false,
                    position: LatLng(
                        savedAddresses[position].geometry!.location.lat,
                        savedAddresses[position].geometry!.location.lng),
                    icon: await getMarkerIcon(PickResultFor.first) ??
                        await BitmapDescriptor.fromAssetImage(
                            const ImageConfiguration(),
                            "assets/icons/point_a.png"),
                    infoWindow: InfoWindow(
                        title: savedAddresses[position].name,
                        snippet: savedAddresses[position].formattedAddress,
                        onTap: () {
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
                        }));
               if(mounted){
                 // ignore: use_build_context_synchronously
                 BlocProvider.of<NavigationBloc>(context)
                     .add(UpdateMarkers(markers: {point}));
               }
                isNotTapedOnMyLocationButton = true;
                mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                    LatLng(savedAddresses[position].geometry!.location.lat,
                        savedAddresses[position].geometry!.location.lng),
                    18));
                if (mounted) setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: beigeTransparent,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 6,
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurStyle: BlurStyle.normal)
                    ]),
                child: Center(
                  child: Text(
                    "${savedAddresses[position].addressComponents![1].longName}, ${savedAddresses[position].addressComponents!.first.longName}",
                    maxLines: 2,
                    style: const TextStyle(fontSize: 14, color: primaryText),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
