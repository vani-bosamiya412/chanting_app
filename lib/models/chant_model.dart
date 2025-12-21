import 'package:flutter/material.dart';

class ChantModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String audio;

  ChantModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.audio,
  });
}