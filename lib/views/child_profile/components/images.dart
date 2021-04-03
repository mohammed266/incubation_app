import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incubation_app/views/child_profile/controllers/child_details.dart';
import 'package:incubation_app/views/child_profile/models/images.dart';


class ImagesScreen extends StatefulWidget {
  final int id;
  ImagesScreen(this.id);
  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  bool _isLoading = true;
  ImagesModel imagesModel;
  getImages()async{
    imagesModel = await ChildDetailsController().getImages(widget.id);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    getImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(
      child: CircularProgressIndicator(),
    ) : ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imagesModel.value.length,
      itemBuilder: (context, listIndex) => Column(
        children: [
          Text(imagesModel.value[listIndex].albumDate),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: imagesModel.value[listIndex].addAlbum.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              crossAxisCount: 3,
            ),
            itemBuilder: (i,gridIndex) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(imagesModel.value[listIndex].addAlbum[gridIndex]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
