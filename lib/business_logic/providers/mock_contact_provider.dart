import '../models/contact.dart';

class MockContactProvider {
  List<Contact> fetchContacts() {
    return [
      Contact(name: "Nguyen Van A", phone: "123456"),
      Contact(name: "Le Thi B", phone: "654321"),
      Contact(name: "Ha Van C", phone: "789012"),
    ];
  }
}
