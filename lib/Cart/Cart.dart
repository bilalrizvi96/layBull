import 'package:flutter/material.dart';
import 'package:freelance2/Cart/cart2.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

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
                        color: Colors.grey[300],
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
                "Address",
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
                "Country",
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
                "City",
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
                "State",
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
                "Zip Code",
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
              Spacer(),
              InkWell(
                onTap:(){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => Cart2()));
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
                    'NEXT',
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
    );;
  }
}
