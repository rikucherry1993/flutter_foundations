import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final IntValueSetter intMaxSetter;
  final IntValueSetter intMinSetter;

  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.intMaxSetter,
    required this.intMinSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
                textLabel: 'Minimum', intValueSetter: intMinSetter),
            const SizedBox(height: 12),
            RangeSelectorTextFormField(
              textLabel: 'Maximum',
              intValueSetter: intMaxSetter,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String textLabel;
  final IntValueSetter intValueSetter;

  const RangeSelectorTextFormField(
      {Key? key, required this.textLabel, required this.intValueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: textLabel),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'This must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
