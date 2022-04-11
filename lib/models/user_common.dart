import 'package:cloud_firestore/cloud_firestore.dart';

class UserCommon{

  UserCommon({required this.email, required this.password,});

  UserCommon.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document['name'];
    email = document['email'];
  }

  String id = '';
  late String name;
  late String email;
  late String password ;
  late String confirmPassword;

  @override
  String toString() {
    return 'UserCommon{id: $id, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users_common/$id');

  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'email': email
    };
  }

}