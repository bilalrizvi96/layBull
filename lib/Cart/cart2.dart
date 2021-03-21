import 'package:flutter/material.dart';
import 'package:freelance2/Cart/Purchase.dart';

class Cart2 extends StatefulWidget {
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Icon(Icons.remove,size: 5, color: Colors.grey[500],),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.stop_circle,color: Colors.white,size: 5,),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Text(
                "CARD HOLDER NAME",
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/1.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[400])
                ),
                child: TextField(

                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      fillColor: Color(0xfff3f3f4),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "CARD NUMBER",
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/1.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[400])
                ),
                child: TextField(

                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      fillColor: Color(0xfff3f3f4),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "EXPIRATION",
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),

                  ),
                  SizedBox(width: 80,),
                  Text(
                    "CVV CODE",
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800),

                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400])
                    ),
                    child: TextField(

                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          fillColor: Color(0xfff3f3f4),
                        )),
                  ),
                  SizedBox(width: 15,),
                  Text('/' ,style: TextStyle(color: Colors.grey, fontSize: 20),),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400])
                    ),
                    child: TextField(

                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          fillColor: Color(0xfff3f3f4),
                        )),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey[400])
                    ),
                    child: TextField(

                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          fillColor: Color(0xfff3f3f4),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Divider(),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Text('SUBTOTAL',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w600),),
                  Spacer(),
                  Text('AED 1000',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text('TAX',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w600),),
                  Spacer(),
                  Text('AED 20',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text('TOTAL',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w800),),
                  Spacer(),
                  Text('AED 1020',style: TextStyle(color: Colors.black,fontSize: 11.0,fontWeight: FontWeight.w700),),
                ],
              ),
              Spacer(),

              InkWell(
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => cart3()));
                },
                child: Container(
                  width:  MediaQuery.of(context).size.width/1.07,
                  height: 45,
                  margin: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'PAY AED 1020',
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
            ],
          ),
        ),
      ),
    );
  }
}
