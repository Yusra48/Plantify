import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/AddtoCart.dart';
import 'package:flutter_application_1/categories/Favourite.dart';
import 'package:flutter_application_1/categories/ProfileView.dart';
import 'package:flutter_application_1/categories/TrackOrder.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('CartService');

  void _addToCart(String itemName, String price) async {
    try {
      await cartCollection.add({
        'itemName': itemName,
        'price': price,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to Cart')),
      );
    } catch (e) {
      print('Error adding to cart: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add to Cart')),
      );
    }
  }

  void _addtoCart(String name, String price) {
    _addToCart(name, price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.teal,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.cancel_outlined),
                            color: Colors.black26,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/08/03/12/18/wolf-3581809_1280.jpg'),
                          radius: 40,
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Plantify',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'grimuser@gmail.com',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Shop",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Plant Care",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Community",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "My Account",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Track Order",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Enter your Email",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 2.0))),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "FAQ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Contact Us",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: SizedBox(
            height: 100,
            width: 200,
            child: Image.asset('images/plantify.png', fit: BoxFit.contain)),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrackOrder()));
              },
              icon: const Icon(Icons.track_changes_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('images/Container1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'There’s a Plant for everyone',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Get your 1st plant @ 40% off',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _buildPlantItem(
                    color: Colors.green,
                    image: const AssetImage('images/Plant.png'),
                    name: 'Peperomia',
                    price: '400',
                  ),
                  _buildPlantItem(
                    color: const Color.fromRGBO(247, 128, 167, 1),
                    image: const AssetImage('images/Plant.png'),
                    name: 'Watermelon',
                    price: '300',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color.fromRGBO(255, 243, 136, 1),
                    image: const AssetImage('images/yellowflower.png'),
                    name: 'Croton Petra',
                    price: '350',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color(0xFF59F0E1),
                    image: const AssetImage('images/plantpot.png'),
                    name: 'Bird’s Nest Fern',
                    price: '450',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color(0xFFE37DF5),
                    image: const AssetImage('images/careforplant.png'),
                    name: 'Caring for plants should be fun.',
                    price: 'Learn More',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color(0xFFFFC368),
                    image: const AssetImage('images/Plant.png'),
                    name: 'Cactus',
                    price: '500',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color(0xFF59F0E1),
                    image: const AssetImage('images/whiteplant.png'),
                    name: 'Aloe Vera',
                    price: '450',
                  ),
                  const SizedBox(height: 5),
                  _buildPlantItem(
                    color: const Color(0xFF59F0E1),
                    image: const AssetImage('images/Logo.png'),
                    name: 'Plant a Life',
                    price: 'Live amongst Living.Spread the joy',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.teal,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, size: 25),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(Icons.favorite, size: 25),
          ),
          BottomNavigationBarItem(
            label: 'Add to cart',
            icon: Icon(Icons.add_shopping_cart, size: 25),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person, size: 25),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Favourite(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Addtocart(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileView(),
                ),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Widget _buildPlantItem({
    required Color color,
    required AssetImage image,
    required String name,
    required String price,
  }) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Air Purifier',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  color: Colors.teal,
                  onPressed: () {
                    _addtoCart(name, price);
                  },
                ),
                const SizedBox(height: 3),
                const Icon(
                  Icons.favorite,
                  color: Colors.teal,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Image(
            height: 150,
            width: 150,
            image: image,
            fit: BoxFit.contain,
          ),
        ),
      ]),
    );
  }
}
