import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_learn/src/feature/material_3_demo/componnent_screen.dart';

import 'color_palettes_screen.dart';
import 'elevation_screen.dart';
import 'topography_screen.dart';

class Material3Demo extends StatefulWidget {
  const Material3Demo({super.key});

  @override
  State<Material3Demo> createState() => _Material3DemoState();
}

const double narrowScreenWidthThreshold = 450;
const m3BaseColor = Color(0xff6750a4);
const List<Color> colorOptions = [
  m3BaseColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];
const List<String> colorText = <String>[
  "M3 Baseline",
  "Blue",
  "Teal",
  "Green",
  "Yellow",
  "Orange",
  "Pink",
];

class _Material3DemoState extends State<Material3Demo> {
  bool useMaterial3 = true;
  bool useLightMode = true;
  int colorSelected = 0;
  int screenIndex = 0;
  late ThemeData themeData;

  @override
  void initState() {
    themeData = updateTheme(colorSelected, useMaterial3, useLightMode);
    super.initState();
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = value;
    });
    updateTheme(colorSelected, useMaterial3, useLightMode);
  }

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
      themeData = updateTheme(colorSelected, useMaterial3, useLightMode);
    });
  }

  ThemeData updateTheme(int colorIndex, bool userMaterial3, bool useLightMode) {
    return ThemeData(
      useMaterial3: useMaterial3,
      colorSchemeSeed: colorOptions[colorIndex],
      brightness: useLightMode ? Brightness.light : Brightness.dark,
    );
  }

  void handleBrightnessChange() {
    setState(() {
      useLightMode = !useLightMode;
      themeData = updateTheme(colorSelected, useMaterial3, useLightMode);
    });
  }

  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: useMaterial3 ? const Text('Material 3') : const Text("Material 2"),
      centerTitle: true,
      actions: [
        IconButton(
          tooltip: "taggle brightness ",
          onPressed: handleBrightnessChange,
          icon: Icon(useLightMode ? Icons.wb_sunny_outlined : Icons.wb_sunny),
        ),
        IconButton(
          tooltip: "Switch to material ${useMaterial3 ? 2 : 3}",
          onPressed: handleMaterialVersionChange,
          icon: Icon(useMaterial3 ? Icons.filter_3 : Icons.filter_2),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          itemBuilder: (context) {
            return List.generate(colorOptions.length, (index) {
              return PopupMenuItem(
                value: index,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        index == colorSelected
                            ? Icons.color_lens
                            : Icons.color_lens_outlined,
                        color: colorOptions[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(colorText[index]),
                    ),
                  ],
                ),
              );
            });
          },
          onSelected: handleColorSelect,
        ),
      ],
    );
  }

  Widget createScreenFor(int screenIndex, bool showNavBarExample) {
    switch (screenIndex) {
      case 0:
        return ComponentScreen(showNavBottomBar: showNavBarExample);
      case 1:
        return const ColorPalettesScreen();
      case 2:
        return const TypographyScreen();
      case 3:
        return const ElevationScreen();
      default:
        return ComponentScreen(showNavBottomBar: showNavBarExample);
    }
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material3",
      themeMode: useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: themeData,
      home: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(
            appBar: createAppBar(),
            body: Row(children: <Widget>[
              createScreenFor(screenIndex, false),
            ]),
            bottomNavigationBar: NavigationBars(
              onSelectItem: handleScreenChanged,
              selectedIndex: screenIndex,
              isExampleBar: false,
            ),
          );
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: NavigationRailSection(
                          onSelectItem: handleScreenChanged,
                          selectedIndex: screenIndex)),
                  const VerticalDivider(thickness: 1, width: 1),
                  createScreenFor(screenIndex, true),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
