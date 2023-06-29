import 'package:flutter/material.dart';

class SwitchDirections extends StatelessWidget {
  const SwitchDirections({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsetsDirectional.only(top: 60, end: 20),
          child: ElevatedButton(
              onPressed: onPressed,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Icon(Icons.swap_vert_circle_sharp),
              )),
        ),
      ],
    );
  }
}
