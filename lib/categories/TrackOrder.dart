import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final String orderId = "123456";
  final String orderDate = "2024-05-20";
  final String deliveryDate = "2024-05-27";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: 100,
            width: 200,
            child: Image.asset('images/plantify.png', fit: BoxFit.contain)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.teal,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your order has been received successfully.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            _buildOrderDetailRow('Order ID', orderId),
            SizedBox(height: 16),
            _buildOrderDetailRow('Order Date', orderDate),
            SizedBox(height: 16),
            _buildOrderDetailRow('Estimated Delivery', deliveryDate),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 180)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
