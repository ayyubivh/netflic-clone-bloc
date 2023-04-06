import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';
import 'application/downloads/downloads_bloc.dart';
import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'core/colors/colors.dart';
import 'presentation/mainpage/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<DownloadsBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<SearchBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<FastLaughBloc>(),
          )
        ],
        child: MaterialApp(
          title: 'Netflix clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: kBlack),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: bgColor,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: kWhite),
                bodySmall: TextStyle(color: kWhite),
              )),
          home: ScreenMainPage(),
        ),
      );
    });
  }
}
