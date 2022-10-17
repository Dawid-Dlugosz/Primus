import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/model/flashcard_set.dart';

void firebaseMigrateScript() async {
  // var querySnapshot = await FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).get();

  // querySnapshot.docs.forEach((element) async {
  //   var docRef = FirebaseFirestore.instance.collection(FirebaseCollection.flashcards.name).doc(element.id);
  //   var x = await docRef.get();
  //   var flashcardSet = FlashCardSet.fromJson(x.data() as Map<String, dynamic>);

  //   flashcardSet.flashcards.forEach((element) {
  //     element.words.forEach((el) {
  //       print('dawdwa :${el.learModes}');
  //     });
  //   });

  //   docRef.update({'flashcard': flashcardSet.flashcards.map((e) => e.toJson()).toList()});
  // });
}
