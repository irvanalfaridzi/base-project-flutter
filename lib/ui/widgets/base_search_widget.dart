part of 'widgets.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function onChange;
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            widget.onChange(value);
          },
          style: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search your dream job',
            hintStyle: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: blackColor.withOpacity(0.4),
            ),
            icon: Image.asset(
              'assets/images/ic_search.png',
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
