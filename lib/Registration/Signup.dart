import 'package:flutter/material.dart';
import 'package:freelance2/API/API.dart';
import 'package:freelance2/API/GloabalVariable.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'Login.dart';

class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  ProgressDialog pr;


  @override
  void initState() {
    pr = ProgressDialog(context);
    super.initState();
  }

  waittologin() async {
    await Future.delayed(const Duration(seconds: 2), (){
      if(API.complete == 'true'){
        pr.hide();
        FocusScope.of(context).unfocus();
        if(success=='error'){
          ScaffoldMessenger
              .of(context)
              .showSnackBar(SnackBar(content: Text('Something Went Wrong')));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()));
        }

        print('data updated');


      }
      else{
        waittologin();
      }
    });
  }

  // void _submit() {
  //   final isValid = _formKey.currentState.validate();
  //   if (!isValid) {
  //     return;
  //   }else
  //   {
  //
  //     setState(() {
  //       widget.getUserDetails(_first.text,_last.text,_email.text,_phone.text);
  //     });
  //
  //     Future.delayed(
  //         const Duration(
  //             milliseconds: 500), () {
  //
  //       Navigator.pop(context);
  //     });
  //   }
  //   _formKey.currentState.save();
  // }
  TextEditingController _first = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*1.1,
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.arrow_back),
                        //   // onPressed: () => Navigator.of(context)
                        //   // .push(MaterialPageRoute(builder: (_) => MainPage(0,0,0, "" , "")))
                        // ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              // width: MediaQuery.of(context).size.width/1.2,
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style:
                                  TextStyle(fontSize: 20, fontWeight: FontWeight.w900,letterSpacing: 2),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    // Text(
                    //   "Name",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: TextFormField(
                          controller: _first,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Name';
                            }
                            return null;
                          },
                          style: TextStyle(

                              fontSize: 15,
                              fontFamily: 'Metropolis',
                              letterSpacing: 2.2),
                          decoration: InputDecoration(
                              hintText:'Name',
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Email",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                          controller: _email,
                          style: TextStyle(
                              fontSize: 15, letterSpacing: 2.2),
                          decoration: InputDecoration(
                              hintText:'Email',
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Password",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          style: TextStyle(
                              fontSize: 15, letterSpacing: 2.2),
                          decoration: InputDecoration(
                              hintText:'Password',
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                    ),
                    SizedBox(
                      height:15,
                    ),
                    // Text(
                    //   "Phone number",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Phone Number';
                            }
                            return null;
                          },
                          controller: _phone,
                          style: TextStyle(
                              fontSize: 15, letterSpacing: 2.2),
                          decoration: InputDecoration(
                              hintText:'Phone Number',
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                    ),
                    SizedBox(
                      height:15,
                    ),
                    // Text(
                    //   "Address",
                    //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,letterSpacing: 2),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.07,
                      child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Address ';
                            }
                            return null;
                          },
                          controller: _address,
                          style: TextStyle(
                              fontSize: 15, letterSpacing: 2.2),
                          decoration: InputDecoration(
                              hintText:'Address',
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState.validate()){
                          pr.show();
                          API.Sigup(_email.text.toString(),_password.text.toString(),_first.text.toString(),_phone.text.toString(),_address.text.toString());
                          waittologin();
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: 45,
                          margin: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'SIGNUP',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'aveh',
                                letterSpacing: 0.11,
                                fontSize: 12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: InkWell(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'ALREADY HAVE A ',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}