import 'package:flutter/material.dart';
import 'package:meet/screens/meet.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginMeet extends StatelessWidget {
  static const String screenRoute = 'LoginMeet';

  LoginMeet({Key ? key}) : super(key: key) ;
  TextEditingController TextController = TextEditingController();


  late User signedInUser;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width:395,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/design2.png'),
                alignment: Alignment.topCenter,
              )),


          child: Container(

            margin: EdgeInsets.only(top: 235),
            child: Column(
              children: [
                Container(
                    width: 300,
                    height: 90,
                    padding: EdgeInsets.only(right: 25, top: 13, left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A27),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Text('الاجتماع الاسبوعي',
                                      style: TextStyle(color: Color(0xFF4DB6C9),
                                          fontSize: 17,
                                          fontFamily: 'Careem')),
                                ),

                                Container(
                                    child: SizedBox(height: 20,width: 20,
                                      child: InkWell(
                                        child: Image.asset('assets/images/buttonMore.png',height: 2,width: 2),
                                        onTap: (){},
                                      ),
                                    )
                                ),
                              ],),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: Container(

                                  child: Text('مرحلة المشاريع / ٢١ مايو / م.عبير',
                                    style: TextStyle(color: Color(0xFFffffff),
                                        fontSize: 15,
                                        fontFamily: 'Careem'),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ]
                    )
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                    width: 300,
                    height: 90,
                    padding: EdgeInsets.only(right: 25, top: 13, left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A27),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Text('اجتماع القسم المالي',
                                      style: TextStyle(color: Color(0xFF4DB6C9),
                                          fontSize: 17,
                                          fontFamily: 'Careem')),
                                ),

                                Container(
                                    child: SizedBox(height: 20,width: 20,
                                      child: InkWell(
                                        child: Image.asset('assets/images/buttonMore.png',height: 2,width: 2),
                                        onTap: (){},
                                      ),
                                    )
                                ),
                              ],),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: Container(

                                  child: Text('مراجعة الرواتب / ٢٨ مايو / م.رغد',
                                    style: TextStyle(color: Color(0xFFffffff),
                                        fontSize: 15,
                                        fontFamily: 'Careem'),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ]
                    )
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                    width: 300,
                    height: 90,
                    padding: EdgeInsets.only(right: 25, top: 13, left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A27),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Text('اجتماع قسم ادارة المشاريع',
                                      style: TextStyle(color: Color(0xFF4DB6C9),
                                          fontSize: 17,
                                          fontFamily: 'Careem')),
                                ),

                                Container(
                                    child: SizedBox(height: 20,width: 20,
                                      child: InkWell(
                                        child: Image.asset('assets/images/buttonMore.png',height: 2,width: 2),
                                        onTap: (){},
                                      ),
                                    )
                                ),
                              ],),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: Container(

                                  child: Text('تنسيق الاعمال / ١٢ مارس / م.مرام',
                                    style: TextStyle(color: Color(0xFFffffff),
                                        fontSize: 15,
                                        fontFamily: 'Careem'),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ]
                    )
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                    width: 300,
                    height: 90,
                    padding: EdgeInsets.only(right: 25, top: 13, left: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A27),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  child: Text('الاجتماع السنوي',
                                      style: TextStyle(color: Color(0xFF4DB6C9),
                                          fontSize: 17,
                                          fontFamily: 'Careem')),
                                ),

                                Container(
                                    child: SizedBox(height: 20,width: 20,
                                      child: InkWell(
                                        child: Image.asset('assets/images/buttonMore.png',height: 2,width: 2),
                                        onTap: (){},
                                      ),
                                    )
                                ),
                              ],),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: Container(

                                  child: Text('سياسات الشركة / ٣١  ديسمبر / م.رِناد',
                                    style: TextStyle(color: Color(0xFFffffff),
                                        fontSize: 15,
                                        fontFamily: 'Careem'),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ]
                    )
                ),

                SizedBox(
                  height: 5,
                ),

                Container(
                    child: SizedBox(height: 140,width: 160,
                      child: InkWell(
                        child: Image.asset('assets/images/create.png'),
                        onTap: (){
                          openDialog(context);
                        },
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ادخل رمز الجلسة: ',
                style: TextStyle(fontFamily: 'Careem')),
            content: TextField(
              controller: TextController,
            ),
            actions: [
              MaterialButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return VideoConferencePage(conferenceID: TextController.text);
                }));

              },
                child: Text(
                    'تم',  style: TextStyle(fontFamily: 'Careem')
                ),
              )
            ],
          );
        }
    );


  }

}
