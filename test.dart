void main(List<String> args) {
  print(EnumData.checkData('Wahidi').name);
  print(EnumData.checkData('Nematullah').name);
}

enum EnumData {
  on,
  off;

  static EnumData checkData(String name) {
    if (name == 'Nematullah') {
      return EnumData.on;
    }
    return EnumData.off;
  }
}
