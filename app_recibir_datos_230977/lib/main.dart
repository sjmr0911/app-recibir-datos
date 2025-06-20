import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  String _displayName = '';
  String _displayEmail = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _displayName = _nameController.text;
        _displayEmail = _emailController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Datos',
        style: TextStyle(color:  Color.fromARGB(255, 4, 4, 124),
        fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Correo electrónico'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu correo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitData,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 4, 4, 124),
                    foregroundColor: Colors.orange, 
                    
                  ),
                  child: Text('Enviar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Nombre ingresado: $_displayName',
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,   // para negrita
              color: Colors.orange,
              ),
            ),
            Text(
              'Correo ingresado: $_displayEmail',
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,   // para negrita
              color: Color.fromARGB(255, 4, 4, 124),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
