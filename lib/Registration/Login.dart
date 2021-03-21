import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:freelance2/BottomNavigation/BottomNav.dart';
import 'package:freelance2/Cart/Purchase.dart';
import 'package:freelance2/Registration/Signup.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  ProgressDialog pr;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();

  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          // Text("LOGIN",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,letterSpacing: 2)),
        ],
      ),
    );
  }

  Widget _entryField(String title,TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text("LOG IN",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,letterSpacing: 2)),
          // Text(
          //   title,
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          // ),
          SizedBox(
            height: 5,
          ),
          title == 'Password'
              ? Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 13,
                  child: TextFormField(
                      obscureText: true,
                      controller: controller,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'Metropolis', letterSpacing: 2.2,),
                      decoration: InputDecoration(
                          hintText:'Password' ,
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 13,
                  alignment: Alignment.center,
                  child: TextFormField(
                      controller: controller,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 15, fontFamily: 'aveb', letterSpacing: 2.2),
                      decoration: InputDecoration(
                          hintText:'Email' ,
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)),
                ),
        ],
      ),
    );
  }


  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signup()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'REGISTER A NEW ',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0XFF878787),
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Metropolis'),
            ),

            InkWell(
              child: Text(
                'ACCOUNT',
                style: TextStyle(
                    color: Color(0XFF878787),
                    fontSize: 14,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Metropolis'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top:18.0),
      child: Container(
        width: 150,
        height: 100,
        child: Image.asset('assets/Logo_black.png'),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("LOG IN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,letterSpacing: 1.2)),
            ),
          ),
          _entryField("Email id",_emailController),
          _entryField("Password", _passwordController),
        ],
      ),
    );
  }

  waittologin() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        FocusScope.of(context).unfocus();
        if(success=='error'){
          ScaffoldMessenger
              .of(context)
              .showSnackBar(SnackBar(content: Text('Incorrect Email and Password!')));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav()));
        }

        print('data updated');


      }
      else{
        waittologin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Stack(
            children: <Widget>[
//              Positioned(
//                  top: -height * .15,
//                  right: -MediaQuery.of(context).size.width * .4,
//                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _title(),
                      SizedBox(height: 40),
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {

                          if(_formKey.currentState.validate()){

                            pr.show();
                            print(_emailController.text.toString());
                            print(_passwordController.text.toString());
                            API.login(_emailController.text.toString(), _passwordController.text.toString());
                            waittologin();
                          }


                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BottomNav()));
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: 35,
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                                boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, spreadRadius: 2, blurRadius: 15),
                                    ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'SUBMIT',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'aveh',
                                  letterSpacing: 2,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(vertical: 10),
                      //   alignment: Alignment.centerRight,
                      //   child: Text('Forgot Password ?',
                      //       style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w500,
                      //           fontFamily: 'aveb')),
                      // ),
                      //
                      // SizedBox(height: 2),
                      _createAccountLabel(),

                      Text('BROWSE APP', style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF5E5E5E),
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Metropolis'),)
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      )),
    );
  }
}
