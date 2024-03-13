import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/screens/panchang/panchang_cubit/panchang_cubit.dart';
import 'package:india_today/screens/panchang/panchang_screen.dart';
import 'package:india_today/screens/talk_to_astro/astro_cubit/astro_cubit.dart';
import 'package:india_today/screens/talk_to_astro/astro_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PanchangCubit>(
            create: (BuildContext context) => PanchangCubit(),
            child: const PanchangScreen(),
          ),
          settings: settings,
        );

      case '/talk_to_astro':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AstroCubit>(
            create: (BuildContext context) => AstroCubit(),
            child: const AstroScreen(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AstroCubit>(
            create: (BuildContext context) => AstroCubit(),
            child: const AstroScreen(),
          ),
          settings: settings,
        );
    }
  }
}
