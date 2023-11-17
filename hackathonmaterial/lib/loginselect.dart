import 'package:flutter/material.dart';

class Loginselect extends StatelessWidget {
  const Loginselect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Card(
        // margin: const EdgeInsets.fromLTRB(10, 220, 10, 220),
        color: Colors.brown.shade800.withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.amberAccent,
                      Colors.amberAccent.shade700
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'eat.caias',
                        style: TextStyle(
                            fontFamily: 'Takota',
                            fontSize: 64,
                            color: Colors.brown.shade900),
                      ),
                      Text(
                        'Ready to taste something new?',
                        style: TextStyle(
                            fontFamily: 'Takota',
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.red.shade700),
                      ),
                      Divider(
                        color: Colors.brown.shade800,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login as:    ',
                            style: TextStyle(
                                color: Colors.brown.shade900,
                                fontFamily: 'SFProDisplay'),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(180, 40)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.brown.shade900),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(color: Colors.black)),
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.all(8)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/studteachlogin');
                            },
                            child: const Text(
                              'Student/Lecturer',
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Colors.amberAccent),
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/vendorlogin');
                              },
                              style: ButtonStyle(
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(180, 40)),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.all(8)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.brown.shade900,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(4))),
                              ),
                              child: Text(
                                'Vendor',
                                style: TextStyle(
                                    color: Colors.brown.shade900,
                                    fontFamily: 'SFProDisplay'),
                              )),
                        ],
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
