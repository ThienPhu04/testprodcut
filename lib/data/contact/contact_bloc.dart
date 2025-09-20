import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testprodcut/business_logic/models/contact.dart';
import 'package:testprodcut/business_logic/repositories/contact_repository.dart';

abstract class ContactEvent {}
class LoadContacts extends ContactEvent {}

abstract class ContactState {}
class ContactLoading extends ContactState {}
class ContactLoaded extends ContactState {
  final List<Contact> contacts;
  ContactLoaded(this.contacts);
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository repository;

  ContactBloc(this.repository) : super(ContactLoading()) {
    on<LoadContacts>((event, emit) {
      final contacts = repository.getContacts();
      emit(ContactLoaded(contacts));
    });
  }
}
