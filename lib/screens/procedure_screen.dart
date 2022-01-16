import 'package:flutter/material.dart';

import 'package:vehicles_app/models/procedure.dart';
import 'package:vehicles_app/models/token.dart';

class ProcedureScreen extends StatefulWidget {
  final Token token;
  final Procedure procedure;

  ProcedureScreen({required this.token, required this.procedure});

  @override
  _ProcedureScreenState createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
  String _description = '';
  String _descriptionError = '';
  bool _descriptionShowError = false;

  TextEditingController _descriptionController = TextEditingController();

   String _price = '';
  String _priceError = '';
  bool _priceShowError = false;

  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {  
    super.initState();
    _description = widget.procedure.description;
    _descriptionController.text = _description;
    _price = widget.procedure.price.toString();
    _priceController.text = _price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.procedure.id == 0
            ? 'Nuevo Procedimiento'
            : widget.procedure.description),
      ),
      body: Column(
        children: <Widget>[
          _showDescription(),
          _showPrice(),
          _showButtons(),
        ],
      ),
    );
  }

  Widget _showDescription() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField( 
        autofocus: true,
        controller: _descriptionController,       
        decoration: InputDecoration(                   
          hintText: 'Ingresa una descripción...',
          labelText: 'Descrpción',
          errorText: _descriptionShowError ? _descriptionError : null,          
          suffixIcon: const Icon(Icons.description),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          _description = value;
        },
      ),
    );
  }

  Widget _showPrice() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField( 
        keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),
        controller: _priceController,       
        decoration: InputDecoration(                   
          hintText: 'Ingresa un precio...',
          labelText: 'Precio',
          errorText: _priceShowError ? _priceError : null,          
          suffixIcon: const Icon(Icons.attach_money),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          _price = value;
        },
      ),
    );
  }

  Widget _showButtons() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: const Text('Guardar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return const Color(0xFF120E43);
                }),
              ),
              onPressed: (){ },
            ),
          ),

          widget.procedure.id == 0
          ? Container()
          : const SizedBox(
            width: 20,
          ),
          
          widget.procedure.id == 0
          ? Container()
          : Expanded(
            child: ElevatedButton(
              child: const Text('Borrar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return const Color(0xFFB4161B);
                }),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
