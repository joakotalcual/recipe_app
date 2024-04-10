import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/nav_item.dart';
import 'package:recipe_app/size_config.dart';

// Barra de navegación inferior personalizada
class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key,});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize; // Tamaño por defecto
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3), // Espaciado horizontal
        decoration: BoxDecoration(
          color: Colors.white, // Color de fondo blanco
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -7), // Desplazamiento de la sombra
              blurRadius: 30, // Radio de desenfoque
              color: const Color(0xFF4B1A39).withOpacity(0.2), // Color de la sombra
            )
          ]
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alineación de los elementos
            children: List.generate(navItems.items.length, (index)
              => buildIconNavBarItem(
                isActive: navItems.selectedIndex == index ? true : false, // Verifica si el ícono está activo
                icon: navItems.items[index].icon,
                press: () {
                  navItems.changeNavIndex(index: index); // Cambia el índice de navegación
                  if(navItems.items[index].destinationChecker()){ // Verifica si hay un destino válido
                    Navigator.push(context, MaterialPageRoute(builder: (context) => navItems.items[index].destination),); // Navega a la pantalla de destino
                  }
                },
              ))
          ),
        ),
      ),
    );
  }

  // Método para construir un ícono de la barra de navegación
  IconButton buildIconNavBarItem({required String icon, required VoidCallback press, bool isActive = false}) {
    return IconButton(
        onPressed: press, // Función de callback
        icon: SvgPicture.asset(
          icon, // Icono SVG
        // ignore: deprecated_member_use
        color: isActive ? kPrimaryColor : const Color(0xFFD1D4D4), // Color del icono (activo o inactivo)
        height: 22, // Altura del icono
      ),
    );
  }
}
