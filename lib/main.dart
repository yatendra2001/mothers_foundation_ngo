import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:mothers_foundation_ngo/blocs/blocs.dart';
import 'package:mothers_foundation_ngo/blocs/simple_bloc_observer.dart';
import 'package:mothers_foundation_ngo/config/custom_router.dart';
import 'package:mothers_foundation_ngo/repositories/repositories.dart';
import 'package:mothers_foundation_ngo/screens/login/login_cubit/login_cubit.dart';
import 'package:mothers_foundation_ngo/screens/screens.dart';
import 'package:mothers_foundation_ngo/utils/app_themes.dart';
import 'package:mothers_foundation_ngo/utils/session_helper.dart';
import 'key.dart';
import 'package:sizer/sizer.dart';
import 'utils/community_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  MyApp({Key? key}) : super(key: key);

  final client = StreamChatClient(
    streamChatApiKeyProd,
    logLevel: Level.INFO,
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>()),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            builder: (context, child) => StreamChat(
              client: client,
              child: child,
            ),
            navigatorKey: navigatorKey,
            title: 'Tevo',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            onGenerateRoute: CustomRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ),
      ),
    );
  }
}
