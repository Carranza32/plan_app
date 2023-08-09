import 'package:flutter/material.dart';

Color primaryColor() => const Color(0xff025e90);

InputDecoration formFieldStyle() => const InputDecoration(
	labelStyle: TextStyle(color: Color(0xffe8e8e8)),
	border: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	hintStyle: TextStyle(color: Color(0xffe8e8e8)),
);

ButtonStyle primaryButtonStyle() => ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(primaryColor()),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 25)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

ButtonStyle accentButtonStyle() => ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff00d6d6)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

ButtonStyle outlineButtonStyle() => ButtonStyle(
	backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
	foregroundColor: MaterialStateProperty.all<Color>(primaryColor()),
	side: MaterialStateProperty.all<BorderSide>(BorderSide(color: primaryColor())),
	padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
	shape: MaterialStateProperty.all<RoundedRectangleBorder>(
		RoundedRectangleBorder(
			borderRadius: BorderRadius.circular(5.0),
		),
	),
);

ButtonStyle textButtonStyle() => ButtonStyle(
	foregroundColor: MaterialStateProperty.all<Color>(primaryColor()),
	padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
);

TextStyle titleStyle() => const TextStyle(
	fontSize: 20,
	fontWeight: FontWeight.bold,
	color: Color(0xff007eb9),
);

TextStyle cardTitleStyle() => const TextStyle(
	fontSize: 16,
	color: Color(0xff007eb9),
);

BoxDecoration containerCardDecoration({Color color = Colors.white, double radius = 10}) => BoxDecoration(
	borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: const Color(0xffe8e8e8)),
	color: color,
	boxShadow: const [
		BoxShadow(
			offset: Offset(0, 3),
			spreadRadius: -4,
			blurRadius: 10,
			color: Color.fromRGBO(0, 0, 0, 0.2),
		),
	],
);