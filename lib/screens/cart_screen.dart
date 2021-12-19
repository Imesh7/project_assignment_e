import 'package:flutter/material.dart';
import 'package:project_assignment_e/providers/cart_provider.dart';
import 'package:project_assignment_e/screens/home_page.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  //cart item wrapped card colors
  final cardColor = [
    const Color(0xffd8c0fc),
    const Color(0xffaeb5fd),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            //cart items
            child: Consumer<CartProvider>(
              builder: (context, datas, child) {
              return datas.cartItems.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: datas.cartItems.length,
                              itemBuilder: (context, index) {
                                datas.getcartTotal();
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Stack(
                                      children: [
                                        Card(
                                          color: cardColor[
                                              index % cardColor.length],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  datas.cartItems[index].image
                                                      .toString(),
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        child: Text(datas
                                                            .cartItems[index]
                                                            .model
                                                            .toString())),
                                                    Expanded(
                                                        child: Text(datas
                                                            .cartItems[index]
                                                            .price
                                                            .toString())),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 20,
                                          child: IconButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .itemRemoveFromCart(
                                                      datas.cartItems[index]);
                                            },
                                            icon: const Icon(
                                              Icons.cancel_sharp,
                                              color: Colors.black,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  color: Colors.blue,
                                  thickness: 1.5,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total ",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text("${datas.getcartTotal()}",
                                        style: const TextStyle(fontSize: 25))
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width -
                                          200,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Check out',
                                          style: TextStyle(fontSize: 23),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder()),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                    //when cart item is null/0
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Your Cart is currently empty !"),
                              ],
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()));
                            },
                            child: const Text(
                              'Browse Items',
                              style: TextStyle(fontSize: 21),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    );
            }),
          ),
        ],
      )),
    );
  }
}
