import 'package:flutter/material.dart';


Widget defaultButton({
  text,
  function,
  color,
  double r = 10,
  Color c = Colors.white,
}) {
  return Container(
    width: double.infinity,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(r),
      color: color,
    ),
    child: FlatButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: c,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget inputField(
    {String hint,
      bool secure,
      TextInputType textInputType,
      bool icon = false,
      Function validate,
      Function onSave,
      Function onChanged,
      Widget prefix,
      Color color = Colors.white,
    }) {
  return TextFormField(
    validator: validate,
    onSaved: onSave,
    onChanged: onChanged,
    keyboardType: textInputType,
    obscureText: secure,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      fillColor: color,
      hintText: hint,
      hintStyle: TextStyle(
        color: Color(0xFFBFBFBF),
        fontSize: 13,
      ),
      filled: true,
      suffixIcon: icon ? prefix : Container(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xFFE5E5E5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xFFE5E5E5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xFFE5E5E5),
        ),
      ),
    ),
  );
}
