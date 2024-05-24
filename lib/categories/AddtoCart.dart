import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addtocart extends StatelessWidget {
  const Addtocart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.sort,
          color: Colors.black,
        ),
        title: SizedBox(
          height: 100,
          width: 200,
          child: Image.asset('images/plantify.png', fit: BoxFit.contain),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Bag',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: _buildCartItems()),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset('images/Group 129.png', width: 450),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItems() {
    final CollectionReference cartCollection =
        FirebaseFirestore.instance.collection('CartService');

    return StreamBuilder<QuerySnapshot>(
      stream: cartCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<QueryDocumentSnapshot> documents = snapshot.data?.docs ?? [];

        if (documents.isEmpty) {
          return const Center(
            child: Text('No items in cart.'),
          );
        }

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic>? data =
                documents[index].data() as Map<String, dynamic>?;

            if (data == null) {
              return ListTile(
                title: const Text('Unknown Item'),
                subtitle: const Text('Error retrieving item details'),
              );
            }

            final String itemName = data['itemName'] ?? 'Unknown Item';
            final String price = data['price'] ?? 'Unknown Price';

            return ListTile(
              title: Text(itemName),
              subtitle: Text('Price: $price'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await documents[index].reference.delete();
                },
              ),
            );
          },
        );
      },
    );
  }
}
