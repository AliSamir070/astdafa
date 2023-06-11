import 'package:astdafa/layout/hagz/cubit/hagz_cubit.dart';
import 'package:astdafa/shared/prefs_helper.dart';
import 'package:astdafa/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'blocObserver.dart';
import 'firebase_options.dart';
import 'layout/account_ads/cubit/my_apartment_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("ar",null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MyApartmentCubit()),
        BlocProvider(create: (context)=>HagzCubit()),
      ],
      child: const MyApp())
  );
}

class MyApp extends StatefulWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      PrefsHelper.clearCode();
    }
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        builder: (context , child){
          return MaterialApp(
            title: 'Astdafa',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: "Cairo",
              scaffoldBackgroundColor: Colors.white,
            ),
            home: SplashScreen(),
          );
        }
    );
  }
}
