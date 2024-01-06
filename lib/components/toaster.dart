import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static showToaster(message, backgroundcolor, textcolor) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundcolor,
        textColor: textcolor,
        fontSize: 14.0);
  }
}
