import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/constants/foody_images.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/locals/local_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {

  // changing the status of the TextFields
  bool _status = true;

  // Controlling focus
  final FocusNode myFocusNode = FocusNode();

  // instance of auth controller
  final authController = Get.find<AuthController>();

  // Variables of User Data
  String? userEmail;



  @override
  void initState() {
    fetchUserData();
    super.initState();
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }


  // Fetching user's Data
  Future<String> fetchUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userEmail = await sp.getString(FoodyLocals.EMAIL);
    setState(() { });
    if(kDebugMode) print("USER: $userEmail");
    return userEmail!;
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
      color: Colors.white,
      child:  ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
               Container(
                height: 250.0,
                color: Colors.white,
                child:  Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 5.0.w, top: 2.0.h),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 17.0.sp,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.0.w),
                              child:  Text(
                                'PROFILE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 27.w),
                              child:  InkWell(
                                onTap: (){
                                  // A function that logs out the user
                                  authController.logoutUser();
                                },
                                child: Text(
                                  'LOGOUT',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child:  Stack(fit: StackFit.loose, children: <Widget>[
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                             Container(
                                width: 140.0,
                                height: 140.0,
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  image:  DecorationImage(
                                    image:  ExactAssetImage(
                                      FoodyImages.profileAvatar, // Profile Image is Here
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 CircleAvatar(
                                  backgroundColor: FoodyColors.mainColor3,
                                  radius: 25.0,
                                  child:  Icon(
                                    Icons.camera_alt,  // Change picture
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
               Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                               Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // _status ? _getEditIcon() :  Container(),
                                  Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child:  Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child:  Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               Flexible(
                                child:  TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Name",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,

                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child:  Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   Text(
                                    'Email ID',
                                    style: TextStyle(
                                        fontSize: 13.0.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child:  Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                               Flexible(
                                child:  TextField(
                                  decoration: InputDecoration(
                                    hintText: userEmail ?? "Enter Email ID"
                                  ),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 25.0),
                      //     child:  Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //          Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: <Widget>[
                      //              Text(
                      //               'Mobile',
                      //               style: TextStyle(
                      //                   fontSize: 16.0,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 2.0),
                      //     child:  Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //          Flexible(
                      //           child:  TextField(
                      //             decoration: const InputDecoration(
                      //                 hintText: "Enter Mobile Number"),
                      //             enabled: !_status,
                      //           ),
                      //         ),
                      //       ],
                      //     )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 25.0),
                      //     child:  Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: <Widget>[
                      //         Expanded(
                      //           child: Container(
                      //             child:  Text(
                      //               'Pin Code',
                      //               style: TextStyle(
                      //                   fontSize: 16.0,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ),
                      //           flex: 2,
                      //         ),
                      //         Expanded(
                      //           child: Container(
                      //             child:  Text(
                      //               'State',
                      //               style: TextStyle(
                      //                   fontSize: 16.0,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ),
                      //           flex: 2,
                      //         ),
                      //       ],
                      //     )),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 25.0, right: 25.0, top: 2.0),
                      //     child:  Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: <Widget>[
                      //         Flexible(
                      //           child: Padding(
                      //             padding: EdgeInsets.only(right: 10.0),
                      //             child:  TextField(
                      //               decoration: const InputDecoration(
                      //                   hintText: "Enter Pin Code"),
                      //               enabled: !_status,
                      //             ),
                      //           ),
                      //           flex: 2,
                      //         ),
                      //         Flexible(
                      //           child:  TextField(
                      //             decoration: const InputDecoration(
                      //                 hintText: "Enter State"),
                      //             enabled: !_status,
                      //           ),
                      //           flex: 2,
                      //         ),
                      //       ],
                      //     )),
                      !_status ? _getActionButtons() :  Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }


  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                child:  Text("Save"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                //   shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(20.0)
                // ),
                ),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus( FocusNode());
                  });
                },                
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus( FocusNode());
                    });
                  },
                  child: Text('Cancel'),
                )                 
              ), 
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: FoodyColors.mainColor3,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}