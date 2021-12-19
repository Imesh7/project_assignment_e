import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:project_assignment_e/models/product.dart';
import 'package:project_assignment_e/providers/cart_provider.dart';
import 'package:project_assignment_e/providers/products_provider.dart';
import 'package:project_assignment_e/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  Result? result;
  Color? backColor;
  ProductDetailScreen({Key? key, this.result, this.backColor})
      : super(key: key);

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        )),

                        //favorite function
                    Consumer<ProductProvider>(
                      builder: (context, datas, child) {
                      return IconButton(
                          onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .makeFavorite();
                          },
                          icon: Icon(
                            Icons.favorite,
                            color:
                                datas.isfavorite != true ? Colors.white : Colors.red,
                          ));
                    }),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()));
                        },
                        icon: Badge(
                          //cart item count value changing
                            badgeContent: Consumer<CartProvider>(
                                builder: (context, data, child) {
                              return Text(data.cartItems.length.toString());
                            }),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ))),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              result!.image.toString(),
              height: double.infinity,
              width: MediaQuery.of(context).size.width - 50,
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.6),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        result!.model.toString(),
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Brand",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800))),
                      Expanded(
                          child: Text(result!.brand.toString(),
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Price",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w800))),
                      Expanded(
                          child: Text(result!.price.toString(),
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Color",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800))),
                      Expanded(
                          child: Text(result!.colour.toString(),
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text("Weight",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800))),
                      Expanded(
                          child: Text(result!.weight.toString(),
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //add to cart item button
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .itemAddToCart(result!);
                      },
                      child: const Text('Add to Cart',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
