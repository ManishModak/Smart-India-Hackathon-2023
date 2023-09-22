import 'package:flutter/material.dart';

InputDecoration textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Colors.white54,
    fontSize: 20,
    letterSpacing: 1.25
  ),
  fillColor: Colors.black26,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(12)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12)
  ),
);