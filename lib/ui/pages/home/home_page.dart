part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController searchController = TextEditingController();
  HomeBloc _bloc = HomeBloc();
  List<UserData> listUserData = [];
  List<UserData> searchValue = [];

  @override
  void initState() {
    _bloc = BlocProvider.of<HomeBloc>(context);
    _bloc.add(GetRecommendationData());
    super.initState();
  }

  _search(String value) {
    debugPrint('Text serach: $value');
    List<UserData> _list = listUserData
        .where(
          (element) => element.firstName.toLowerCase().contains(
                value.toString().toLowerCase(),
              ),
        )
        .toList();
    setState(() {
      searchValue.clear();
      if (value.isNotEmpty) {
        searchValue.addAll(_list);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  SearchWidget(
                    controller: searchController,
                    onChange: (value) {
                      _search(value);
                    },
                  ),
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

            // value search widget
            Visibility(
              visible: searchValue.isNotEmpty,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: searchValue
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: BaseRecommendationCard(
                            dataUser: e,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailJobPage.routes,
                                arguments: e,
                              );
                              // globals.navigate.navigateToWithArgument(
                              //   DetailJobPage.routes,
                              //   state.data[0].data[index],
                              // );
                            },
                          ),
                        ),
                      )
                      .toList()),
            ),

            Visibility(
              visible: searchValue.isEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return SpinKitCircle(color: mainColor, size: 50.0);
                      } else if (state is HomeFailed) {
                        return showAlertMessage(
                            context, 'Message', state.error, 'Close');
                      } else if (state is HomeSuccess) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data[0].perPage,
                            itemBuilder: (BuildContext context, index) {
                              return BasePopularCard(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DetailJobPage.routes,
                                    arguments: state.data[0].data[index],
                                  );
                                  // globals.navigate.navigateToWithArgument(
                                  //   DetailJobPage.routes,
                                  //   state.data[0].data[index],
                                  // );
                                },
                                isSelected: index == 0 ? true : false,
                                data: state.data[0].data[index],
                              );
                            },
                          ),
                        );
                      }
                      return CircularProgressIndicator(
                        color: mainColor,
                      );
                    },
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

                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return SpinKitCircle(color: mainColor, size: 50.0);
                      } else if (state is HomeFailed) {
                        return showAlertMessage(
                            context, 'Message', state.error, 'Close');
                      } else if (state is HomeSuccess) {
                        // added data on list user data
                        listUserData.clear();
                        listUserData.addAll(state.data[0].data);
                        listUserData.addAll(state.data[1].data);
                        debugPrint(
                            'User size: ${listUserData.length.toString()}');

                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: state.data[1].perPage / 2 * 125,
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            childAspectRatio: 1.4,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 16,
                            children: List.generate(
                              state.data[1].perPage,
                              (index) => BaseRecommendationCard(
                                dataUser: state.data[1].data[index],
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DetailJobPage.routes,
                                    arguments: state.data[1].data[index],
                                  );
                                  // globals.navigate.navigateToWithArgument(
                                  //   DetailJobPage.routes,
                                  //   state.data[0].data[index],
                                  // );
                                },
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
          ],
        ),
      ),
    );
  }
}
