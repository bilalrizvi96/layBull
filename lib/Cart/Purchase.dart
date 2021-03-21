import 'package:flutter/material.dart';

class cart3 extends StatefulWidget {
  @override
  _cart3State createState() => _cart3State();
}

class _cart3State extends State<cart3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(left: 10,right: 10, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),

                  SizedBox(width: 85,),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.stop_circle,color: Colors.white,size: 5,),
                  ),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.stop_circle,color: Colors.white,size: 5,),
                  ),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Icon(Icons.remove,size: 5, color: Colors.black,),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.stop_circle,color: Colors.white,size: 5,),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Center(child: Icon(Icons.check_circle, size: 42, color: Colors.green,)),
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "THANK YOU FOR YOUR  ",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500, letterSpacing: 0.11),
                ),
              ),
              Center(
                child: Text(
                  "PURCHASE ",
                  style: TextStyle(fontSize: 37,fontWeight: FontWeight.w800, letterSpacing: 0.11),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Text('TRACKING NO',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w600,letterSpacing: 0.01),),
                  Spacer(),
                  Text('12124124124',style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.bold , letterSpacing: 0.01),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text('ESTIMATED TIME',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w600),),
                  Spacer(),
                  Text('48 HOURS',style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text('SKU',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w600),),
                  Spacer(),
                  Text('#12812',style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
