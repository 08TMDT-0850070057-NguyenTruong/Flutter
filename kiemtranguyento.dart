import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime Number Checker',
      home: PrimeNumberScreen(),
    ),
  );
}

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  TextEditingController numberController = TextEditingController();
  String resultText = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void checkPrime() {
    int number = int.tryParse(numberController.text) ?? 0;
    setState(() {
      if (isPrime(number)) {
        resultText = 'Số $number là số nguyên tố';
      } else {
        resultText = 'Số $number không phải là số nguyên tố';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiem tra so nguyen to'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nhập số',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: checkPrime,
                child: Text('Kiểm tra'),
              ),
              SizedBox(height: 16),
              Text(
                resultText,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}