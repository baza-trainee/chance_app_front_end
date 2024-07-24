import 'package:chance_app/ui/constans.dart';
import 'package:chance_app/ux/bloc/sos_contacts_bloc/sos_contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SosButton extends StatefulWidget {
  const SosButton({super.key});

  @override
  State<SosButton> createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Ink(
      decoration: const ShapeDecoration(
        color: red900,
        shape: CircleBorder(),
      ),
      child: InkWell(
        canRequestFocus: true,
        borderRadius: BorderRadius.circular(67),
        onTap: () async {
          BlocProvider.of<SosContactsBloc>(context).add(LoadSosContactsEvent());
          await Future.delayed(const Duration(milliseconds: 500))
              .whenComplete(() => Navigator.of(context).pushNamed("/sos"));
        },
        onHover: (_) {},
        splashColor: red1000,
        focusColor: red1000,
        highlightColor: red1000,
        hoverColor: red1000,
        child: Container(
          width: size.width / 4,
          height: size.width / 4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(67)),
          child: const Center(
            child: Text(
              "SOS",
              style: TextStyle(
                  color: primary50, fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
