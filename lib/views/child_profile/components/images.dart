import 'package:flutter/material.dart';


class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          crossAxisCount: 3,
        ),
        itemBuilder: (i,_) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: AssetImage('assets/images/image7.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
    );
  }
}
