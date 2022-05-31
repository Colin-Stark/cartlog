import 'package:cartlog/model/database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const CartLog(),
  );
}

class CartLog extends StatelessWidget {
  const CartLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homies(),
    );
  }
}

class Homies extends StatefulWidget {
  const Homies({Key? key}) : super(key: key);

  @override
  State<Homies> createState() => _HomiesState();
}

class _HomiesState extends State<Homies> {
  Snack carty = Snack();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: TextButton(
            onPressed: () async {
              List<Map> response = await carty.readData('SELECT * FROM cart');
              debugPrint(response.toString());
            },
            child: const Text('SHOW DB'),
          ),
        ),
      ],
    ));
  }
}
