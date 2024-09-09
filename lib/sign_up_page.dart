import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internal_assessment_v3/firebase_auth_service.dart';
import 'globals.dart' as globals;
import 'calendar_page.dart';
import 'login_page.dart';
//import 'package:internal_assessment_v1/calendar_page.dart';
// import 'package:internal_assessment_v1/login_page.dart';

///creates the page for sign up
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //takes the instance of the class
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, -1.26),
                child: Container(
                  width: 500,
                  height: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff008b8b), Color(0xff008b8b00)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: const AlignmentDirectional(0.00, -1.00),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, -0.55),
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0.00, -0.62),
                child: Text(
                  'Sign-up',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.97, -0.44),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'enter your email',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, -0.30),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Enter email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.96, -0.1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'enter a username',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.96, 0.06),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _usernameController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Enter username',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.92, 0.29),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'create a password',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.96, 0.47),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 0.75),
                child: TextButton(
                  child: const Text('Sign Up'),
                  onPressed: _signUp,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(20, 20),
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(175, 12, 175, 12),
                    backgroundColor: const Color(0xFF008B8B),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.97, -0.98),
                child: TextButton(
                  child: const Text('く'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(39, 39),
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///signs up the user when called
  void _signUp() async {
    //takes the text from the text controllers
    globals.username = _usernameController.text;
    globals.email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpWithEmailAndPassword(globals.email, password);
    //signs up the user if there is no issue
    if (user != null) {
      print('Sign up successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalendarPage()),
      );
    } else {
      print('email unavailable');
    }
  }
}
