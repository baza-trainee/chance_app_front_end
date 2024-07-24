import 'package:chance_app/api_keys.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/components/map_data.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/controllers/autocomplete_search_controller.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/place_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/autocomplete_search.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/geometry.dart'
    as mygeometry;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/location.dart'
    as mylocation;
import 'package:chance_app/ui/pages/navigation/place_picker/src/models/pick_result.dart'
    as mypick;
import 'package:chance_app/ui/pages/navigation/place_picker/src/place_picker.dart';
import 'package:chance_app/ux/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:chance_app/ux/hive_crud.dart';
import 'package:chance_app/ux/model/me_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

enum PickResultFor { first, second }

class SelectPlace extends StatefulWidget {
  const SelectPlace({super.key, required this.pickResultFor});

  final PickResultFor pickResultFor;

  @override
  State<SelectPlace> createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  GlobalKey appBarKey = GlobalKey();
  late final Future<PlaceProvider> _futureProvider;
  PlaceProvider? provider;
  SearchBarController searchBarController = SearchBarController();
  List<Map<String, dynamic>> predictionForList = [];
  List<Prediction> predictionForTap = [];
  List<mypick.PickResult> savedAddresses = HiveCRUD()
      .savedAddresses
      .where((element) => element.isRecentlySearched == true)
      .toList();
  MeUser meUser = HiveCRUD().user!;

