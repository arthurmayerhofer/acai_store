import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String imagePath;

  const ProductDetailsPage({Key? key, required this.productName, required this.imagePath})
      : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  List<String> selectedAddons = [];

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void _toggleAddon(String addon) {
    setState(() {
      if (selectedAddons.contains(addon)) {
        selectedAddons.remove(addon);
      } else {
        selectedAddons.add(addon);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            const Text(
              'Quantidade:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementQuantity,
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementQuantity,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Adicionais:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            _buildAddons(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Adicione lógica para adicionar ao carrinho
                // Pode ser implementado usando um provider, bloc, ou qualquer outra solução de gerenciamento de estado
                // Por enquanto, imprimimos os dados selecionados
                print('Produto: ${widget.productName}');
                print('Quantidade: $quantity');
                print('Adicionais: $selectedAddons');
              },
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddons() {
    List<String> addons = ['Addon 1', 'Addon 2', 'Addon 3']; // Substitua com seus addons reais

    return Column(
      children: addons.map((addon) {
        return ListTile(
          title: Text(addon),
          trailing: Checkbox(
            value: selectedAddons.contains(addon),
            onChanged: (_) => _toggleAddon(addon),
          ),
        );
      }).toList(),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ProductDetailsPage(
//       productName: 'Açaí Especial',
//       imagePath: 'assets/acai_special.jpg',
//     ),
//   ));
// }
