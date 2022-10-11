import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard_set.dart';

void firebaseMigrateScript() async {
  // var querySnapshot = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).get();

  // querySnapshot.docs.forEach((element) {
  //   var docRef = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(element.id);
  //   docRef.update({'knowThreshold': FieldValue.delete()});
  // });
}
