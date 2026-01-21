import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scube/app/features/auth/presentation/provider/notifier/auth_notifier.dart';
import 'package:scube/app/features/auth/presentation/provider/state/auth_state.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
