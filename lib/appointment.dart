import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          toolbarHeight: 65,
          leading: InkWell(
            onTap: (){
              //
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: Image.asset(
            'assets/icons/icon4.png',
            height: 40,
            width: 30,
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.white,
          actions: [],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.withOpacity(0.7),
                Color(0xFF3192D9).withOpacity(0.3)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Appointments',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (i, _) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: double.infinity,
                      height: 75,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset(,color: Colors.red,),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/icons/icon17.png'),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                'Dr. Ahmed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '01123456789',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              print('kkk');
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.purple,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 17,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => NewAppointmentScreen(),),);
                  },
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'ccccc',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
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

///second screen

class NewAppointmentScreen extends StatefulWidget {
  @override
  _NewAppointmentScreenState createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final List _time = [
    {
      'name': '11:00am',
    },
    {
      'name': 'فبراير 2021',
    },
    {
      'name': 'مارس 2021',
    },
    {
      'name': 'ابريل 2021',
    },
    {
      'name' : 'مايو 2021',
    },
    {
      'name' : 'يونيو 2021',
    },
  ];

  @override
  void initState() {
    createVariables();
    super.initState();
  }

  List<bool> selectedList = [];

  createVariables() {
    selectedList = List.generate(_time.length, (i) => false);
  }

  List<String> location = ['A', 'B', 'C', 'D'];
  List<String> appointmentName = ['A', 'B', 'C', 'D'];
  List<String> date = ['A', 'B', 'C', 'D'];
  String _newLocation;
  String _newName;
  String _newDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          toolbarHeight: 65,
          leading: InkWell(
            onTap: (){
              //
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: Image.asset(
            'assets/icons/icon4.png',
            height: 40,
            width: 30,
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.white,
          actions: [],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.withOpacity(0.7),
                Color(0xFF3192D9).withOpacity(0.3),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Appointments',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFFF8F8F8),
                ),
                child: DropdownButton<String>(
                  underline: Text(''),
                  items: location.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _newLocation = newValue;
                    });
                  },
                  value: _newLocation,
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.red,size: 20,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 12, color: Color(0xFFBFBFBF)),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFFF8F8F8),
                ),
                child: DropdownButton<String>(
                  underline: Text(''),
                  items: appointmentName.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _newName = newValue;
                    });
                  },
                  value: _newName,
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(Icons.person,color: Colors.grey,size: 20,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Appointment Name',
                        style: TextStyle(fontSize: 12, color: Color(0xFFBFBFBF)),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFFF8F8F8),
                ),
                child: DropdownButton<String>(
                  underline: Text(''),
                  items: date.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _newDate = newValue;
                    });
                  },
                  value: _newDate,
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(Icons.date_range,color: Colors.blueAccent,size: 20,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 12, color: Color(0xFFBFBFBF)),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Time',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2/1.3,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _time.length,
                itemBuilder: (_, i) => GestureDetector(
                  onTap: (){
                    setState(() {
                      createVariables();
                      selectedList[i] = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedList[i] ? Colors.white : Colors.grey.withOpacity(0.8),
                      border: Border.all(
                        color: selectedList[i] ? Colors.green : Colors.black26,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text('01:00 pm',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
             Row(
               children: [
                 GestureDetector(
                   onTap: () {
                     print('kk');
                   },
                   child: Container(
                     height: 35,
                     width: MediaQuery.of(context).size.width / 2.5,
                     decoration: BoxDecoration(
                       color: Colors.deepOrange.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                         child: Text(
                           'ccccc',
                           style: TextStyle(color: Colors.white, fontSize: 12),
                         )),
                   ),
                 ),
                 Spacer(),
                 GestureDetector(
                   onTap: () {
                     print('kk');
                   },
                   child: Container(
                     height: 35,
                     width: MediaQuery.of(context).size.width / 2.5,
                     decoration: BoxDecoration(
                       color: Colors.purple.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                         child: Text(
                           'ccccc',
                           style: TextStyle(color: Colors.white, fontSize: 12),
                         )),
                   ),
                 ),
               ],
             ),
             SizedBox(
               height: 10,
             ),
            ],
          ),
        ),
      ),
    );
  }
}
