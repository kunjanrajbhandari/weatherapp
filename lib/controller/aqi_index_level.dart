import 'package:flutter/material.dart';

class AqiIndexLevel {
  getIndexLevel(int level) {
    switch (level) {
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Moderate';
      case 4:
        return 'Poor';
      case 5:
        return 'Very Poor';
    }
  }

  getColorLevel(int level) {
    switch (level) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.greenAccent;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.red;
    }
  }
}
