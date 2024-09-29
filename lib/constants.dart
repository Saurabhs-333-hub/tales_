import 'package:flutter/material.dart';

contextWidth(context, n) {
  return MediaQuery.of(context).size.width / n;
}

contextHeight(context, n) {
  return MediaQuery.of(context).size.height / n;
}
