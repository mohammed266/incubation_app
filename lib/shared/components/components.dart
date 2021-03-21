import 'dart:io';

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

Widget inputField({
  TextEditingController controller,
  String hint,
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
    controller: controller,
    validator: validate,
    onSaved: onSave,
    onChanged: onChanged,
    keyboardType: textInputType,
    obscureText: secure,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
    this.image,
    this.onTap,
    this.text,
  }) : super(key: key);

  final Function onTap;
  final String text;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                image:
                    DecorationImage(image: FileImage(image), fit: BoxFit.cover),
                color: Color(0xFFF5F5F5),
              ),
              child: image.path ==''
                  ? Center(
                      child: Icon(
                      Icons.camera_alt_outlined,
                      color: Color(0xFF273370),
                      size: 20,
                    ))
                  : SizedBox(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF6A6A6A),
            ),
          ),
        ],
      ),
    );
  }
}
