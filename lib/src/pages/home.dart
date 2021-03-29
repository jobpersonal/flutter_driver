import 'package:driver_app/src/pages/display.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _controller;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: TextFormField(
                key: Key('inputField'),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  labelText: 'Your Text',
                  border: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.cyan,
                      width: 40
                    )
                  ),
                  errorText: _errorText.isEmpty ? null : _errorText,
                  errorStyle:  TextStyle(
                    color:  Colors.red,
                    fontSize: 19,
                    fontWeight: FontWeight.w600
                  )
                ),
                style: TextStyle(
                  fontSize: 19
                ),
                controller: _controller,
                validator: (value) => value.isEmpty 
                ? 'Input at least one character' 
                : null,
              ),
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_rounded),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Display(
                    value: _controller.text,
                    doOnInit: () => Future.microtask(() => _controller.clear()),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