  @override
  void initState() {
    _futureProvider = _initPlaceProvider();
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
    if (providerPositionController!=null||providerPositionController!.myPosition != null) {
      return ListenableBuilder(
          listenable: providerPositionController!,
          builder: (BuildContext context, Widget? child) {
            Position? position = providerPositionController!.myPosition;
            if (position != null) {
              return FutureBuilder<PlaceProvider>(
                  future: _futureProvider,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        color: primary500,
                        radius: 50,
                      ));
                    } else if (snapshot.hasData) {
                      provider = snapshot.data;
                      return MultiProvider(
                          providers: [
                            ChangeNotifierProvider<PlaceProvider>.value(
                                value: provider!),
                          ],
                          child: Scaffold(
                              key: appBarKey,
                              body: ListView(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  const SizedBox(
                                    height: kToolbarHeight,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                        color: beigeBG,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: darkNeutral600,
                                                width: 0.1))),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                  color: darkNeutral600)),
                                          child: Row(children: [
                                            BackButton(
                                              color: primaryText,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: AutoCompleteSearch(
                                                appBarKey: appBarKey,
                                                searchBarController:
                                                    searchBarController,
                                                sessionToken:
                                                    provider!.sessionToken,
                                                hintText: AppLocalizations
                                                    .instance
                                                    .translate("search"),
                                                searchingText:
                                                    "${AppLocalizations.instance.translate("search")}...",
                                                onPicked: (prediction) {
                                                  //if (mounted) {
                                                  //  _pickPrediction(prediction);
                                                  //}
                                                },
                                                prediction: (predictions) {
                                                  predictionForList =
                                                      predictions
                                                          .map((e) => {
                                                                "id": e.id,
                                                                "description": e
                                                                    .description,
                                                                "distanceMeters":
                                                                    e.distanceMeters,
                                                              })
                                                          .toList();
                                                  predictionForTap =
                                                      predictions;
                                                  if (mounted) setState(() {});
                                                },
                                              ),
                                            ))
                                          ]),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            switch (widget.pickResultFor) {
                                              case PickResultFor.first:
                                                BlocProvider.of<NavigationBloc>(
                                                        context)
                                                    .add(UpdateFirstPickResult(
                                                        firstPickResult: mypick.PickResult(
                                                            id: "me",
                                                            formattedAddress:
                                                                AppLocalizations
                                                                    .instance
                                                                    .translate(
                                                                        "i"),
                                                            geometry: mygeometry.Geometry(
                                                                location: mylocation.Location(
                                                                    lat: position
                                                                        .latitude,
                                                                    lng: position
                                                                        .longitude)))));
                                                break;
                                              case PickResultFor.second:
                                                BlocProvider.of<NavigationBloc>(
                                                        context)
                                                    .add(UpdateSecondPickResult(
                                                        secondPickResult: mypick.PickResult(
                                                            id: "me",
                                                            formattedAddress:
                                                                AppLocalizations
                                                                    .instance
                                                                    .translate(
                                                                        "i"),
                                                            geometry: mygeometry.Geometry(
                                                                location: mylocation.Location(
                                                                    lat: position
                                                                        .latitude,
                                                                    lng: position
                                                                        .longitude)))));
                                            }

                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: darkNeutral600)),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.my_location),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  AppLocalizations.instance
                                                      .translate(
                                                          "useMyLocation"),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: primaryText),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PlacePicker(
                                                  apiKey: googleAPIKey,
                                                  onPlacePicked:
                                                      (result) async {
                                                    switch (
                                                        widget.pickResultFor) {
                                                      case PickResultFor.first:
                                                        BlocProvider.of<
                                                                    NavigationBloc>(
                                                                context)
                                                            .add(UpdateFirstPickResult(
                                                                firstPickResult:
                                                                    result));
                                                        break;
                                                      case PickResultFor.second:
                                                        BlocProvider.of<
                                                                    NavigationBloc>(
                                                                context)
                                                            .add(UpdateSecondPickResult(
                                                                secondPickResult:
                                                                    result));
                                                        break;
                                                    }
                                                    await HiveCRUD()
                                                        .addSavedAddresses(
                                                            result)
                                                        .whenComplete(() =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop());
                                                  },
                                                  initialPosition: LatLng(
                                                      position.latitude,
                                                      position.longitude),
                                                  useCurrentLocation: true,
                                                  resizeToAvoidBottomInset:
                                                      false, // only works in page mode, less flickery, remove if wrong offsets
                                                ),
                                              ),
                                            ).whenComplete(() =>
                                                Navigator.of(context).pop());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: darkNeutral600)),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.location_on_outlined),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  AppLocalizations.instance
                                                      .translate(
                                                          "selectOnTheMap"),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: primaryText),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: beigeTransparent,
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                        color: beigeBG,
                                        border: Border(
                                            top: BorderSide(
                                                color: darkNeutral600,
                                                width: 0.1))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          predictionForTap.isNotEmpty &&
                                                  predictionForList.isNotEmpty
                                              ? AppLocalizations.instance
                                                  .translate(
                                                      "similarToYourQuery")
                                              : AppLocalizations.instance
                                                  .translate("recent"),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: primaryText,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                predictionForTap.isNotEmpty
                                                    ? predictionForTap.length
                                                    : savedAddresses.length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, position) {
                                              return GestureDetector(
                                                onTap: () async {
                                                  if (predictionForTap
                                                      .isNotEmpty) {
                                                    _pickPrediction(
                                                            predictionForTap[
                                                                position])
                                                        .then((value) {
                                                      if (value) {
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    });
                                                  } else {
                                                    switch (
                                                        widget.pickResultFor) {
                                                      case PickResultFor.first:
                                                        BlocProvider.of<
                                                                    NavigationBloc>(
                                                                context)
                                                            .add(UpdateFirstPickResult(
                                                                firstPickResult:
                                                                    savedAddresses[
                                                                        position]));
                                                        break;
                                                      case PickResultFor.second:
                                                        BlocProvider.of<
                                                                    NavigationBloc>(
                                                                context)
                                                            .add(UpdateSecondPickResult(
                                                                secondPickResult:
                                                                    savedAddresses[
                                                                        position]));
                                                        break;
                                                    }
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color:
                                                                  darkNeutral600))),
                                                  child: Row(
                                                    children: [
                                                      Icon(predictionForList
                                                              .isNotEmpty
                                                          ? Icons
                                                              .location_on_outlined
                                                          : Icons.access_time),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                        predictionForList
                                                                .isNotEmpty
                                                            ? predictionForList[
                                                                        position]
                                                                    [
                                                                    "description"]
                                                                .toString()
                                                            : savedAddresses[
                                                                        position]
                                                                    .formattedAddress ??
                                                                "",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: primaryText),
                                                        maxLines: 5,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                      ],
                                    ),
                                  ),
                                ],
                              )));
                    }
                    return const SizedBox();
                  });
            }
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 10,
                color: primaryText,
              ),
            );
          });
    }
    return const Center(
      child: CupertinoActivityIndicator(
        animating: true,
        radius: 10,
        color: primaryText,
      ),
    );
  }

  Future<bool> _pickPrediction(Prediction prediction) async {
    provider!.placeSearchingState = SearchingState.searching;

    final PlacesDetailsResponse response =
        await provider!.places.getDetailsByPlaceId(
      prediction.placeId!,
      sessionToken: provider!.sessionToken,
    );

    if (response.errorMessage?.isNotEmpty == true ||
        response.status == "REQUEST_DENIED") {
      return false;
    }

    provider!.selectedPlace = getPickResult(response.result);

    provider!.isAutoCompleteSearching = true;

    await saveCoordinates(provider!.selectedPlace);

    if (provider == null) return false;
    provider!.placeSearchingState = SearchingState.idle;
    return true;
  }

  saveCoordinates(mypick.PickResult? selectedPlace) async {
    if (selectedPlace != null) {
      switch (widget.pickResultFor) {
        case PickResultFor.first:
          BlocProvider.of<NavigationBloc>(context)
              .add(UpdateFirstPickResult(firstPickResult: selectedPlace));
          break;
        case PickResultFor.second:
          BlocProvider.of<NavigationBloc>(context)
              .add(UpdateSecondPickResult(secondPickResult: selectedPlace));
          break;
      }
      selectedPlace = selectedPlace.copyWith(isRecentlySearched: true);
      await HiveCRUD().addSavedAddresses(selectedPlace);
    }
    if (mounted) setState(() {});
  }
}
