import 'package:use_case_todo/generic_filter/filter_view.dart';

enum ColorEnums {
  red('Red'),
  white('White'),
  blue('Blue'),
  black('Black');

  final colorName;
  const ColorEnums(this.colorName);

  static List<ColorModel> get models =>
      ColorEnums.values.map(ColorModel.new).toList();
}

class ColorModel extends IFilter {
  ColorModel(this.color);

  final ColorEnums color;

  @override
  // TODO: implement id
  int get id => color.index;

  @override
  // TODO: implement key
  String get key => color.name;
}
