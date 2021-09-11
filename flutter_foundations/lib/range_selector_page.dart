import 'package:flutter/material.dart';
import 'package:flutter_foundations/range_select_form.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _max = 0;
  int _min = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        intMinSetter: (value) => _min = value,
        intMaxSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            //will run validator callback
            formKey.currentState?.save(); //will run onSave callback
          }
          //TODO: Navicate to the generate page
        },
      ),
    );
  }
}
