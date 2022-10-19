import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/blocs/Applicationblocs.dart';
import 'package:proj/models/user.dart';
import 'package:proj/providers/hostelprovider.dart';
import 'package:proj/services/auth.dart';
import 'package:proj/services/firestoreservice.dart';
import 'package:proj/sreens/homepage.dart';
import 'package:proj/sreens/hostelinfo.dart';
import 'package:proj/sreens/locationscreen.dart';
import 'package:proj/sreens/hostels.dart';
import 'package:proj/sreens/hostelsdetails.dart';
import 'package:proj/sreens/login.dart';
import 'package:proj/sreens/register.dart';
import 'package:proj/sreens/success.dart';
import 'package:proj/sreens/updatesuccess.dart';
import 'package:proj/sreens/voice.dart';
import 'package:proj/sreens/welcomepage.dart';
import 'package:proj/sreens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApplicationBloc>(
            create: ((context) => ApplicationBloc())),
        ChangeNotifierProvider<HostelProvider>(
            create: ((context) => HostelProvider())),
        StreamProvider(create: ((context) => firestoreService.getHostels())),
      ],
      child: StreamProvider<Userr>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'HostelApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/login': (context) => Login(),
            '/': (context) => LocationScreen(),
            '/register': (context) => Register(),
            '/hosteldetails': (context) => HostelDetails(),
            '/welcomepage': (context) => WelcomePage(),
            '/welcome': (context) => Welcome(),
            '/hostels': (context) => Hostels(),
            '/wrapper': (context) => Wrapper(),
            '/details': (context) => HostelInfo(),
            '/voice': (context) => VoicePage(),
            '/successscreen': (context) => SuccessScreen(),
            '/updatesuccessscreen': (context) => UpdateSuccessScreen()
          },
        ),
      ),
    );
  }
}
