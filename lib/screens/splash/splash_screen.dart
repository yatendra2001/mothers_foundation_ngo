import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothers_foundation_ngo/blocs/blocs.dart';
import 'package:mothers_foundation_ngo/screens/login/onboarding/onboarding_pageview.dart';
import 'package:mothers_foundation_ngo/screens/login/pageview.dart';
import 'package:mothers_foundation_ngo/utils/theme_constants.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (prevState, state) => prevState.status != state.status,
          listener: (context, state) {
            if (state.status == AuthStatus.unauthenticated) {
              //Go to welcome screen
              Navigator.of(context).pushNamed(LoginPageView.routeName);
            } else if (state.status == AuthStatus.authenticated &&
                state.isUserExist == true) {
              //Go to navigation screen

            } else if (state.status == AuthStatus.authenticated &&
                state.isUserExist == false) {
              Navigator.of(context).pushNamed(Onboardingpageview.routeName);
            }
          },
          child: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryBlackColor),
            ),
          ),
        ));
  }
}
