import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleInputField extends StatelessWidget {

  final String? labelText;
  final bool secureText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? txtController;
  final Widget? child;
  Function(String) onChanged;

  SimpleInputField({
    this.labelText,
    required this.secureText,
    this.inputType,
    this.inputAction,
    this.txtController,
    this.child,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: secureText,
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: txtController,

        decoration: InputDecoration(
          //floatingLabelBehavior:FloatingLabelBehavior.auto,
          border: InputBorder.none,
          hintText: labelText,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),

        ),
      ),
    );
  }
}
