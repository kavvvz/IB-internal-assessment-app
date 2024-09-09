import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'calendar_page.dart';
import 'firebase_auth_service.dart';
import 'sign_up_page.dart';

///creates the login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  ///disposes to avoid memory leaks
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                  child:  SizedBox(
                    width: 1,
                    height: 0.2,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, -0.50),
                          child: Text(
                            'Welcome\n',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -0.26),
                          child: Text(
                            'Please login to continue',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              letterSpacing: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.92, -0.25),
                child: Text(
                  'email',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, -0.10),
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
                alignment: AlignmentDirectional(-0.92, 0.09),
                child: Text(
                  'password',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 0.26),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter password',
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
                alignment: const AlignmentDirectional(0.00, 0.50),
                child: TextButton(
                  child: const Text('Login'),
                  onPressed: _signIn,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    padding: const EdgeInsetsDirectional.fromSTEB(170, 12, 170, 12),
                    backgroundColor: const Color(0xFF008B8B),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 30,
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
              const Align(
                alignment: AlignmentDirectional(0.00, 0.70),
                child: Text(
                  'don\'t have an account?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 15,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 0.81),
                child: TextButton(
                  child: const Text('Sign Up'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()), // Replace with your page name
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(20, 20),
                    padding: const EdgeInsetsDirectional.fromSTEB(175, 6, 175, 6),
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


            ],
          ),
        ),
      ),
    );
  }
  ///signs the user in
  void _signIn() async {
    //takes the texts from the text controllers
    globals.email = _emailController.text;
    String password = _passwordController.text;
    //compares the email address to the admin's email address
    if(globals.email == globals.admin)
      {
        globals.defineStatus = 'Admin';
      }
    //compares the email address to the co-admin's email address
    else if(globals.email == globals.coAdmin)
      {
        globals.defineStatus = 'Co-Admin';
      }
    //if none of the above are true, they are classified as a team member
    else
      {
        globals.defineStatus = 'Team Member';
      }
    //signs the user in with the email and password from the text controllers
    User? user = await _auth.signInWithEmailAndPassword(globals.email, password);
    if (user != null) {
      print('Login successful');
      //navigates to the next page if login is successful
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const CalendarPage()),
      );
    } else {
      print('wrong email or password'); //does not log the user in
    }
  }
}
