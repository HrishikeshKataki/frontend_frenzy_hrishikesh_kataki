import 'package:flutter/material.dart';
import 'package:frontend_frenzy/pages/order.dart';
import 'package:frontend_frenzy/pages/order_details.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';

class OrdersPage extends StatelessWidget {
  final List<Order> _orders = [
    Order(
      serviceName: 'Pizza',
      freelancerName: 'John Doe',
      status: 'Completed',
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
      details: 'Hot pizza',
    ),
    Order(
      serviceName: 'Burger',
      freelancerName: 'Jane Smith',
      status: 'In Progress',
      deliveryDate: DateTime.now().add(const Duration(days: 7)),
      details: 'Extra cheese',
    ),
    Order(
      serviceName: 'Shushi',
      freelancerName: 'Michael Johnson',
      status: 'Pending',
      deliveryDate: DateTime.now().add(const Duration(days: 14)),
      details: 'Healthy',
    ),
    Order(
      serviceName: 'Pizza',
      freelancerName: 'John Doe',
      status: 'Completed',
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
      details: 'Hot pizza',
    ),
    Order(
      serviceName: 'Burger',
      freelancerName: 'Jane Smith',
      status: 'In Progress',
      deliveryDate: DateTime.now().add(const Duration(days: 7)),
      details: 'Extra cheese',
    ),
    Order(
      serviceName: 'Shushi',
      freelancerName: 'Michael Johnson',
      status: 'Pending',
      deliveryDate: DateTime.now().add(const Duration(days: 14)),
      details: 'Healthy',
    ),
  ];

  OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            final order = _orders[index];
            return Card(
              surfaceTintColor: sbg,
              elevation: 3,
              shadowColor: primary,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: order.status == 'Completed'
                      ? Colors.green
                      : order.status == 'In Progress'
                          ? Colors.amber
                          : Colors.red,
                  child: Icon(
                    order.status == 'Completed'
                        ? Icons.check
                        : order.status == 'In Progress'
                            ? Icons.hourglass_bottom
                            : Icons.hourglass_top,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  '${order.serviceName} by ${order.freelancerName}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: ${order.status}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Delivery Date: ${order.deliveryDate.toString().split(' ').first}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: primary,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetails(order: order),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
