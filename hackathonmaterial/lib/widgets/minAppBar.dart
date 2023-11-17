import 'package:flutter/material.dart';

class MinTeachAppBar extends StatelessWidget {
  const MinTeachAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 59, 49, 37),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
      title: const Text('eat.caias',
          style: TextStyle(fontFamily: 'Takota', fontSize: 32)),
    );
  }
}
