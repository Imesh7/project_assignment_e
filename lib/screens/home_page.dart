import 'package:flutter/material.dart';
import 'package:project_assignment_e/providers/products_provider.dart';
import 'package:project_assignment_e/screens/details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final cardColor = [
    const Color(0xffd8c0fc),
    const Color(0xffaeb5fd),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //initialy fetch the product from the internet for from assets
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<ProductProvider>(context, listen: false);
    var api = Provider.of<ProductProvider>(
      context,
    ).apidatastatus;
    return Scaffold(
      backgroundColor: const Color(0xfff5fbfb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      "BLISS",
                      style: TextStyle(
                          color: Color(0xff39a6ae),
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    )),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: .5,
                              color: Colors.black,
                              spreadRadius: 1)
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-profile-glyph-black-icon-png-image_691589.jpg"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sudesh Kumara,",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),

                //textfield to search by model of the music items
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.search),
                          onPressed: () => Provider.of<ProductProvider>(context,listen: false).searchByModel(searchController.text.toLowerCase()),
                        ),
                      ),
                      hintText: 'Search Your Model',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                      minHeight: 10, minWidth: double.infinity, maxHeight: 30),
                ),
                const Text(
                  "By Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                //when any category button pressed the category pressed it will sort/filter the items
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categoryButton(
                          context,
                          const Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                          ),
                          "Guitar",
                          const Color(0xfffe8ea4),
                          categoryProvider),
                      const SizedBox(
                        width: 20,
                      ),
                      categoryButton(
                          context,
                          const Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                          ),
                          "Piano",
                          const Color(0xfffdd978),
                          categoryProvider),
                      const SizedBox(
                        width: 20,
                      ),
                      categoryButton(
                          context,
                          const Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                          ),
                          "Drums",
                          const Color(0xffa8ecc7),
                          categoryProvider),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Most popular',
                  style: TextStyle(fontSize: 19),
                ),
                const SizedBox(
                  height: 20,
                ),

                //fetched api data displayed...
                //this below ui render according to the search , category buton pressed & when fetch all the products 
                api == ApiStatus.loading
                    ? const CircularProgressIndicator()
                    : api == ApiStatus.completed
                        ? Consumer<ProductProvider>(
                            builder: (context, child, data) {
                            return child.productList.isNotEmpty
                                ? SizedBox(
                                    height: 250,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: child.productList.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetailScreen(
                                                              result: child
                                                                      .productList[
                                                                  index],
                                                              backColor: cardColor[
                                                                  index %
                                                                      cardColor
                                                                          .length])));
                                            },
                                            child: Card(
                                              color: cardColor[
                                                  index % cardColor.length],
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(35.0),
                                              ),
                                              child: SizedBox(
                                                height: 200,
                                                width: 170,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 12,
                                                                  right: 5),
                                                          child: Text(
                                                            child
                                                                .productList[
                                                                    index]
                                                                .model
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 5),
                                                          child: IconButton(
                                                              onPressed: () {},
                                                              icon: const Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Image.network(
                                                          child
                                                              .productList[
                                                                  index]
                                                              .image
                                                              .toString(),
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : const Text("No product");
                          })
                        : const Text("Error to get data")
              ],
            ),
          ),
        ),
      ),
    );
  }

  //category button "guitar" , "piano" & "drums"
  Widget categoryButton(BuildContext context, Icon iconb, String categoryName,
      Color color, var callback) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: Colors.green),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      onPressed: () {
        callback.filterByCate(categoryName.toLowerCase());
      },
      icon: iconb,
      label: Padding(
        padding: const EdgeInsets.only(left: 2, right: 6),
        child: Text(
          categoryName,
          style: const TextStyle(
              fontSize: 20,
              color: Color(0xfffffee2),
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
