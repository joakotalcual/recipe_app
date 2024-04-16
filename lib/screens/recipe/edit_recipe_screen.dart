
import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/recipe_bundel.dart';
import 'package:recipe/screens/recipe/input_text.dart';
import 'package:recipe/services/firebase_service.dart';
import 'package:recipe/services/select_image.dart';
import 'package:recipe/services/upload_image.dart';
import 'package:recipe/size_config.dart';

class EditRecipe extends StatefulWidget {
  const EditRecipe({super.key});

  @override
  State<EditRecipe> createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  late RecipeBundle arguments;
  File? imagenToUpload;
  late ValueNotifier<Color> _colorNotifier;
  late File? nameImagen;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Accede a los argumentos aquí
    arguments = ModalRoute.of(context)!.settings.arguments as RecipeBundle;
    imagenToUpload = File(arguments.imageSrc);
    _colorNotifier = ValueNotifier(arguments.color);
    nameImagen = imagenToUpload;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();//Constrolador del form
  // Controladores para los campos de entrada de texto
  String _title = '', _description = '', _numberCooks = '', _numberRecipes = '';
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
          title: const Text("EDIT RECIPE"),
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
                      const Center(
                        child: Text(
                          "Press if you want to edit it",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // Clase para crear campos de texto
                      InputText(
                        keyboardType: TextInputType.name,
                        label: "\"${arguments.title}\"",
                        maxLength: 29,
                        onChanged: (text) {
                          _title = text;
                        },
                        validator: (text) {
                          if(text!.length <= 3 && text.isNotEmpty){
                            return 'Please enter a title more a three characters';
                          }
                        return null;
                        }
                      ),
                      InputText(
                        keyboardType: TextInputType.name,
                        label: "\"${arguments.description}\"",
                        maxLength: 45,
                        onChanged: (text) {
                          _description = text;
                        },
                        validator: (text) {
                          if(text!.length <= 10 && text.isNotEmpty){
                            return 'Please enter a description more a ten characters';
                          }
                          return null;
                        },
                      ),
                      InputText(
                        keyboardType: TextInputType.number,
                        label: "\"${arguments.chefs}\"",
                        onChanged: (text) {
                          _numberCooks = text;
                        },
                        validator: (text) {
                          if(!RegExp(r'^[0-9]+$').hasMatch(text!) && text.isNotEmpty){
                            return 'Please enter only numbers of cooks';
                          }
                          return null;
                        },
                      ),
                      InputText(
                        keyboardType: TextInputType.number,
                        label: "\"${arguments.recipes}\"",
                        onChanged: (text) {
                          _numberRecipes = text;
                        },
                        validator: (text) {
                          if(!RegExp(r'^[0-9]+$').hasMatch(text!) && text.isNotEmpty){
                            return 'Please enter only numbers of recipes';
                          }
                          return null;
                        },
                      ),
                      imagenToUpload != null && imagenToUpload!.existsSync()
                        ? Image.file(imagenToUpload!)
                        : (imagenToUpload != null && imagenToUpload!.path.contains("firebase"))
                            ? Image.network(imagenToUpload!.path)
                            : Container(
                                margin: const EdgeInsets.all(10),
                                height: 150,
                                width: 50,
                                color: Colors.red,
                              ),
                      ElevatedButton(
                        onPressed: () async {
                          final imagen = await getImage();
                          if(imagen == null){
                            return;
                          }
                          print(imagen.path);
                          print(imagenToUpload);
                          setState((){
                            imagenToUpload = File(imagen.path);
                          });
                          print(imagenToUpload);
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
                  child: const Text("Update")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final colorHex = _colorNotifier.value.value
          .toRadixString(16); // Obtener el color directo en formato hexadecimal
      // Si todos los campos están completos, proceder con el guardado
      if (imagenToUpload == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please select a new image")));
        return;
      }
      String url;
      //Si es diferente el nombre de la imagen con el que subio subir imagen
      if (_title.isNotEmpty ||
          _description.isNotEmpty ||
          _numberCooks.isNotEmpty ||
          _numberRecipes.isNotEmpty) {
        if(imagenToUpload!.path.contains('https://firebasestorage.googleapis.com/v0/')){
          url = imagenToUpload!.path;
        }else{
          final uploaded = await uploadImage(imagenToUpload!);
          if (!uploaded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Error uploading image")));
            return;
          }
          url = await getURL(imagenToUpload!);
        }
        // Inicializar los campos con los valores actuales
        String title = arguments.title; // Título actual de la receta
        String description =
            arguments.description; // Descripción actual de la receta
        int chefs = arguments.chefs; // Número actual de cocineros
        int recipes = arguments.recipes; // Número actual de recetas

        // Actualizar solo si los campos no están vacíos y son diferentes de los actuales
        if (_title.isNotEmpty && _title != arguments.title) {
          // Verifica si el título ingresado no está vacío y es diferente al actual
          title = _title; // Actualiza el título con el nuevo valor
        }
        if (_description.isNotEmpty && _description != arguments.description) {
          // Verifica si la descripción ingresada no está vacía y es diferente a la actual
          description =
              _description; // Actualiza la descripción con el nuevo valor
        }
        if (_numberCooks.isNotEmpty &&
            int.parse(_numberCooks) != arguments.chefs) {
          // Verifica si el número de cocineros ingresado no está vacío y es diferente al actual
          chefs = int.parse(
              _numberCooks); // Actualiza el número de cocineros con el nuevo valor
        }
        if (_numberRecipes.isNotEmpty &&
            int.parse(_numberRecipes) != arguments.recipes) {
          // Verifica si el número de recetas ingresado no está vacío y es diferente al actual
          recipes = int.parse(
              _numberRecipes); // Actualiza el número de recetas con el nuevo valor
        }
        // Realizar la actualización de la receta
        await updateRecipe(
                arguments.uid, // UID de la receta a actualizar
                title, // Nuevo título de la receta
                description, // Nueva descripción de la receta
                chefs, // Nuevo número de cocineros
                recipes, // Nuevo número de recetas
                url, // Ruta de la imagen del firestore
                "0x$colorHex" // Parsea el color a hexadecimal
                )
            .then((_) => Navigator.pop(
                context)); // Navega hacia atrás después de la actualización
      } else {
      Navigator.pop(context);
      }
    }
  }
}
