import 'package:flutter/material.dart';
import 'package:paypee/shared/constants/colors.dart';
var emailInputDecoration = InputDecoration(
focusedBorder: const OutlineInputBorder(
borderSide: BorderSide(color: primaryColor, width: 1.5),
),
contentPadding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
focusedErrorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(5),
//gapPadding: 50.0,
borderSide:  const BorderSide(
color: red100, width: 1),
),
enabledBorder: const OutlineInputBorder(
borderSide: BorderSide(color: textColor20, width: 1)),
hintText: 'Enter email address',
hintStyle: const TextStyle(fontFamily: 'Mabry-Pro', fontSize: 14, 
fontWeight: FontWeight.w400, color: textColor30),
errorStyle: const TextStyle(fontFamily: 'Mabry-Pro', fontSize: 12, 
fontWeight: FontWeight.w400, color: red80),

);
