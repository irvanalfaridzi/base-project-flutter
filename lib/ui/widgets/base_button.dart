part of 'widgets.dart';

class BaseButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onTap;
  final Color buttonColor;
  final Widget bodyButton;
  const BaseButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.bodyButton,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: bodyButton,
      ),
    );
  }
}
