import 'package:acai_store/models/product.dart';
import 'package:acai_store/views/menu.dart';
import 'package:acai_store/views/profile_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class OverflowingLogoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const OverflowingLogoAppBar({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Adicione a lógica para abrir o menu lateral
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png', // Substitua pelo caminho correto da sua logo
      width: 40.0,
      height: 40.0,
      fit: BoxFit.contain,
    );
  }
}

class BottomNavigationMenu extends StatefulWidget {
  final int currentIndex;
  const BottomNavigationMenu({super.key, required this.currentIndex});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  //int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.white,
        ),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.black,
      onTap: _navigateToSelectedTab,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _navigateToSelectedTab(index);
    });
  }

  void _navigateToSelectedTab(int index) {
    switch (index) {
      case 0:
        // Navegar para a Home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(
              products: [
                Product(name: 'Milkshake de Açaí', price: 15.0),
                Product(name: 'Suco de Açaí', price: 20.0),
                Product(name: 'Catuçaí', price: 30.0),
                // Adicione mais purodutos conforme necessário
              ],
            ),
          ),
        );

        // Implemente a navegação para a página principal aqui, se necessário
        break;
      case 1:
        // Navegar para o Carrinho
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
        break;
      case 3:
        // Navegar para a Página de Perfil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage(currentIndex: 3)),
        );

        break;
    }
  }
}
