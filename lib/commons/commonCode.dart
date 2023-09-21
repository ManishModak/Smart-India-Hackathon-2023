import 'package:flutter/material.dart';

InputDecoration textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(fontSize: 12,color: Colors.white24),
  fillColor: Colors.black12 ,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(12)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12)
  ),
) ;