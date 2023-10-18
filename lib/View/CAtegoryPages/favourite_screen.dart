import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Controller/FavController.dart';

import '../../Widgets/ProductCard.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final FavAuth Fcontroller = Get.put(FavAuth());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Fcontroller.products.isEmpty
          ? const Center(
              child: Text("Your list is empty"),
            )
          :  ListView.builder(
                  itemCount: Fcontroller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard3(
                        index: index,
                        controller: Fcontroller,
                        product: Fcontroller.products.keys.toList()[index]);
                  })
    );
  }
}
