import 'package:flutter/material.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/bottom_bar_item/home/home_controller.dart';
import 'package:incubation_app/views/search/search_controller.dart';
import '../../alerts/alerts.dart';
import '../../book_service/book_service.dart';
import '../../daycare/daycare.dart';
import '../../search/search.dart';
import '../../../shared/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home1Screen extends StatefulWidget {
  @override
  _Home1ScreenState createState() => _Home1ScreenState();
}

class _Home1ScreenState extends State<Home1Screen> {
  HomeController controller = HomeController();
  SearchController _searchController = SearchController();
  int currentIndex = 0;
  int index1 = 0;
  int index2 = 1;
  int index3 = 2;

  @override
  void initState() {
    _searchController.getSearch().then((value) {});
    controller.getSliderData().then((value) {
      setState(() {
        controller.loading = false;
      });
    });
    controller.getService().then((value) {
      setState(() {
        controller.loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Color(0xFF273370),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AlertsScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'home1'.tr().toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => SearchScreen(),
                            //   ),
                            // );
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        controller.loading
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF273370)),
                              )
                            : Container(
                                height: 170,
                                width: double.infinity,
                                child: CarouselSlider(
                                  items: controller.sliderUrl
                                      .map((e) => Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(e),
                                                    fit: BoxFit.fill)),
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                      aspectRatio: 2 / 2,
                                      autoPlay: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      onPageChanged: (index1, T) {
                                        setState(() {
                                          currentIndex = index1;
                                        });
                                      }
                                      // onPageChanged: callbackFunction,
                                      ),
                                ),
                              ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index1
                                      ? Color(0xFFF7941D)
                                      : Color(0xFFECEFFF)),
                            ),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index2
                                      ? Color(0xFFF7941D)
                                      : Color(0xFFECEFFF)),
                            ),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index3
                                      ? Color(0xFFF7941D)
                                      : Color(0xFFECEFFF)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: defaultButton(
                    function: null,
                    text: 'our services'.tr().toString(),
                    color: Color(0xFFF2F2F2),
                    c: Color(0xFF273370)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Center(
                  child: controller.loading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF273370)),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.listOfService.length,
                          itemBuilder: (_, i) => Padding(
                            padding: EdgeInsets.only(
                              left: EasyLocalization.of(context).locale ==
                                      Locale('en', 'US')
                                  ? 0
                                  : 10,
                              right: EasyLocalization.of(context).locale ==
                                      Locale('en', 'US')
                                  ? 10
                                  : 0,
                            ),
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => DaycareScreen(),
                                //   ),
                                // );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${controller.listOfService[i].img}'),
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 90,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFF000000).withOpacity(0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${controller.listOfService[i].title}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.listOfService[i].shortDesc}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if(SharedHelper.isLogged)
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: defaultButton(
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookServiceScreen(),
                      ),
                    );
                  },
                  text: 'book service'.tr().toString(),
                  color: Color(0xFFA6C437),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
