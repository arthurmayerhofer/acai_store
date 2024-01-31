import 'package:acai_store/views/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:acai_store/models/product.dart';
import 'package:acai_store/views/appbar.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class MenuPage extends StatelessWidget {
  final List<Product> products;

  const MenuPage({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OverflowingLogoAppBar(title: 'Açaí Shop'),
      bottomNavigationBar: const BottomNavigationMenu(currentIndex: 0),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            // Background Carousel
            child: FutureBuilder(
              future: _loadImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Uint8List> images = snapshot.data as List<Uint8List>;
                  return CarouselSlider(
                    items: List.generate(
                      images.length, // Número de imagens no carrossel
                      (index) => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: MemoryImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 200.0, // Defina a altura máxima desejada
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  );
                } else {
                  return Container(); // Pode exibir um indicador de carregamento aqui, se necessário
                }
              },
            ),
          ),
          // Menu Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Menu(products: products),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Uint8List>> _loadImages() async {
    List<String> imagePaths = [
      'assets/lolo.png',
      'assets/milkshake-praia.jpg',
      'assets/publi.jpg',
      // Adicione mais caminhos de imagem conforme necessário
    ];

    List<Uint8List> images = [];

    for (String path in imagePaths) {
      ByteData data = await rootBundle.load(path);
      images.add(data.buffer.asUint8List());
    }

    return images;
  }
}

class Menu extends StatefulWidget {
  final List<Product> products;

  const Menu({required this.products, Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 50, // Ajuste a largura conforme necessário
              height: 50, // Ajuste a altura conforme necessário
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/lolo.png'),
                ),
              ),
            ),
            title: Text(
              widget.products[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              'R\$ ${widget.products[index].price}',
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: widget.products[index].name,
                    imagePath: 'assets/lolo.png',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
