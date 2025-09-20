

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testprodcut/business_logic/models/contact.dart';
import 'package:testprodcut/data/contact/contact_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(LoadContacts());

    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ContactLoaded) {
            return ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (_, i) {
                Contact c = state.contacts[i];
                return ListTile(title: Text(c.name), subtitle: Text(c.phone));
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
