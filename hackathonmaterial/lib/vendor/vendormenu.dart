import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/studTeachAppBar.dart';

class VendorMenu extends StatefulWidget {
  const VendorMenu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<VendorMenu> {
  // create something that can store the current cart items
  Map<String, int> cartQuan = {};
  int totalprice = 0;

  Widget menuItem(String title, String subtitle, String availability,
      String type, int price) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Card(
        color: Colors.brown.shade800.withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined,
                    color: Colors.amber.shade100, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.amber.shade300,
                    fontFamily: 'SFProDisplayBold',
                    fontSize: 20),
              ),
              const SizedBox(width: 20),
              Text(subtitle,
                  style: TextStyle(color: Colors.amber.shade100, fontSize: 14)),
              const Expanded(child: FractionallySizedBox(widthFactor: 1)),
              Row(
                children: [
                  Tag(text: availability),
                  const SizedBox(width: 20),
                  Tag(text: type),
                  const SizedBox(width: 20),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Rs.${price.toString()}",
                        style: TextStyle(
                            color: Colors.amber.shade100, fontSize: 20),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String newItemName = '';
    String newItemDesc = '';
    int newItemPrice = 0;
    String newItemType = '';
    String newItemAvail = '';
    List<Widget> menuItems = [
      menuItem('Chicken Roll', 'Chicken and Veggie Masala Wraps', 'AVAILABLE',
          'NON-VEG', 50),
      menuItem('Chicken Fried Rice', 'Classic Chinese Chicken and Rice',
          'AVAILABLE', 'NON-VEG', 70),
      menuItem(
          'Paneer Roll', 'Paneer and Veggie Wraps', 'UNAVAILABLE', 'VEG', 100),
    ];

    void addToMenu() {
      var newMenuItem = menuItem(
          newItemName, newItemDesc, newItemAvail, newItemType, newItemPrice);
      var menuItemDupli = menuItems;
      menuItemDupli.add(newMenuItem);

      setState(() {
        debugPrint(newItemName +
            newItemDesc +
            newItemAvail +
            newItemType +
            newItemPrice.toString());
        //updates the menuItems list
        menuItems = menuItemDupli;
        debugPrint(menuItems.length.toString());
      });
    }

    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: StudTeachAppBar()),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, //width
                    mainAxisAlignment: MainAxisAlignment.start, //height
                    children: [
                      Card(
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FractionallySizedBox(widthFactor: 1),
                              const SizedBox(height: 40),
                              Text('Mayur\'s Paradise',
                                  style: TextStyle(
                                      fontFamily: 'SFProDisplayBold',
                                      color: Colors.brown.shade900,
                                      fontSize: 42)),
                              const SizedBox(height: 8),
                              Text('Stall for Breakfast, Lunch and Snacks',
                                  style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Colors.brown.shade900,
                                      fontSize: 18)),
                              const SizedBox(height: 8),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TagStore(
                                      icon: Icons.edit_outlined, text: 'VEG'),
                                  TagStore(
                                      icon: Icons.edit_outlined,
                                      text: 'NON-VEG'),
                                  TagStore(
                                      icon: Icons.edit_outlined, text: 'EGG'),
                                  TagStore(icon: Icons.add, text: '')
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Card(
                      //     color: Colors.amberAccent,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           const SizedBox(width: 4),
                      //           Icon(Icons.add, color: Colors.brown.shade900),
                      //           const SizedBox(width: 4),
                      //           Text('A D D  I T E M',
                      //               style: TextStyle(
                      //                   fontFamily: 'SFProDisplayBold',
                      //                   color: Colors.brown.shade900,
                      //                   fontSize: 12)),
                      //           const SizedBox(width: 4),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          const Color.fromARGB(255, 59, 49, 37),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ADD A NEW ITEM',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.amber.shade100),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Enter new item details',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'SFProDisplayBold',
                                                color: Colors.amber.shade100),
                                          ),
                                        ],
                                      ),
                                      titlePadding: const EdgeInsets.all(16),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 16),
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              'Item Name',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.amber.shade100),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onSubmitted: ((value) =>
                                                  {newItemName = value}),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SFProDisplay',
                                                  color: Colors.amber.shade100),
                                              decoration: InputDecoration(
                                                hintText: 'Enter item name',
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProDisplay',
                                                    color:
                                                        Colors.amber.shade100),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.amber.shade100,
                                                      width: 2),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              'Item Description',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.amber.shade100),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onSubmitted: (value) {
                                                newItemDesc = value;
                                              },
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SFProDisplay',
                                                  color: Colors.amber.shade100),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter item description',
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProDisplay',
                                                    color:
                                                        Colors.amber.shade100),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.amber.shade100),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onSubmitted: (value) {
                                                newItemPrice = int.parse(value);
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SFProDisplay',
                                                  color: Colors.amber.shade100),
                                              decoration: InputDecoration(
                                                hintText: 'Enter price of item',
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProDisplay',
                                                    color:
                                                        Colors.amber.shade100),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.amber.shade100,
                                                      width: 2),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              'Type',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.amber.shade100),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onSubmitted: (value) {
                                                newItemType = value;
                                              },
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SFProDisplay',
                                                  color: Colors.amber.shade100),
                                              decoration: InputDecoration(
                                                hintText: 'Enter item type',
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProDisplay',
                                                    color:
                                                        Colors.amber.shade100),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              'Availability',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.amber.shade100),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onSubmitted: (value) {
                                                newItemAvail = value;
                                              },
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'SFProDisplay',
                                                  color: Colors.amber.shade100),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter item availability',
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'SFProDisplay',
                                                    color:
                                                        Colors.amber.shade100),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ]),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            addToMenu();
                                            Navigator.pop(context);
                                          },
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.amber)),
                                          child: Text(
                                            'Add Item',
                                            style: TextStyle(
                                                color: Colors.brown.shade900),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.add, color: Colors.amber),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.brown.shade800)),
                              label: const Text('Add Item',
                                  style: TextStyle(color: Colors.amber))),
                        ),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: menuItems,
                      // )
                      Expanded(
                          child: Column(
                        children: [
                          ListView.builder(
                              itemCount: menuItems.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return menuItems[index];
                              })
                        ],
                      ))
                    ]),
              ))),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              text,
              style: TextStyle(color: Colors.amber.shade100),
            ),
          )),
    );
  }
}

class TagStore extends StatelessWidget {
  const TagStore({super.key, required this.icon, required this.text});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.brown.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Icon(icon, color: Colors.amber.shade100, size: 12),
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(color: Colors.amber.shade100),
              ),
            ],
          ),
        ));
  }
}
