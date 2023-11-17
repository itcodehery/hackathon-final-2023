import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/studTeachAppBar.dart';

class Stuteachaccount extends StatelessWidget {
  const Stuteachaccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60), child: StudTeachAppBar()),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_outlined,
                  size: 60, color: Colors.amberAccent.shade100),
              Text(
                'Tamanna Billuraj',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SFProDisplayBold',
                  color: Colors.amber.shade100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('22bcais048@caias.in',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SFProDisplay',
                    color: Colors.amber.shade100,
                  )),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(180, 40)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.black)),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                  ),
                  child: const Text('Check Orders')),
            ],
          ),
        ));
  }
}
