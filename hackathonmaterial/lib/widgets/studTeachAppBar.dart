import 'package:flutter/material.dart';

class StudTeachAppBar extends StatelessWidget {
  const StudTeachAppBar({
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.amber.shade100),
          iconSize: 24,
        ),
        TextButton(
            onPressed: () {},
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 8, vertical: 6))),
            child: Text(
              'Account',
              style: TextStyle(color: Colors.amber.shade100),
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              'Orders',
              style: TextStyle(color: Colors.amber.shade100),
            )),
        const SizedBox(width: 20)
      ],
    );
  }
}
