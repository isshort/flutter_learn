enum ColorEnums {
  red('Red'),
  white('White'),
  blue('Blue'),
  black('Black');

  final colorName;
  const ColorEnums(this.colorName);
}

class ColorModel {
  ColorModel(this.color);

  final ColorEnums color;
}
