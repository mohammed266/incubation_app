import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incubation_app/views/pdfViewer/view.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) => InkWell(
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomPDFViewer(),)),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/icon23.png',height: 30,width: 25,),
                SizedBox(
                  width: 10,
                ),
                Text('اسم التقرير يكتب هنا',style: TextStyle(fontSize: 12,color: Color(0xFF273370)),),
                Spacer(),
                Text('2/6/2021',style: TextStyle(color: Color(0xFFAAAAAA),fontSize: 10),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showImageDialog(String url)async{
    showCupertinoDialog(context: context, builder: (context) => Image.network(url),);
  }
}
