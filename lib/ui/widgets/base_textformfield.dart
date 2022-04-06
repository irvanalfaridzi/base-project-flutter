part of 'widgets.dart';

class BaseTextFormField extends StatefulWidget {
  const BaseTextFormField({
    Key? key,
    required this.emailController,
    required this.hintText,
    required this.paddingForm,
    this.isPass = false,
    this.textInputAction = TextInputAction.next,
    this.helperText = "",
  }) : super(key: key);

  final TextEditingController emailController;
  final String hintText;
  final EdgeInsetsGeometry paddingForm;
  final bool isPass;
  final TextInputAction textInputAction;
  final String helperText;

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  bool isObsureText = false;

  @override
  void initState() {
    if (widget.isPass) {
      isObsureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.paddingForm,
      child: TextFormField(
        controller: widget.emailController,
        textInputAction: widget.textInputAction,
        style: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: blackColor,
        ),
        obscureText: isObsureText,
        decoration: InputDecoration(
          helperStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: blackColor.withOpacity(0.4),
          ),
          helperText: widget.helperText == "" ? null : widget.helperText,
          hintStyle: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: blackColor.withOpacity(0.4),
          ),
          hintText: widget.hintText,
          fillColor: whiteColor,
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: mainColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: blackColor.withOpacity(0.5),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: mainColor,
              width: 2.0,
            ),
          ),
          suffixIcon: widget.isPass
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isObsureText = !isObsureText;
                    });
                  },
                  child: Icon(
                    isObsureText ? Icons.visibility : Icons.visibility_off,
                    color: blackColor.withOpacity(0.5),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
