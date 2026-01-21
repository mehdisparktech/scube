import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/app/features/splash/provider/notifier/splash_notifier.dart';
import 'package:scube/app/features/splash/provider/state/splash_state.dart';

final splashProvider =
    NotifierProvider.autoDispose<SplashNotifier, SplashState>(
      SplashNotifier.new,
    );
