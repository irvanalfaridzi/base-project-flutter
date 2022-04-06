part of 'widgets.dart';

void progressDialogFull(BuildContext context) {
  showDialog(
    barrierColor: Colors.black.withOpacity(0.2),
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SpinKitCircle(
          color: mainColor,
          size: 50.0,
        ),
      );
    },
  );
}
