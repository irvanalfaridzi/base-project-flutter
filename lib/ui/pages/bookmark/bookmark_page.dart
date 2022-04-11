part of '../pages.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 24, right: 24),
              child: Text(
                'Your Bookmark',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 24, left: 24, right: 24),
              child: Text(
                'Find the right job from your bookmark',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: blackColor.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: blackColor.withOpacity(0.05),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: BaseRecommendationCard(
                          dataUser: UserData(
                            avatar: "https://reqres.in/img/faces/10-image.jpg",
                            email: "byron.fields@reqres.in",
                            firstName: "Byron",
                            lastName: "Fields",
                            id: 10,
                          ),
                          onTap: () {
                            globals.navigate.navigateToWithArgument(
                              DetailJobPage.routes,
                              UserData(
                                avatar:
                                    "https://reqres.in/img/faces/10-image.jpg",
                                email: "byron.fields@reqres.in",
                                firstName: "Byron",
                                lastName: "Fields",
                                id: 10,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
