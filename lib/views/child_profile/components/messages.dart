import 'package:flutter/material.dart';
import 'package:incubation_app/shared/components/components.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';

class MessagesScreen extends StatefulWidget {
  final childId;
  final Function onSend;
  final ChildDetailsModel model;
  MessagesScreen({this.childId,this.onSend, this.model});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(vertical: 5),
            // height: 70,
            // width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/icon17.png'),
                      radius: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('اسم المدرس او المدرسه ',style: TextStyle(fontSize: 12,color: Color(0xFF273370)),),
                    Spacer(),
                    Text('2/2/2021',style: TextStyle(fontSize: 10,color: Color(0xFFAAAAAA)),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.',
                  style: TextStyle(fontSize: 9,color: Color(0xFFAAAAAA)),),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        inputField(
          hint: 'اكتب رد',
          // onSave: (v){},
          onChanged: (v){},
          // validate: (v){},
          secure: false,
          icon: true,
          textInputType: TextInputType.text,
          prefix: InkWell(
              onTap: (){
                widget.onSend();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Color(0xFFDF861C),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Icon(Icons.send,color: Colors.white,size: 15,))),
              )),
        ),
      ],
    );
  }
}
