import 'package:flutter/material.dart';

import '../utils/style_constant.dart';

class CenterHintMsg extends StatelessWidget {
  const CenterHintMsg({super.key, required this.msg, this.color});
  final String msg;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        msg,
        style: StyleConst.title3.copyWith(color: color),
      ),
    );
  }
}
