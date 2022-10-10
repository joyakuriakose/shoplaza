import 'package:get/get.dart';

import '../models/product_models.dart';
import '../services/classrepository.dart';

class CartController extends GetxController {
  CartRepository cartRepository = CartRepository();
  RxList<ProductsModel> cartItems = <ProductsModel>[].obs;
  RxDouble subtotal=0.0.obs;



}
