import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kitep/constants/constants.dart';

class Go {
  static to(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }

  static replace(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }
}

class MToast {
  showBrown(message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MColor.brown,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  showRed(message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MColor.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
