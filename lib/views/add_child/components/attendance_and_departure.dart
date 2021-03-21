import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../add_child_controller.dart';

class AttendanceAndDepartureScreen extends StatefulWidget {
  const AttendanceAndDepartureScreen(
      {Key key, this.back, this.forward, this.addChildController})
      : super(key: key);

  final Function back, forward;
  final AddChildController addChildController;

  @override
  _AttendanceAndDepartureScreenState createState() =>
      _AttendanceAndDepartureScreenState();
}

class _AttendanceAndDepartureScreenState
    extends State<AttendanceAndDepartureScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Form(
          key: widget.addChildController.attendanceAndDepartureKey,
          child: Column(
            children: [
              Text(
                'الرجاء أضافة أسماء الأشخاص المسموح لهم \n بأخذ الطالب من المركز',
                style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF273370),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7941D),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الاسم الثلاثى',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.name,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person1AllowTakeChildThirdName = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'رقم الجوال',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.phone,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person1AllowTakeChildPhone = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'صلة القرابة',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.text,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person1AllowTakeChildRelativeRelation = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7941D),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الاسم الثلاثى',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.name,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person2AllowTakeChildThirdName = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'رقم الجوال',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.phone,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person2AllowTakeChildPhone = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'صلة القرابة',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6A6A6A)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          inputField(
                            textInputType: TextInputType.text,
                            secure: false,
                            validate: (v) {},
                            onChanged: (V) {},
                            onSave: (v) {
                              widget.addChildController
                                  .person2AllowTakeChildRelativeRelation = v;
                            },
                            icon: true,
                            hint: '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultButton(
                      text: 'رجوع',
                      function: () {
                        widget.back();
                      },
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: defaultButton(
                      text: 'استمرار',
                      function: () {
                        final attendanceAndDeparture = widget.addChildController
                            .attendanceAndDepartureKey.currentState;

                        if (attendanceAndDeparture.validate()) {
                          attendanceAndDeparture.save();
                          widget.forward();
                        }
                      },
                      color: Color(0xFFA6C437),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
