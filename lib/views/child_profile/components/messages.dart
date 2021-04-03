import 'package:flutter/material.dart';
import 'package:incubation_app/shared/components/components.dart';
import 'package:incubation_app/views/child_profile/controllers/child_details.dart';
import 'package:incubation_app/views/child_profile/models/chat.dart';

class MessagesScreen extends StatefulWidget {
  final childId;
  MessagesScreen({this.childId});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController message = TextEditingController();
  bool _isLoading = true;
  bool _sendMessage = false;
  ChatModel chatModel;
  ChildDetailsController controller = ChildDetailsController();
  getChat()async{
    chatModel = await controller.getChat(widget.childId);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    getChat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator(),) : Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: chatModel.value.length,
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
                    Text(chatModel.value[index].sender,style: TextStyle(fontSize: 12,color: Color(0xFF273370)),),
                    Spacer(),
                    Text(chatModel.value[index].time,style: TextStyle(fontSize: 10,color: Color(0xFFAAAAAA)),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(chatModel.value[index].messge,
                  style: TextStyle(fontSize: 9,color: Color(0xFFAAAAAA)),),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        inputField(
          hint: 'اكتب رد',controller: message,
          // onSave: (v){},
          onChanged: (v)=> message = v,
          // validate: (v){},
          secure: false,
          icon: true,
          textInputType: TextInputType.text,
          prefix: _sendMessage ? null : InkWell(
              onTap: ()async{
                if(message == null || message.text.isEmpty) return;
                setState(()=> _sendMessage = true);
                await controller.sendMessage(widget.childId, message.text);
                await getChat();
                message.clear();
                setState(()=> _sendMessage = false);
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
