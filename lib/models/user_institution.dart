import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    items = List<String>.from(document['items']);
  }

  UserInstitution.all(
      this.id,
      this.name,
      this.address,
      this.stateCountry,
      this.cep,
      this.city,
      this.phone,
      this.email,
      this.password,
      this.confirmPassword,
      this.images,
      this.description,
      this.emailContact,
      this.items) {
    id = id;
    name = name;
    address = address;
    stateCountry = stateCountry;
    cep = cep;
    city = city;
    phone = phone;
    email = email;
    password = password;
    confirmPassword = confirmPassword;
    images = images;
    description = description;
    emailContact = emailContact;
    items = items;
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  DocumentReference get firestoreRef => firestore.doc('users_institution/$id');
  Reference get storageRef => storage.ref().child('institutions').child(name);

  String id = '';
  late String name;
  late String address;
  late String stateCountry;
  late String cep;
  late String city;
  late String phone;
  late String email;
  String password = '';
  String confirmPassword = '';
  List<String> images = [];
  String description = '';
  String emailContact = '';
  List<String> items = [];

  List<dynamic>? newImages;

  @override
  String toString() {
    return 'UserInstitution{id: $id, name: $name, address: $address, stateCountry: $stateCountry, cep: $cep, city: $city, phone: $phone, email: $email, images: $images, description: $description, emailContact: $emailContact, items: $items, newImages: $newImages}';
  }

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
      'items': items,
    };
  }

  UserInstitution clone() {
    return UserInstitution.all(
      id,
      name,
      address,
      stateCountry,
      cep,
      city,
      phone,
      email,
      password,
      confirmPassword,
      images,
      description,
      emailContact,
      items,
    );
  }
}
