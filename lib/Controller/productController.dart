import 'package:get/get.dart';
import '../DataModel/Product.dart';
import '../Controller/FirebaseService.dart';
import '../DataModel/UserModel.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  // Add a list of Product objects.
  final products = <Product>[].obs;
  final tshirts = <Product>[].obs;
  final jackets = <Product>[].obs;
  final trousers = <Product>[].obs;
  final shoes = <Product>[].obs;
  final combo = <Product>[].obs;
  final accesories = <Product>[].obs;
  final users = <UserData>[].obs;

  @override
  void onInit() {
    users.bindStream(FirestoreDB().Users());
    products.bindStream(FirestoreDB().newarrivals());
    tshirts.bindStream(FirestoreDB().Tshirt());
    jackets.bindStream(FirestoreDB().Jackets());
    trousers.bindStream(FirestoreDB().Trousers());
    shoes.bindStream(FirestoreDB().Shoes());
    combo.bindStream(FirestoreDB().Combo());
    accesories.bindStream(FirestoreDB().Accesories());
    super.onInit();
  }
}
