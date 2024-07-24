import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatSearchField extends StatefulWidget {
  const ChatSearchField({
    super.key,
  });

  @override
  State<ChatSearchField> createState() => _ChatSearchFieldState();
}

class _ChatSearchFieldState extends State<ChatSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: true,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.words,
      onChanged: context.read<SearchCubit>().search,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 24 / 16,
        color: darkNeutral800,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 18.0,
          maxHeight: 18.0,
        ),
        suffixIcon: IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          onPressed: () => _onClearBtnTap(context),
          icon: const Icon(Icons.close),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
    );
  }

  void _onClearBtnTap(BuildContext context) {
    _controller.clear();
    _unFocus(context);
    context.read<SearchCubit>().clear();
  }

  void _unFocus(BuildContext context) => FocusScope.of(context).unfocus();
}
