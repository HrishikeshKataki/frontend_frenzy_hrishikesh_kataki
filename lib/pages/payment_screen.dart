import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_frenzy/pages/orders_page.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  // String _cardNumber = '';
  // String _expiryDate = '';
  // String _cvv = '';
  // String _billingAddress = '';
  String _paymentOption = 'Credit_Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Payment'),
        iconTheme: const IconThemeData(color: white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Card Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your card number';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Expiry Date'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your expiry date';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CVV'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your CVV';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Billing Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your billing address';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: _paymentOption,
              decoration: const InputDecoration(labelText: 'Payment Option'),
              onChanged: (value) {
                setState(() {
                  _paymentOption = value!;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'Credit_Card',
                  child: Text('Credit Card'),
                ),
                DropdownMenuItem(
                  value: 'Debit_Card',
                  child: Text('Debit Card'),
                ),
                DropdownMenuItem(
                  value: 'UPI',
                  child: Text('UPI'),
                ),
                DropdownMenuItem(
                  value: 'Mobile_Banking',
                  child: Text('Mobile Banking'),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm Payment',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
