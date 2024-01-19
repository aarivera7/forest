import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getForms() async{
  List forms = [];
  CollectionReference collectionReferenceForms = db.collection('forms');

  QuerySnapshot queryforms = await collectionReferenceForms.get();

  queryforms.docs.forEach((documento){
    forms.add(documento.data());
  });

  return forms;
}
