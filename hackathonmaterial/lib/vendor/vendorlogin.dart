import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/minAppBar.dart';

class VendorLogin extends StatefulWidget {
  const VendorLogin({Key? key}) : super(key: key);

  @override
  VendorLoginState createState() => VendorLoginState();
}

class VendorLoginState extends State<VendorLogin> {
  var mailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  String mailID = '';
  String password = '';

  void checkMailID(String value) {
    mailID = value;
  }

  @override
  Widget build(BuildContext context) {
    //login page
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: MinTeachAppBar()),
      body: Center(
        child: Card(
          color: Colors.brown.shade800.withAlpha(50),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 550.0, vertical: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login as Vendor',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.amber.shade200,
                        fontFamily: 'SFProDisplayBold')),
                const SizedBox(height: 10),
                Text(
                  'Manage your orders from here',
                  style: TextStyle(fontSize: 14, color: Colors.amber.shade100),
                ),
                const SizedBox(height: 20),
                const Text('Email ID:'),
                const SizedBox(height: 10),
                TextField(
                  controller: mailTextController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your vendor mail ID',
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
                      Navigator.pushNamed(context, '/vendormenu');
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
