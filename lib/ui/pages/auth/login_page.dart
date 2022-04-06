part of '../pages.dart';

class LoginPage extends StatefulWidget {
  static const String routes = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthBloc _bloc = AuthBloc();

  @override
  void initState() {
    _bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  validation() {
    if (emailController.text.isEmpty) {
      showAlertMessage(context, 'Message', "Email is empty", 'Close');
    } else if (passController.text.isEmpty) {
      showAlertMessage(context, 'Message', "Password is empty", 'Close');
    } else {
      Map<String, dynamic> jsonSend = {
        "email": emailController.text,
        "password": passController.text,
      };
      _bloc.add(LoginUser(jsonSend));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //for trigger button to dismiss keyboard on iOS platform
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: bgMainPageColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              progressDialogFull(context);
            } else if (state is AuthFailed) {
              globals.navigate.navigateToBack(context);
              showAlertMessage(context, 'Message', state.error, 'Close');
            } else if (state is AuthSuccess) {
              globals.navigate.navigateToBack(context);
              globals.navigate.navigateToRemove(MainPage.routes);
            }
          },
          child: Stack(
            children: [
              // top circle
              Positioned(
                right: -30,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/top-circle.png',
                      width: 273,
                    ),
                  ),
                ),
              ),

              // top ellipse
              Positioned(
                left: -20,
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
              bodyLoginPage(),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea bodyLoginPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Sign In',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 50),
              child: Text(
                'Find the right job here',
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
                    emailController: emailController,
                    hintText: 'Type your email address',
                    paddingForm: const EdgeInsets.only(bottom: 16),
                    helperText: 'input "eve.holt@reqres.in" for succeed login',
                  ),
                  BaseTextFormField(
                    emailController: passController,
                    hintText: 'Type your password',
                    paddingForm: const EdgeInsets.only(bottom: 16),
                    isPass: true,
                    helperText: 'input "cityslicka" for succeed login',
                    textInputAction: TextInputAction.done,
                  ),
                  BaseButton(
                    width: double.infinity,
                    height: 50,
                    onTap: () {
                      validation();
                    },
                    bodyButton: Text(
                      'Sign In',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    buttonColor: mainColor,
                  ),
                  const SizedBox(height: 16),
                  BaseButton(
                    width: double.infinity,
                    height: 50,
                    onTap: () {
                      globals.navigate.navigateTo(SignUpPage.routes);
                    },
                    bodyButton: Text(
                      'Create New Account',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    buttonColor: blackColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
