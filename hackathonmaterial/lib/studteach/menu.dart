import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/studTeachAppBar.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // create something that can store the current cart items
  Map<String, int> cartQuan = {};
  int totalprice = 0;

  Widget menuItem(String title, String subtitle, String availability,
      String type, int price) {
    int quantityOriginal = 0;
    final TextEditingController quantityTextController =
        TextEditingController(text: quantityOriginal.toString());

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        void incrementCounter() {
          setState(() {
            int quantity = int.parse(quantityTextController.text) + 1;
            totalprice += price;
            cartQuan[title] = quantity;
            quantityTextController.text = quantity.toString();
          });
        }

        void decrementCounter() {
          setState(() {
            int quantity = int.parse(quantityTextController.text) - 1;
            if (quantity >= 0) {
              totalprice -= price;
              if (quantity == 0) {
                cartQuan.remove(title);
              } else {
                cartQuan[title] = quantity;
              }
              quantityTextController.text = quantity.toString();
            }
          });
        }

        return Card(
          color: const Color.fromARGB(255, 59, 49, 37),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //minus button
                IconButton(
                  onPressed: () {
                    decrementCounter();
                    debugPrint(cartQuan.toString());
                  },
                  icon: const Icon(Icons.remove),
                ),
                //quantity indicator
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: quantityTextController,
                    decoration: null,
                    readOnly: false,
                    style: TextStyle(
                      color: Colors.amber.shade900,
                      fontFamily: 'SFProDisplayBold',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        int quantity = int.parse(value);
                        if (quantity >= 0) {
                          cartQuan[title] = quantity;
                        }
                      });
                    },
                  ),
                ),
                //plus button
                IconButton(
                  onPressed: () {
                    incrementCounter();
                    debugPrint(cartQuan.toString());
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Text(title,
                    style: TextStyle(
                        fontFamily: 'SFProDisplayBold',
                        color: Colors.amber.shade200,
                        fontSize: 18)),
                const SizedBox(width: 20),
                Text(subtitle,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Colors.amber.shade100,
                    )),
                const Expanded(child: FractionallySizedBox(widthFactor: 1)),
                Tag(text: availability),
                Tag(text: type),
                const SizedBox(width: 10),
                Text(
                  "Rs.${price.toString()}",
                  style: TextStyle(
                      color: Colors.amber.shade100,
                      fontSize: 18,
                      fontFamily: 'SFProDisplayBold'),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget cartItems() {
  //   //displaying items in cart
  //   if (cartQuan.isEmpty) {
  //     return Card(
  //       color: Colors.transparent,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  //       child: const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  //         child: Row(
  //           children: [
  //             Icon(Icons.shopping_cart_outlined),
  //             Expanded(child: FractionallySizedBox(widthFactor: 1)),
  //             Text('Cart is Empty'),
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Card(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  //       color: const Color.fromARGB(255, 59, 49, 37),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(mainAxisSize: MainAxisSize.min, children: [
  //           const SizedBox(width: 5),
  //           Text(
  //             'In Cart:  ',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold, color: Colors.amber.shade100),
  //           ),
  //           ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: cartQuan.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               final item = cartQuan.entries.elementAt(index);
  //               return Card(
  //                 color: const Color.fromARGB(255, 47, 40, 32),
  //                 child: Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  //                   child: Text(
  //                       "${item.key.toString()} (x${item.value.toString()}) "),
  //                 ),
  //               );
  //             },
  //           ),
  //           for (var entries in cartQuan.entries)
  //             Card(
  //               color: const Color.fromARGB(255, 47, 40, 32),
  //               child: Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  //                 child: Text(
  //                     "${entries.key.toString()} (x${entries.value.toString()}) "),
  //               ),
  //             ),
  //           const Expanded(child: FractionallySizedBox(widthFactor: 1)),
  //           Text(
  //             "Rs. ${totalprice.toString()} ",
  //             style: TextStyle(
  //                 fontFamily: 'SFProDisplayBold',
  //                 color: Colors.amber.shade100,
  //                 fontSize: 20),
  //           ),
  //         ]),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.amberAccent,
                                Colors.amberAccent.shade700
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                                    TagStore(text: 'VEG'),
                                    TagStore(text: 'NON-VEG'),
                                    TagStore(text: 'EGG'),
                                  ],
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CartItemsWidget(
                            //     cartQuan: cartQuan,
                            //     totalprice: totalprice.toDouble()),
                            const SizedBox(height: 10),
                            menuItem(
                                'Chicken Roll',
                                'Chicken and Veggie Masala Wraps',
                                'AVAILABLE',
                                'NON-VEG',
                                50),
                            menuItem(
                                'Chicken Fried Rice',
                                'Classic Chinese Chicken and Rice',
                                'AVAILABLE',
                                'NON-VEG',
                                70),
                            menuItem('Paneer Roll', 'Paneer and Veggie Wraps',
                                'UNAVAILABLE', 'VEG', 100),
                            menuItem('Chicken Biryani', 'Chicken and Rice',
                                'AVAILABLE', 'NON-VEG', 120),
                          ],
                        )
                      ]),
                ))),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 52, 211, 96),
          onPressed: () {
            if (cartQuan.isEmpty) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 59, 49, 37),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NO ITEMS IN CART',
                          style: TextStyle(
                              fontSize: 12, color: Colors.amber.shade100),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Please add items to your cart!',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SFProDisplayBold',
                              color: Colors.amber.shade100),
                        ),
                      ],
                    ),
                    titlePadding: const EdgeInsets.all(16),
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black26)),
                        child: Text(
                          'Go Back',
                          style: TextStyle(color: Colors.amber.shade100),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 59, 49, 37),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ORDER CONFIRMATION',
                          style: TextStyle(
                              fontSize: 12, color: Colors.amber.shade100),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'In Cart:',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SFProDisplayBold',
                              color: Colors.amber.shade100),
                        ),
                      ],
                    ),
                    titlePadding: const EdgeInsets.all(16),
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 400),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var entries in cartQuan.entries)
                              Card(
                                color: const Color.fromARGB(255, 47, 40, 32),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  child: Text(
                                      "${entries.key.toString()} (x${entries.value.toString()})",
                                      style: TextStyle(
                                        color: Colors.amber.shade100,
                                        fontFamily: 'SFProDisplayBold',
                                      )),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Icon(Icons.warning_amber_rounded,
                                color: Colors.red.shade400, size: 20),
                            const SizedBox(width: 10),
                            Text(
                                'Once ordered, your order cannot be cancelled!',
                                style: TextStyle(
                                    color: Colors.red.shade400,
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      Card(
                        color: const Color.fromARGB(255, 47, 40, 32),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          child: Text("Rs. ${totalprice.toString()}",
                              style: TextStyle(
                                color: Colors.amber.shade100,
                                fontFamily: 'SFProDisplayBold',
                              )),
                        ),
                      ),
                      const SizedBox(width: 160),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black26)),
                        child: Text(
                          'Go Back',
                          style: TextStyle(color: Colors.amber.shade100),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/paymentredirect');
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 52, 211, 96),
                        )),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            fontFamily: 'SFProDisplayBold',
                            color: Color.fromARGB(255, 19, 99, 42),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            }
          },
          label: const Text(
            'Order',
            style: TextStyle(
                fontFamily: 'SFProDisplayBold',
                color: Color.fromARGB(255, 19, 99, 42),
                fontWeight: FontWeight.bold),
          ),
          icon: const Icon(
            Icons.navigate_next,
            color: Color.fromARGB(255, 19, 99, 42),
          ),
        ));
  }
}

