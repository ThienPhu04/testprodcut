import '../models/contact.dart';
import '../providers/mock_contact_provider.dart';

class ContactRepository {
  final MockContactProvider provider;

  ContactRepository(this.provider);

  List<Contact> getContacts() {
    return provider.fetchContacts();
  }
}
