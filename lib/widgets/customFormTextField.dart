import 'package:flutter/material.dart';



Widget buildTextField(
    String labelText, String placeholder, bool isPasswordField,TextEditingController fieldController) {
  return Padding(

    padding: EdgeInsets.only(bottom: 30),
    child: TextFormField(
      textInputAction: TextInputAction.next,
      controller: fieldController,
      obscureText: isPasswordField ? true : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          helperStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    ),
  );
}

Widget buildPhoneField(
    String labelText, String placeholder, bool isPasswordField,TextEditingController fieldController) {
  return Padding(

    padding: EdgeInsets.only(bottom: 30),
    child: TextFormField(
      textInputAction: TextInputAction.next,
      controller: fieldController,
      keyboardType: TextInputType.phone,
      obscureText: isPasswordField ? true : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          helperStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    ),
  );
}



Widget buildTextArea(
    String labelText, String placeholder, bool isPasswordField,TextEditingController fieldController) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextFormField(
      textInputAction: TextInputAction.next,
      controller: fieldController,
      obscureText: isPasswordField ? true : false,
      minLines: 7,
      maxLines: 500,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
          suffixIcon: isPasswordField
              ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
              : null,
          contentPadding: EdgeInsets.all(20),
          hintText: placeholder,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          helperStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
    ),
  );
}
