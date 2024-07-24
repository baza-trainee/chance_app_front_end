import 'dart:async';

import 'package:chance_app/ui/pages/navigation/place_picker/controllers/autocomplete_search_controller.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/place_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/providers/search_provider.dart';
import 'package:chance_app/ui/pages/navigation/place_picker/src/place_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:provider/provider.dart';

class AutoCompleteSearch extends StatefulWidget {
  const AutoCompleteSearch({
    super.key,
    required this.sessionToken,
    required this.onPicked,
    required this.appBarKey,
    this.hintText = "Search here",
    this.searchingText = "Searching...",
    this.hidden = false,
    this.height = 40,
    this.contentPadding = EdgeInsets.zero,
    this.debounceMilliseconds,
    this.onSearchFailed,
    required this.searchBarController,
    this.autocompleteOffset,
    this.autocompleteRadius,
    this.autocompleteLanguage,
    this.autocompleteComponents,
    this.autocompleteTypes,
    this.strictbounds,
    this.region,
    this.initialSearchString,
    this.searchForInitialValue,
    this.autocompleteOnTrailingWhitespace,
    required this.prediction,
    this.onTapCancel,
    this.textEditingController,
    this.onTap, this.focusNode,
  });

  final String? sessionToken;
  final String? hintText;
  final String? searchingText;
  final bool hidden;
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final int? debounceMilliseconds;
  final ValueChanged<Prediction> onPicked;
  final ValueChanged<String>? onSearchFailed;
  final SearchBarController searchBarController;
  final num? autocompleteOffset;
  final num? autocompleteRadius;
  final String? autocompleteLanguage;
  final List<String>? autocompleteTypes;
  final List<Component>? autocompleteComponents;
  final bool? strictbounds;
  final String? region;
  final GlobalKey appBarKey;
  final String? initialSearchString;
  final bool? searchForInitialValue;
  final bool? autocompleteOnTrailingWhitespace;
  final Function(List<Prediction>) prediction;
  final Function()? onTapCancel, onTap;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;

  @override
  AutoCompleteSearchState createState() => AutoCompleteSearchState();
}

class AutoCompleteSearchState extends State<AutoCompleteSearch> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  OverlayEntry? overlayEntry;
  SearchProvider provider = SearchProvider();
  @override
  void initState() {
    super.initState();
    if (widget.textEditingController != null) {
      controller = widget.textEditingController!;
    }
    if (widget.focusNode != null) {
      focus = widget.focusNode!;
    }
    if (widget.initialSearchString != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = widget.initialSearchString!;
        if (widget.searchForInitialValue!) {
          _onSearchInputChange();
        }
      });
    }

    controller.addListener(_onSearchInputChange);
    focus.addListener(_onFocusChanged);

    widget.searchBarController.attach(this);
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchInputChange);
    controller.dispose();

    focus.removeListener(_onFocusChanged);
    focus.dispose();
    _clearOverlay();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.hidden
        ? ChangeNotifierProvider.value(
            value: provider,
            child: GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
                FocusScope.of(context).requestFocus(focus);
              },
              child:Row(
              children: <Widget>[
                 Expanded(child: _buildSearchTextField()),
                _buildTextClearIcon(),
              ],
            ),
          ))
        : Container();
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: controller,
      focusNode: focus,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        isDense: true,
        contentPadding: widget.contentPadding,
      ),
      onTap:() {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
    );
  }

  Widget _buildTextClearIcon() {
    return Selector<SearchProvider, String>(
        selector: (_, provider) => provider.searchTerm,
        builder: (_, data, __) {
          if (data.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.clear,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                onTap: () {
                  clearText();
                  focus.unfocus();
                  if (widget.onTapCancel != null) {
                    widget.onTapCancel!();
                  }
                },
              ),
            );
          } else {
            return const SizedBox(width: 10);
          }
        });
  }

  _onSearchInputChange() {
    if (!mounted) return;
    this.provider.searchTerm = controller.text;

    PlaceProvider provider = PlaceProvider.of(context, listen: false);
    if (controller.text.isEmpty) {
      provider.debounceTimer?.cancel();
      _searchPlace(controller.text);
      return;
    }
    if (controller.text.trim() == this.provider.prevSearchTerm.trim()) {
      provider.debounceTimer?.cancel();
      return;
    }
    if (!(widget.autocompleteOnTrailingWhitespace != null &&
            widget.autocompleteOnTrailingWhitespace!) &&
        controller.text.substring(controller.text.length - 1) == " ") {
      provider.debounceTimer?.cancel();
      return;
    }
    if (provider.debounceTimer?.isActive ?? false) {
      provider.debounceTimer!.cancel();
    }

    provider.debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _searchPlace(controller.text.trim());
    });
  }

  _onFocusChanged() {
    PlaceProvider provider = PlaceProvider.of(context, listen: false);
    provider.isSearchBarFocused = focus.hasFocus;
    provider.debounceTimer?.cancel();
    provider.placeSearchingState = SearchingState.idle;
  }

  _searchPlace(String searchTerm) {
    provider.prevSearchTerm = searchTerm;

    _clearOverlay();
    if (searchTerm.isEmpty) return;
    _performAutoCompleteSearch(searchTerm);
  }

  _clearOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }



  _performAutoCompleteSearch(String searchTerm) async {
    PlaceProvider provider = PlaceProvider.of(context, listen: false);

    if (searchTerm.isNotEmpty) {
      final PlacesAutocompleteResponse response = await provider.places
          .autocomplete(
            searchTerm,
            sessionToken: widget.sessionToken,
            location: provider.currentPosition == null
                ? null
                : Location(
                    lat: provider.currentPosition!.latitude,
                    lng: provider.currentPosition!.longitude),
            radius: widget.autocompleteRadius,
            region: "UA",
          );
      if (response.errorMessage?.isNotEmpty == true ||
          response.status == "REQUEST_DENIED") {
        if (widget.onSearchFailed != null) {
          widget.onSearchFailed!(response.status);
        }
        return;
      }
      widget.prediction(response.predictions);
    }
  }

  clearText() {
    provider.searchTerm = "";
    controller.clear();
  }

  resetSearchBar() {
    clearText();
    focus.unfocus();
  }

  clearOverlay() {
    _clearOverlay();
  }
}
