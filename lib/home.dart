import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'featured-product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    
  final List<Map<String, String>> products = const [
    {"title": "Shoes", "image": "https://picsum.photos/200?random=4"},
    {"title": "Watch", "image": "https://picsum.photos/200?random=5"},
    {"title": "Bag", "image": "https://picsum.photos/200?random=6"},
    {"title": "Laptop", "image": "https://picsum.photos/200?random=7"},
  ];

  final List<Map<String, String>> offers = const [
    {"image": "https://picsum.photos/100?random=8", "desc": "50% Off on Electronics"},
    {"image": "https://picsum.photos/100?random=9", "desc": "Buy 1 Get 1 Free"},
    {"image": "https://picsum.photos/100?random=10", "desc": "Weekend Mega Sale"},
    {"image": "https://picsum.photos/100?random=11", "desc": "Discount on Fashion"},
    {"image": "https://picsum.photos/100?random=12", "desc": "Special Offer Today"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Products',
          style: GoogleFonts.suwannaphum(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        flexibleSpace: SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C4E31), Color.fromARGB(255, 173, 149, 127)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        )
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
               FeaturedProductsPage(),

              const SizedBox(height: 22 ),

               const Text(
          "Our Products",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 80.0, right:80.0, bottom: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 60,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 250,
                  
                ),
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2, 
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                //   childAspectRatio: 1,
                // ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column( 
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Image.network(
                                  product["image"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product["title"]!,
                                      style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          )),
                                  IconButton(
                                    icon: const Icon(Icons.add_shopping_cart, color: Colors.brown),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Item added to the cart"),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                    );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hot Offers 🔥",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  color:  Color.fromARGB(255, 173, 149, 127),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              offer["image"]!,
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Center(
                              child: Text(
                                offer["desc"]!,
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
    
  }
}