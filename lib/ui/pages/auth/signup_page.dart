part of '../pages.dart';

class SignUpPage extends StatefulWidget {
  static const String routes = '/signup_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  AuthBloc _bloc = AuthBloc();

  @override
  void initState() {
    _bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passController.dispose();
    passConfirmController.dispose();
    super.dispose();
  }

  validation() {
    if (fullNameController.text.isEmpty) {
      showAlertMessage(context, 'Message', "Full Name is empty", 'Close');
    } else if (emailController.text.isEmpty) {
      showAlertMessage(context, 'Message', "Email is empty", 'Close');
    } else if (passController.text.isEmpty) {
      showAlertMessage(context, 'Message', "Password is empty", 'Close');
    } else if (passConfirmController.text.isEmpty) {
      showAlertMessage(
          context, 'Message', "Password confirm is empty", 'Close');
    } else if (passController.text != passConfirmController.text) {
      showAlertMessage(context, 'Message',
          "Password and password confirm not valid", 'Close');
    } else {
      Map<String, dynamic> jsonSend = {
        "email": emailController.text,
        "password": passController.text,
      };
      _bloc.add(RegisterUser(jsonSend));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //for trigger button to dismiss keyboard on iOS platform
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: bgMainPageColor,
        // resizeToAvoidBottomInset: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignUpLoading) {
              progressDialogFull(context);
            } else if (state is AuthSignUpFailed) {
              globals.navigate.navigateToBack(context);
              showAlertMessage(context, 'Message', state.error, 'Close');
            } else if (state is AuthSignUpSuccess) {
              globals.navigate.navigateToBack(context);
              globals.navigate.navigateToRemove(MainPage.routes);
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // top ellipse
                Positioned(
                  left: -20,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/top-ellipse.png',
                          height: 223,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 106, left: 42),
                          child: Image.asset(
                            'assets/images/center-circle.png',
                            height: 77,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // top ellipse
                Positioned(
                  right: -20,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150, left: 42),
                        child: Image.asset(
                          'assets/images/center-circle.png',
                          height: 77,
                        ),
                      )
                    ],
                  ),
                ),
                bodySignUp()
              ],
            ),
          ),
        ),
      ),
    );
  }

  SafeArea bodySignUp() {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Register and get the job',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: blackColor.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseTextFormField(
                      emailController: fullNameController,
                      hintText: 'Type your full name',
                      paddingForm: const EdgeInsets.only(bottom: 16),
                    ),
                    BaseTextFormField(
                      emailController: emailController,
                      hintText:
                          'Type eve.holt@reqres.in for succeed registration',
                      paddingForm: const EdgeInsets.only(bottom: 16),
                    ),
                    BaseTextFormField(
                      emailController: passController,
                      hintText: 'Type pistol for succeed registration',
                      paddingForm: const EdgeInsets.only(bottom: 16),
                      isPass: true,
                    ),
                    BaseTextFormField(
                      emailController: passConfirmController,
                      hintText: 'Type pistol for succeed registration',
                      paddingForm: const EdgeInsets.only(bottom: 16),
                      isPass: true,
                      textInputAction: TextInputAction.done,
                    ),
                    BaseButton(
                      width: double.infinity,
                      height: 50,
                      onTap: () {
                        validation();
                      },
                      bodyButton: Text(
                        'Sign Up Now',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                        ),
                      ),
                      buttonColor: mainColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
