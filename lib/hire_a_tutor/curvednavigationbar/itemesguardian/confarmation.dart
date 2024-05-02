import 'package:flutter/material.dart';
class Confarmation extends StatefulWidget {
  const Confarmation({super.key});

  @override
  State<Confarmation> createState() => _ConfarmationState();
}

class _ConfarmationState extends State<Confarmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confarmation'),
      ),
    );
  }
}
