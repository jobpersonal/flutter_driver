import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  final String value;
  final void Function() doOnInit;
  const Display({
    @required this.value,
    @required this.doOnInit,
    Key key  
  }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override initState() {
    super.initState();
    widget.doOnInit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display')
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              "${widget.value}",
              style: TextStyle(
                fontSize: 22
              )
            )
          ),
        )
      )
    );
  }
}