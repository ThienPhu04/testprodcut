import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testprodcut/data/login/login_bloc.dart';
import 'contact_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _userCtrl, decoration: const InputDecoration(labelText: "Username")),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactScreen()));
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed")));
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginSubmitted(_userCtrl.text, _passCtrl.text));
                  },
                  child: const Text("Login"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
