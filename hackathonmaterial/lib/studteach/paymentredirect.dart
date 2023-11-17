import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/studTeachAppBar.dart';

class Paymentredirect extends StatelessWidget {
  const Paymentredirect({Key? key}) : super(key: key);

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
            // Icon(Icons.payment, size: 100, color: Colors.amberAccent.shade100),
            Image.asset('assets/qrcode.png', height: 100, width: 100),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Colors.black87,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  'UPI ID: mayursparadise@okhdfcbank',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SFProDisplay',
                    color: Colors.amber.shade100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'This page will refresh automatically once the payment has been successfully completed',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SFProDisplay',
                  color: Colors.amber.shade100,
                ))
          ],
        ),
      ),
    );
  }
}
