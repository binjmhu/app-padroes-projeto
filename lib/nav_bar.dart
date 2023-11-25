import 'package:app_padroes/controllers/user_controller.dart';
import 'package:app_padroes/models/user.dart';
import 'package:app_padroes/pages/home_page.dart';
import 'package:app_padroes/pages/search_page.dart';
import 'package:app_padroes/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          indicatorColor: Colors.grey,
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectIndex.value,
          onDestinationSelected: (index) =>
              controller.selectIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.house), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Pesquisar'),
            NavigationDestination(
                icon: Icon(Icons.shelves), label: 'Biblioteca'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Conta')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectIndex.value]),
    );
  }
}

class NavController extends GetxController {
  final Rx<int> selectIndex = 0.obs;

  final screens = [
    const HomePage(),
    const SearchPage(),
    Container(color: Colors.red),
    UserPage(),
  ];
}
