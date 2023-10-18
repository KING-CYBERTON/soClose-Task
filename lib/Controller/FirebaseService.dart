import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oxy_boot/View/CAtegoryPages/Accesories.dart';
import '../DataModel/Product.dart';
import '../DataModel/UserModel.dart';

class FirestoreDB {
  // Initialise Firebase Cloud Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> newarrivals() {
    return _firebaseFirestore.collection('newarrival').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Product>> Tshirt() {
    return _firebaseFirestore.collection('tshirt').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
    Stream<List<Product>> Jackets() {
    return _firebaseFirestore.collection('jacket').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
    Stream<List<Product>> Trousers() {
    return _firebaseFirestore.collection('trousers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
    Stream<List<Product>> Shoes() {
    return _firebaseFirestore.collection('shoes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
}
    Stream<List<Product>> Combo() {
    return _firebaseFirestore.collection('combo').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
}
    Stream<List<Product>> Accesories() {
    return _firebaseFirestore.collection('accesories').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
}
Stream<List<UserData>> Users() {
    return _firebaseFirestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserData.fromSnapshot(doc)).toList();
    });
}
}
