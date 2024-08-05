import 'package:awsshop/components/admin/categories_tab/categories_view.dart';
import 'package:awsshop/components/admin/customice_tab/customice_view.dart';
import 'package:awsshop/components/admin/products_tab/products_tab_view.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Panel Administración'),
          bottom: const TabBar(
            unselectedLabelColor: Color.fromARGB(77, 183, 22, 22),
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.format_paint), text: 'Estilos'),
              Tab(icon: Icon(Icons.category), text: 'Categorías'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Productos'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomiceTab(),
            ProductsTab(),
            CategoriesTab(),
          ],
        ),
      ),
    );
  }
}
