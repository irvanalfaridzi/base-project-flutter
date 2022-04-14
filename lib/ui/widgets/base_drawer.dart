part of 'widgets.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgMainPageColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                  ),
                  child: Image.asset(
                    'assets/images/ic_category.png',
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Menu',
                  style: GoogleFonts.dmSans(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            onTap: () => {
              Scaffold.of(context).openEndDrawer(),
              // globals.navigate.navigateToRemoveWithArg(MainPage.routes, 0),
            },
          ),
          ListTile(
            title: Text(
              'Bookmark',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            onTap: () => {
              globals.navigate.navigateToRemoveWithArg(MainPage.routes, 1),
            },
          ),
          ListTile(
            title: Text(
              'Message',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            onTap: () => {
              globals.navigate.navigateToRemoveWithArg(MainPage.routes, 2),
            },
          ),
          ListTile(
            title: Text(
              'Profile',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            onTap: () => {
              globals.navigate.navigateToRemoveWithArg(MainPage.routes, 3),
            },
          ),

          /// exapmle of sub list
          // const Divider(
          //   indent: 16,
          //   endIndent: 16,
          // ),
          // ListTile(
          //   title: const Text('Refund and Return policy'),
          //   onTap: () => {},
          // ),
        ],
      ),
    );
  }
}
