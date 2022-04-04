part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  List<Widget> page = [
    const HomePage(),
    const BookmarkPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMainPageColor,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 72,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconNavbar(
              onTap: () {
                setState(() {
                  selectedPage = 0;
                });
              },
              icNavbar: 'assets/images/ic_home.png',
              isSelected: selectedPage == 0 ? true : false,
            ),
            IconNavbar(
              onTap: () {
                setState(() {
                  selectedPage = 1;
                });
              },
              icNavbar: 'assets/images/ic_bookmark.png',
              isSelected: selectedPage == 1 ? true : false,
            ),
            IconNavbar(
              onTap: () {
                setState(() {
                  selectedPage = 2;
                });
              },
              icNavbar: 'assets/images/ic_message.png',
              isSelected: selectedPage == 2 ? true : false,
            ),
            IconNavbar(
              onTap: () {
                setState(() {
                  selectedPage = 3;
                });
              },
              icNavbar: 'assets/images/ic_profile.png',
              isSelected: selectedPage == 3 ? true : false,
            ),
          ],
        ),
      ),
      body: page[selectedPage],
    );
  }
}
