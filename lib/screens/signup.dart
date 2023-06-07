import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    late String email;
    late String password;

    //this method works only if the user click on signup button
    void _trySubmitForm() async {
      final bool? isValid = _formKey.currentState?.validate();

       try {
         final newUser = await _auth.createUserWithEmailAndPassword(
             email: email, password: password);
         if (newUser != null && isValid == true) {
           Navigator.push(context, MaterialPageRoute(builder: (context) {
             return LoginScreen();
           })
           );
         }
       } catch(e){
         print(e);
       }
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/design.png'),
                alignment: Alignment.topCenter)
        ),
        child: Container(
          margin: EdgeInsets.only(top: 180),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 110),
                child: Text(
                  'حساب جديد',
                  style: TextStyle(color: Color (0xFF2B2A27), fontSize: 38,  fontFamily: 'Careem'),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                child: SizedBox(
                  width: 310,
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))
                        ),
                        label: Text('الاسم الكامل',
                        style: TextStyle( fontFamily: 'Careem')
                        )
                    ),

                    validator: (value) { //to validate user input
                      if (value == null || value.trim().isEmpty) { //check if it's empty
                        return 'الرجاء ادخال الاسم الكامل';
                      }
                      if (value.trim().length < 5) { //if the full name less than 5 characters means it's not full name
                        return 'الرجاء ادخال الاسم بالكامل';
                      }
                      // Return null if the entered username is valid
                      return null;
                    },

                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Container(
                child: SizedBox(
                  width: 310,
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        label: Text('اسم المستخدم',
                            style: TextStyle( fontFamily: 'Careem')
                        )
                    ),

                    validator: (value) {  //to validate user input
                      if (value == null || value.trim().isEmpty) { //check if it's empty
                        return 'الرجاء ادخال اسم المستخدم';
                      }
                      if (value.trim().length < 4) { //if username less than 4 characters
                        return 'اسم المستخدم قصير جدا';
                      }
                      // Return null if the entered username is valid
                      return null;
                    },

                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Container(
                child: SizedBox(
                  width: 310,
                  height: 75,
                  child: TextFormField(
                    onChanged: (value){
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        hintText: 'example@gmail.com',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        label: Text('البريد الالكتروني',
                            style: TextStyle( fontFamily: 'Careem'))
                    ),

                    validator: (value) {  //to validate user input
                      if (value == null || value.trim().isEmpty) { //check if it's empty
                        return 'الرجاء ادخال البريد الالكتروني';
                      }
                      // Check if the entered email has the right format
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'الرجاء ادخال البريد الالكتروني بشكل صحيح';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Container(
                child: SizedBox(
                  width: 310,
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFD9D9D9),
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        label: Text('رقم الجوال',
                            style: TextStyle( fontFamily: 'Careem')
                        )
                    ),

                    validator: (value) { //to validate user input
                      if(value!.isEmpty){ //check if it's empty
                        return "الرجاء ادخال رقم الجوال";
                      }
                      //Check if the entered phone number is only numbers
                      else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                        return "الرجاء ادخال رقم الجوال بشكل صحيح";
                      }
                    },

                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Container(
                child: SizedBox(
                  width: 310,
                  height: 75,
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      label: Text('كلمة المرور',
                          style: TextStyle( fontFamily: 'Careem')),
                    ),

                    validator: (value) {//to validate user input
                      if (value == null || value.trim().isEmpty) { //check if it's empty
                        return 'الرجاء ادخال كلمة المرور';
                      }
                      if (value.trim().length < 8) { //if password less than 8 characters
                        return 'كلمة المرور قصيرة جدا';
                      }
                      // Return null if the entered password is valid
                      return null;
                    },

                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  child: MaterialButton(
                    onPressed: () {
                      _trySubmitForm();
                    },
                minWidth: 180,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                color: Color(0xFF2B2A27),
                child: Text(
                  'التسجيل ',
                  style: TextStyle(color: Colors.white, fontSize: 20,
                      fontFamily: 'Careem'),
                ),
              )
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' لديك حساب؟',
                        style: TextStyle( fontFamily: 'Careem')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                              fontFamily: 'Careem'
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
        ),
      ),
    );
  }
}
