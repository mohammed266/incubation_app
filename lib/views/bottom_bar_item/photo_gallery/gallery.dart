import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/alerts/alerts.dart';
import 'package:incubation_app/views/bottom_bar_item/photo_gallery/gallery_controller.dart';
import 'package:incubation_app/views/search/search.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  GalleryController controller = GalleryController();

  @override
  void initState() {
    controller.getGalleryData().then((value) {
      setState(() {
        controller.loading=false;
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
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFF273370),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> AlertsScreen(),),);
                      },
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'gallery'.tr().toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchScreen(),),);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: controller.loading
                    ? Center(
                      child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF273370)),
                ),
                    )
                    : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.galleryModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2/2,
                  ),
                  itemBuilder: (_, i) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage('${controller.galleryModel[i].img}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
