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
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
