import 'package:flutter/material.dart';
import 'package:meet/screens/mainPage.dart';
import 'package:meet/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    late String email;
    late String password;

    void _trySubmitForm() async {
      final bool? isValid = _formKey.currentState?.validate();


      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (user != null && isValid == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginMeet();
          })
          );
        }
      } catch (e) {
        print("البريد الالكتروني او كلمة المرور غير صحيحة او ليس لديك حساب قم بإنشاء حساب ");
        };

  }
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/design.png'),
                    alignment: Alignment.topCenter)),
            child: Container(
              margin: EdgeInsets.only(top: 230),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Color(0xFF2B2A27),
                          fontSize: 40, fontFamily: 'Careem'
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    child: SizedBox(
                      width: 310,
                      child: TextFormField(
                        onChanged: (value){
                          email = value;
                        },
                        decoration: InputDecoration(

                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                            prefixIcon: Icon(Icons.email,
                              color: Colors.black,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            label: Text('البريد الالكتروني',
                            style: TextStyle(fontFamily: 'Careem')
                            ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
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
                    height: 30,
                  ),
                  Container(
                    child: SizedBox(
                      width: 310,
                      child: TextFormField(
                        onChanged: (value){
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                        filled: true,
                            fillColor: Color(0xFFD9D9D9),
                            prefixIcon: Icon(Icons.lock,color: Colors.black,),
                          suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,),

                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            label: Text('كلمة المرور',
                                style: TextStyle(fontFamily: 'Careem')
                            ),
                      ),
                        validator: (value) { //to validate user input
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
                  Container(
                    margin: EdgeInsets.only(left:230),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'نسيت كلمة المرور',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: 15, fontFamily: 'Careem'
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: MaterialButton(
                      onPressed: (){
                        _trySubmitForm();
                      },
                      minWidth: 180,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: Color(0xFF2B2A27),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Colors.white, fontSize: 20,
                          fontFamily: 'Careem'),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ليس لديك حساب؟', style: TextStyle(fontFamily: 'Careem')
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){return SignupScreen();
                              }));
                              },
                            child: Text(
                              'انشاء حساب  جديد',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  fontFamily: 'Careem'
                              ),
                            ),
                        )
                      ],
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
