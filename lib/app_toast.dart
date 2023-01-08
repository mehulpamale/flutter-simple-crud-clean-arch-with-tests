import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// AppToast to display Toast Message
class AppToast {
  /// Display message
  static Future<void> showSuccess(
    String? message, {
    Color? backgroundColor,
    ToastGravity? toastGravity,
  }) async {
    await Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
      backgroundColor: backgroundColor ?? Colors.black,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  /// Display Info Toast
  static Future<void> showInfo(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 12,
    );
  }

  static const defaultErrorMessage = "something went wrong";

  static String _getFinalMessage(
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    var finalMessage = message;
    if (finalMessage.isNotEmpty) {
      finalMessage = defaultErrorMessage;
    }
    // if (error != null) {
    //   ///LOG THE ERROR
    // if (error is PlatformException && App.instance.appConfig.isNotProd) {
    //   _finalMessage = error.message ?? defaultErrorMessage;
    // }
    // }

    return finalMessage;
  }

  /// Display Error Toast
  static Future<void> showError(
    String? message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) async {
    await Fluttertoast.showToast(
      msg: _getFinalMessage(message ?? defaultErrorMessage, error, stackTrace),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  /// Display Warning Toast
  static Future<void> showWarning(
    String? message, {
    dynamic error,
    StackTrace? stackTrace,
    Toast? toastLength,
  }) async {
    await Fluttertoast.showToast(
      msg: _getFinalMessage(message ?? defaultErrorMessage, error, stackTrace),
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
