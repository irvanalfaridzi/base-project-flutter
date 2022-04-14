part of 'pages.dart';

class SplashPage extends StatelessWidget {
  static const String routes = '/splash_page';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/images/center-circle.png',
      ),
      nextScreen: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool _isLoading = true;
  checkUserLogged() async {
    String token = await Prefs.getToken;

    if (token != "") {
      // add delay effect
      await Future.delayed(const Duration(milliseconds: 1000));
      globals.navigate.navigateToRemoveWithArg(MainPage.routes, 0);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    checkUserLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          // top circle
          Positioned(
            right: -30,
            child: Padding(
              padding: const EdgeInsets.only(top: 19),
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

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find the Job You\'ve\nAlways Dreamed of',
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'One of the places where you will find the right job with your field of interest, and you just have to wait for the manager to call you to hire',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  BaseButton(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    onTap: () {
                      globals.navigate.navigateReplaceTo(LoginPage.routes);
                    },
                    bodyButton: Text(
                      'Get Started',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    buttonColor: mainColor,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),

          // loading screen
          Visibility(
            visible: _isLoading,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.2),
              child: Center(
                child: SpinKitCircle(
                  color: mainColor,
                  size: 50.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
