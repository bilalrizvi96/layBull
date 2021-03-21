// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:freelance2/Registration/Login.dart';
// import 'package:freelance2/Registration/Signup.dart';
// class Login_Registration extends StatefulWidget {
//   @override
//   _Login_RegistrationState createState() => _Login_RegistrationState();
// }
//
// class _Login_RegistrationState extends State<Login_Registration> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             SizedBox(height: 80,),
//             Container(
//               alignment: Alignment.center,
//               width: 300,
//               height: 300,
//               child: Image.asset('assets/Logo_black.png'),
//             ),
//             SizedBox(height: 10,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (_) => (LoginPage())));
//                   },
//                   child: Container(
//                     alignment: Alignment.centerLeft,
//                     // padding: EdgeInsets.all(18.0),
//                     height: MediaQuery.of(context).size.height/13,
//                     width:MediaQuery.of(context).size.width/2.5,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                         child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),
//                         )),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (_) => (Signup())));
//                   },
//                   child: Container(
//                     width:MediaQuery.of(context).size.width/2.5,
//                     alignment: Alignment.centerRight,
//                     // padding: EdgeInsets.all(18.0),
//                     height: MediaQuery.of(context).size.height/13,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                         child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),
//                         )),
//                   ),
//                 ),
//
//               ],
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Container(
//           height: 30,
//           padding: EdgeInsets.only(left: 20),
//           alignment: Alignment.bottomRight,
//           width: MediaQuery.of(context).size.width,
//           child: Text('BROWSE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan),),
//         ),
//       ),
//     );
//   }
// }
