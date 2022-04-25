import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInstitution extends ChangeNotifier {
  UserInstitution({required this.email, required this.password});

  UserInstitution.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'];
    address = document['address'];
    stateCountry = document['stateCountry'];
    cep = document['cep'];
    city = document['city'];
    phone = document['phone'];
    email = document['email'];
    images = List<String>.from(document['images'] as List<dynamic>);
    description = document['description'];
    emailContact = document['emailContact'];
  }

  String id = '';
  late String name;
  late String address;
  late String stateCountry;
  late String cep;
  late String city;
  late String phone;
  late String email;
  late String password;
  late String confirmPassword;
  List<String> images = [];
  String description = '';
  String emailContact = '';

  @override
  String toString() {
    return 'UserInstitution{id: $id, name: $name, address: $address, stateCountry: $stateCountry, cep: $cep, city: $city, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword, images: $images, description: $description, emailContact: $emailContact}';
  }

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users_institution/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'stateCountry': stateCountry,
      'cep': cep,
      'city': city,
      'phone': phone,
      'email': email,
      'images': images,
      'description': description,
      'emailContact': emailContact,
    };
  }
}
