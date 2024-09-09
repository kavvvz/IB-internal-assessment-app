import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:internal_assessment_v1/calendar_page.dart';
// import 'package:internal_assessment_v1/login_page.dart';
import 'globals.dart' as globals;
import 'calendar_page.dart';
import 'login_page.dart';

///creates the logout page
class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  String username = globals.username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, -1.29),
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
                alignment: const AlignmentDirectional(0.00, -0.35),
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, -0.4),
                child: IconButton(
                  onPressed: () {
                  },
                  iconSize: 40,
                  color: Colors.greenAccent,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
               Align(
                alignment: AlignmentDirectional(0.3, -0.39),
                child: Text(globals.email,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.24, -0.3),
                child: Text('Status: ${globals.defineStatus}',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, -0.15),
                child: TextButton(
                  child: const Text('Logout'),
                  onPressed: (){
                    //signs the user out
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()), // Replace with your page name
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(20, 20),
                    padding: const EdgeInsetsDirectional.fromSTEB(175, 12, 175, 12),
                    backgroundColor:  Colors.redAccent,
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarPage()));

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
