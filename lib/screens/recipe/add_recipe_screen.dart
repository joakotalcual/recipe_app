// Importación del paquete dart:math para generar números aleatorios
import 'dart:io';
import 'dart:math';

// Importaciones necesarias de Flutter y otros archivos
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screens/recipe/input_text.dart';
import 'package:recipe/services/firebase_service.dart'; // Importación del servicio Firebase
import 'package:recipe/services/select_image.dart';
import 'package:recipe/services/upload_image.dart';
import 'package:recipe/size_config.dart'; // Importación de la configuración de tamaño

// Clase StatefulWidget para la pantalla de agregar receta
class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  // Método para crear el estado correspondiente
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

// Clase de estado para la pantalla de agregar receta
class _AddRecipeState extends State<AddRecipe> {

  File? imagenToUpload;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();//Constrolador del form
  // Controladores para los campos de entrada de texto
  String _title = '', _description = '', _numberCooks = '', _numberRecipes = '';
  final _colorNotifier = ValueNotifier(Colors.green);
  double defaultSize = SizeConfig.defaultSize;

  // Método de construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();// Ocultar el teclado cuando se toca fuera de los campos de texto
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ADD RECIPE"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: defaultSize * 0.2, horizontal: defaultSize * 1.5),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Clase para crear campos de texto
                      InputText(
                        keyboardType: TextInputType.name,
                        label: "Enter the title",
                        maxLength: 29,
                        onChanged: (text) {
                          _title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter a title';
                          }else if(text.length <= 3){
                            return 'Please enter a title more a three characters';
                          }
                        return null;
                        }
                      ),
                      InputText(
                        keyboardType: TextInputType.name,
                        label: "Enter description",
                        maxLength: 45,
                        onChanged: (text) {
                          _description = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter a description';
                          }else if(text.length <= 10){
                            return 'Please enter a description more a ten characters';
                          }
                          return null;
                        },
                      ),
                      InputText(
                        keyboardType: TextInputType.number,
                        label: "Enter the number of cooks",
                        onChanged: (text) {
                          _numberCooks = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter the number of cooks';
                          }else if(!RegExp(r'^[0-9]+$').hasMatch(text)){
                            return 'Please enter only numbers of cooks';
                          }
                          return null;
                        },
                      ),
                      InputText(
                        keyboardType: TextInputType.number,
                        label: "Enter the number of recipes",
                        onChanged: (text) {
                          _numberRecipes = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter the number of recipes';
                          }else if(!RegExp(r'^[0-9]+$').hasMatch(text)){
                            return 'Please enter only numbers of recipes';
                          }
                          return null;
                        },
                      ),
                      imagenToUpload != null ? Image.file(imagenToUpload!) : Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 50,
                        color: Colors.red,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final imagen = await getImage();
                          setState(() {
                            imagenToUpload = File(imagen!.path);
                          });
                        },
                        child: const Text("Seleccionar imagen"),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 9,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                        const Text(
                          "Background Recipe",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        ValueListenableBuilder<Color>(
                          valueListenable: _colorNotifier,
                          builder: (_, color, __){
                            return ColorPicker(
                              pickersEnabled: const <ColorPickerType, bool>{
                                ColorPickerType.both: false,
                                ColorPickerType.primary: true,
                                ColorPickerType.accent: false,
                                ColorPickerType.bw: false,
                                ColorPickerType.custom: false,
                                ColorPickerType.wheel: false,
                              },
                              color: color,
                              onColorChanged: (value) {
                              // Convertir el color seleccionado a MaterialColor
                              final materialColor = MaterialColor(value.value, <int, Color>{
                                50: value.withOpacity(0.1),
                                100: value.withOpacity(0.2),
                                200: value.withOpacity(0.3),
                                300: value.withOpacity(0.4),
                                400: value.withOpacity(0.5),
                                500: value.withOpacity(0.6),
                                600: value.withOpacity(0.7),
                                700: value.withOpacity(0.8),
                                800: value.withOpacity(0.9),
                                900: value.withOpacity(1.0),
                              });
                              // Asignar el nuevo color al notifier
                              _colorNotifier.value = materialColor;
                              },
                            );
                          }
                        ),
                      ]),
                    ),
                  ),
                ),
                // Botón para guardar la receta
                ElevatedButton(
                  onPressed: () async {
                    _submit();
                  },
                  child: const Text("Save")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async{
    if (_formKey.currentState!.validate()) {
      final colorHex = _colorNotifier.value.value.toRadixString(16); // Obtener el color directo en formato hexadecimal
      // Si todos los campos están completos, proceder con el guardado
      if(imagenToUpload == null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a new image"))
        );
        return;
      }

      final uploaded = await uploadImage(imagenToUpload!);

      if(!uploaded){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error uploading image"))
        );
        return;
      }

      String url = await getURL(imagenToUpload!);

      await addRecipe(
              _title, //Titulo de la receta
              _description,//Descripción de la receta
              int.parse(_numberCooks), //Parsea el numero de cocineros
              int.parse(_numberRecipes),//Parsea el numero de recetas
              url, //Ruta de la imagen del firestore
              "0x$colorHex" //Parsea el color a hexadecimal
              )
          .then((_) => Navigator.pop(context));
      }
    }

}
