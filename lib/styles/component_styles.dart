
import 'package:flutter/material.dart';

List<BoxShadow> embossedSwitchInnerShadows(bool isOn) {
  return [
    BoxShadow(color: Colors.black.withOpacity(isOn? 0.7 : 0.4)),
    BoxShadow(
      color: isOn ? Colors.blue : Colors.white60,
      blurRadius: 1.5,
      spreadRadius: 0.2,
      offset: const Offset(1.5, 1),
      // blurRadius: 10, // You can play around with these values
      // spreadRadius: 1,
      // offset: const Offset(2.5, 4),
    )
  ];
}

List<BoxShadow> embossedSwitchDotShadow() {
  return const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 2,
      spreadRadius: 1,
      offset: Offset(0, 2),
    ),
  ];
}