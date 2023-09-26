import 'package:flutter/material.dart';

class Snack extends StatefulWidget {
  const Snack({super.key});

  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  void _showSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("button click successfully"),
      duration: Duration(seconds: 5),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: (){
            _showSnackbar(context);
          }, child: Text("show snackbar")),
        ),
    );
  }
}