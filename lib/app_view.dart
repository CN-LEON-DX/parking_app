import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'screens/auth/views/welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Parking App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Color.fromARGB(255, 0, 84, 207),
          onPrimary: Colors.white,
          ),
          fontFamily: 'BeVietam',
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: ((context, state) {
            // if (state.status == AuthenticationStatus.authenticated) {
            //   // return MultiBlocProvider(
            //   //   providers: [
            //   //     BlocProvider(
            //   //       create: (context) => SignInBloc(
            //   //           // context.read<AuthenticationBloc>().userRepository),
            //   //     ),
            //   //     // BlocProvider(
            //   //     //   create: (context) => GetPizzaBloc(
            //   //     //     FirebasePizzaRepo()
            //   //     //   )..add(GetPizza()),
            //   //     ),
            //   //   ],
            //   //   child: const HomeScreen(),
            //   // );
            // } else {
              return WelcomeScreen();
            // }
          }),
        ));
  }
}
