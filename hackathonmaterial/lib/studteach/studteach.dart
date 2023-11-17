import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/studTeachAppBar.dart';

class Studteach extends StatefulWidget {
  const Studteach({Key? key}) : super(key: key);

  @override
  _StudteachState createState() => _StudteachState();
}

class _StudteachState extends State<Studteach> {
  Card buildCard(String title, int shopNo) {
    return Card(
      color: Colors.brown.shade800.withAlpha(50),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: const Color.fromARGB(255, 59, 49, 37),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text('#${shopNo.toString()} | OPEN'),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const Expanded(child: FractionallySizedBox(widthFactor: 1)),
            TextButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(color: Colors.amberAccent),
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  minimumSize: MaterialStatePropertyAll(Size(120, 40))),
              child: const Text('Details',
                  style: TextStyle(color: Colors.amberAccent)),
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
            const SizedBox(width: 8),
            TextButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
                  backgroundColor: MaterialStatePropertyAll(Colors.amberAccent),
                  minimumSize: MaterialStatePropertyAll(Size(120, 40))),
              child: const Text('View Menu'),
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60), child: StudTeachAppBar()),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipTag(
                      text:
                          'T O D A Y: ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.amberAccent,
                          Colors.amberAccent.shade700
                        ]),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FractionallySizedBox(widthFactor: 1),
                          const SizedBox(height: 40),
                          Text('What will you eat today?',
                              style: TextStyle(
                                  fontFamily: 'SFProDisplayBold',
                                  color: Colors.brown.shade900,
                                  fontSize: 42)),
                          const SizedBox(height: 8),
                          Text('Pick from our wide range of canteen stalls',
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Colors.brown.shade900,
                                  fontSize: 18)),
                          const SizedBox(height: 14),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(100, 40)),
                                shape: const MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.red.shade400)),
                            child: const Text(
                              'Search for anything',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                  const ClipTag(text: 'O U R  S T A L L S'),
                  buildCard('Mayurs Paradise', 18),
                  buildCard('Diyas Kitchen', 19),
                  buildCard('Hunger Nation', 20),
                  buildCard('Cake and Sweets', 21)
                ],
              ),
            ),
          ),
        ));
  }
}

class ClipTag extends StatelessWidget {
  const ClipTag({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Align(
          alignment: Alignment.center,
          child: Card(
              color: Colors.brown.shade800.withAlpha(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 12,
                        color: Colors.amber.shade100),
                  )))),
    );
  }
}
