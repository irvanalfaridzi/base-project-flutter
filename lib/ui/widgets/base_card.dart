part of 'widgets.dart';

class BasePopularCard extends StatefulWidget {
  final Function onTap;
  final bool isSelected;
  const BasePopularCard({
    Key? key,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<BasePopularCard> createState() => _BasePopularCardState();
}

class _BasePopularCardState extends State<BasePopularCard> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: isSelected ? mainColor : whiteColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: () {
          widget.onTap();
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? whiteColor : bgMainPageColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text(
                  '\$50k - \$60k',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? whiteColor : blackColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 4),
              child: Text(
                'Senior Graphic Designer',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? whiteColor : blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Dsgn Agency • Jakarta, Id ',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? whiteColor : blackColor,
                ),
              ),
            ),
            SizedBox(
              width: 252,
              height: 22,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 11),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(
                        color: isSelected ? whiteColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color:
                              isSelected ? Colors.transparent : bgMainPageColor,
                        )),
                    child: Center(
                      child: Text(
                        'Full Time',
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? mainColor : blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BaseRecommendationCard extends StatefulWidget {
  const BaseRecommendationCard({Key? key}) : super(key: key);

  @override
  State<BaseRecommendationCard> createState() => _BaseRecommendationCardState();
}

class _BaseRecommendationCardState extends State<BaseRecommendationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 107,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: bgMainPageColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        'Tokopedia',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Onsite',
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19, bottom: 2),
              child: Text(
                'Sr. UI Designer',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7.0),
                  child: Image.asset(
                    'assets/images/ic_location.png',
                    width: 14,
                  ),
                ),
                Text(
                  'Jakarta, Indonesia',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}