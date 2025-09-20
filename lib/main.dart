import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testprodcut/business_logic/providers/mock_contact_provider.dart';
import 'package:testprodcut/business_logic/repositories/contact_repository.dart';
import 'package:testprodcut/data/contact/contact_bloc.dart';
import 'package:testprodcut/data/login/login_bloc.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  final contactRepository = ContactRepository(MockContactProvider());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => ContactBloc(contactRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Clean Arch Demo',
      home: const LoginScreen(),
    );
  }
}
