import 'package:flutter/material.dart';
import 'package:acai_store/views/appbar.dart';

class ProfilePage extends StatefulWidget {
  final int currentIndex;

  ProfilePage({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Inicialize os controladores com os dados do usuário
    _nameController.text = 'Nome do Usuário';
    _emailController.text = 'usuario@email.com';
    _addressController.text = 'Rua ABC, 123';
    _cityController.text = 'Cidade XYZ';
    _zipCodeController.text = '12345-678';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                // Adicione a lógica de salvar aqui, se necessário
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationMenu(currentIndex: widget.currentIndex),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informações do Usuário',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildEditableField('Nome', _nameController, Icons.person),
            buildEditableField('E-mail', _emailController, Icons.email),

            const SizedBox(height: 32.0),
            const Text(
              'Endereço',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            buildEditableField('Rua', _addressController, Icons.location_on),
            buildEditableField('Cidade', _cityController, Icons.location_city),
            buildEditableField('CEP', _zipCodeController, Icons.pin_drop),
          ],
        ),
      ),
    );
  }

  Widget buildEditableField(String label, TextEditingController controller, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label),
      subtitle: _isEditing
          ? TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
          : Text(controller.text),
    );
  }
}
