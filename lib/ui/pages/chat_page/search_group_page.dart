import 'package:chance_app/ui/components/rounded_button.dart';
import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/l10n/app_localizations.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/search_cubit/search_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/select_cubit/select_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/chat_search_field.dart';
import 'package:chance_app/ui/pages/chat_page/widgets/user_checkbox_tile.dart';
import 'package:chance_app/ux/helpers/chat_helper.dart';
import 'package:chance_app/ux/helpers/chat_map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchGroupPage extends StatelessWidget {
  const SearchGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<types.User>>(
      stream: ChatHelper.users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(),
            body: const CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return BlocProvider(
            create: (context) => SearchCubit(snapshot.data!),
            child: GestureDetector(
              onTap: () => _unFocus(context),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      const Flexible(
                        child: ChatSearchField(),
                      ),
                      const SizedBox(width: 16.0),
                      TextButton(
                        onPressed: () => _onCloseSearchPage(context),
                        child: Text(
                          AppLocalizations.instance.translate('cancel'),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 24 / 16,
                            color: darkNeutral1000,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: BlocBuilder<SearchCubit, List<types.User>>(
                  builder: (context, searched) {
                    if (searched.isEmpty) {
                      return ListView(
                        padding: const EdgeInsets.only(top: 24.0),
                        children: ChatMapUtils.generateSortMap(snapshot.data!)
                            .entries
                            .map(_buildSortedList)
                            .toList(),
                      );
                    }

                    return BlocBuilder<SelectCubit, List<types.User>>(
                      builder: (context, selected) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            return _buildChatTile(
                              context,
                              searched[index],
                              selected.contains(searched[index]),
                            );
                          },
                          itemCount: searched.length,
                        );
                      },
                    );
                  },
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 56.0,
                    child: RoundedButton(
                      color: primary1000,
                      child: Text(
                        AppLocalizations.instance.translate('add'),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: beige0,
                        ),
                      ),
                      onPress: () => _onAddBtnTap(context),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(
              AppLocalizations.instance.translate('NoData'),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                height: 28 / 22,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSortedList(MapEntry<String, List<types.User>> entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: darkNeutral300,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            entry.key,
            style: const TextStyle(
              fontSize: 14,
              height: 20 / 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        BlocBuilder<SelectCubit, List<types.User>>(
          builder: (context, selected) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: entry.value
                    .map((val) =>
                        _buildChatTile(context, val, selected.contains(val)))
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChatTile(BuildContext context, types.User val, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: UserCheckboxTile(
        key: ValueKey(val),
        isSelected: isSelected,
        value: val,
        onChanged: (val) => _changeCheckbox(context, val),
      ),
    );
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();

  void _onCloseSearchPage(BuildContext context) => Navigator.of(context).pop();

  void _changeCheckbox(BuildContext context, types.User user) {
    SelectCubit cubit = context.read<SelectCubit>();
    if (cubit.state.contains(user)) {
      cubit.remove(user);
    } else {
      cubit.add(user);
    }
  }

  void _onAddBtnTap(BuildContext context) =>
      Navigator.of(context).pop(context.read<SelectCubit>().state);
}
