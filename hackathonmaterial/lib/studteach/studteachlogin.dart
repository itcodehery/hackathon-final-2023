import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/minAppBar.dart';

class Studteachlogin extends StatefulWidget {
  const Studteachlogin({Key? key}) : super(key: key);

  @override
  _StudteachloginState createState() => _StudteachloginState();
}

class _StudteachloginState extends State<Studteachlogin> {
  var mailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  String mailID = '';
  String password = '';

  void checkMailID(String value) {
    if (value.contains('@caias.in')) {
      // Navigator.pushReplacementNamed(context, '/studteach');
      mailID = value;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade700,
          content: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white),
              SizedBox(width: 6),
              Text(
                'Please enter your College mail ID!',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //login page
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: MinTeachAppBar()),
      body: Card(
        color: Colors.brown.shade800.withAlpha(50),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 550.0, vertical: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login as Student/Lecturer',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.amber.shade200,
                        fontFamily: 'SFProDisplayBold')),
                const SizedBox(height: 10),
                Text(
                  'Use your college mail ID',
                  style: TextStyle(fontSize: 14, color: Colors.amber.shade100),
                ),
                const SizedBox(height: 20),
                const Text('Email ID:'),
                const SizedBox(height: 10),
                TextField(
                  controller: mailTextController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your college mail ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                  onSubmitted: (value) {
                    checkMailID(value);
                  },
                ),
                const SizedBox(height: 10),
                const Text('Password:'),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                      minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amberAccent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/studteach');
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
