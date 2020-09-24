import 'package:flutter/material.dart';

void main() {
  runApp(Center(
    child: Container(
      child: Image.network(
          'https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber[600],
      ),
      width: 400.0,
      height: 400.0,
      padding: EdgeInsets.all(80.0),
    ),
  ));
}
