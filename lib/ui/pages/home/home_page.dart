part of '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc = BlocProvider.of<HomeBloc>(context);
    _bloc.add(GetRecommendationData());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(),
      body: const HomeBody(),
    );
  }

  AppBar homeAppbar() {
    return AppBar(
      backgroundColor: bgMainPageColor,
      elevation: 0,
      titleSpacing: 24,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Image.asset(
              'assets/images/ic_notification.png',
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int mockRecommendationCount = 8;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///header
            Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 4),
              child: Text(
                'Hellow Yeeds!',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                'Find Your Dream Job',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  const SearchWidget(),
                  const SizedBox(width: 16),
                  BaseButton(
                    width: 48,
                    height: 48,
                    onTap: () {},
                    bodyButton: Image.asset(
                      'assets/images/ic_filter.png',
                    ),
                    buttonColor: mainColor,
                  ),
                ],
              ),
            ),

            /// Popular Job
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Popular Job',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return BasePopularCard(
                    onTap: () {
                      global.navigate.navigateTo(DetailJobPage.routes);
                    },
                    isSelected: index == 0 ? true : false,
                  );
                },
              ),
            ),

            /// Recommendation Job
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Recommendation People',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // BlocListener<HomeBloc, HomeState>(
            //   listener: (context, state) {
            //     // TODO: implement listener
            //   },
            //   child: Container(),
            // )

            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return CircularProgressIndicator(
                    color: mainColor,
                  );
                } else if (state is HomeFailed) {
                  return showAlertMessage(
                      context, 'Message', state.error, 'Close');
                } else if (state is HomeSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: state.data.perPage / 2 * 125,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 1.4,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 16,
                      children: List.generate(
                        state.data.perPage,
                        (index) => BaseRecommendationCard(
                          dataUser: state.data.data[index],
                        ),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator(
                  color: mainColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
