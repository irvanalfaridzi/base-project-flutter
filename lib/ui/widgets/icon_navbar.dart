part of 'widgets.dart';

class IconNavbar extends StatelessWidget {
  final Function onTap;
  final String icNavbar;
  final bool isSelected;

  const IconNavbar({
    Key? key,
    required this.onTap,
    required this.icNavbar,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      splashColor: bgMainPageColor,
      child: Column(
        children: [
          Container(
            width: 24,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: isSelected ? mainColor : whiteColor,
            ),
          ),
          const SizedBox(height: 23),
          Image.asset(
            icNavbar,
            // width: 19,
            scale: 3.5,
            color: isSelected ? mainColor : blackColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
