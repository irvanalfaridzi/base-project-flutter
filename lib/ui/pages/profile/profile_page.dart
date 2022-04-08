part of '../pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserRepository _client = UserRepository();
    return Scaffold(
      backgroundColor: bgMainPageColor,
      appBar: AppBar(
        backgroundColor: bgMainPageColor,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              showAlertMessageLogout(
                context,
                "Message",
                "Are you sure want to log out?",
                "Yes",
                () async {
                  progressDialogFull(context);
                  await Future.delayed(const Duration(milliseconds: 1000));
                  await Prefs.setToken("");
                  globals.navigate.navigateToRemove(SplashPage.routes);
                },
              );
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, left: 8, bottom: 8, right: 4),
              child: Icon(
                Icons.logout,
                color: mainColor,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<User?>(
          future: _client.getSingleUser('2'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                UserData userData = userInfo.data;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(userData.avatar),
                    const SizedBox(height: 8.0),
                    Text(
                      '${userInfo.data.firstName} ${userInfo.data.lastName}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      userData.email,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
              }
            }
            return SpinKitCircle(color: mainColor, size: 50.0);
          },
        ),
      ),
    );
  }
}
