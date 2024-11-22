import 'package:flutter/material.dart';

ElevatedButton longButtons(String title, Function fun,
    {Color color = const Color(0xfff063057), Color textColor = Colors.white}) {
  return ElevatedButton(
    onPressed: () => fun(),
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      foregroundColor: color,
      elevation: 2,
      fixedSize: const Size.fromHeight(52),
    ),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontFamily: 'Switzer', color: Color.fromRGBO(255, 255, 255, 1)),
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

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
