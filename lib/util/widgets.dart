import 'package:flutter/material.dart';

ElevatedButton longButtons(String title, Function fun,
    {Color color = const Color(0xfff063057),
    Color textColor = const Color.fromRGBO(0, 0, 0, 1)}) {
  return ElevatedButton(
    onPressed: () => fun(),
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      foregroundColor: color,
      backgroundColor: color,
      elevation: 2,
      fixedSize: const Size.fromHeight(52),
    ),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Satoshi-Regular', color: textColor),
      ),
    ),
  );
}

label(String title) => Text(title);

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: const Color.fromRGBO(50, 62, 72, 1.0)),
    // hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

InputDecoration simpleInputDecoration(String hintText) {
  return InputDecoration(
    // hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(width: 1, color: Colors.green),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(width: 1, color: Colors.green),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(width: 1, color: Colors.yellowAccent)),
  );
}