class QuantityIndicator extends StatelessWidget {
  const QuantityIndicator({
    Key? key,
    required this.quantityTextController,
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(key: key);

  final TextEditingController quantityTextController;
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          //plus button
          IconButton(
            onPressed: incrementCounter,
            icon: const Icon(Icons.add),
          ),
          //quantity indicator
          Expanded(
            child: TextField(
              controller: quantityTextController,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.amber,
                fontFamily: 'SFProDisplayBold',
                fontSize: 20,
              ),
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          //minus button
          IconButton(
            onPressed: decrementCounter,
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
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
  const TagStore({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.brown.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            text,
            style: TextStyle(color: Colors.amber.shade100),
          ),
        ));
  }
}

// class CartItemsWidget extends StatefulWidget {
//   final Map<String, int> cartQuan;
//   final double totalprice;

//   const CartItemsWidget(
//       {Key? key, required this.cartQuan, required this.totalprice})
//       : super(key: key);

//   @override
//   CartItemsWidgetState createState() => CartItemsWidgetState();
// }

// class CartItemsWidgetState extends State<CartItemsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     //displaying items in cart
//     if (widget.cartQuan.isEmpty) {
//       return Card(
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         child: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//           child: Row(
//             children: [
//               Icon(Icons.shopping_cart_outlined),
//               Expanded(child: FractionallySizedBox(widthFactor: 1)),
//               Text('Cart is Empty'),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         color: const Color.fromARGB(255, 59, 49, 37),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(mainAxisSize: MainAxisSize.min, children: [
//             const SizedBox(width: 5),
//             Text(
//               'In Cart:  ',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, color: Colors.amber.shade100),
//             ),
//             for (var entries in widget.cartQuan.entries)
//               Card(
//                 color: const Color.fromARGB(255, 47, 40, 32),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                   child: Text(
//                       "${entries.key.toString()} (x${entries.value.toString()}) "),
//                 ),
//               ),
//             const Expanded(child: FractionallySizedBox(widthFactor: 1)),
//             Text(
//               "Rs. ${widget.totalprice.toString()} ",
//               style: TextStyle(
//                   fontFamily: 'SFProDisplayBold',
//                   color: Colors.amber.shade100,
//                   fontSize: 20),
//             ),
//           ]),
//         ),
//       );
//     }
//   }
// }
