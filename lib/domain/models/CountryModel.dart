// ignore_for_file: file_names

class CountryModel {
  final String name;
  final String phoneCode;
  final String flag;

  CountryModel({
    required this.name,
    required this.phoneCode,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    String name = json['name']['common'];
    if (name == 'Antarctica' || name == 'Heard Island and McDonald Islands') {
      return CountryModel.defaultCountry();
    } else {
      return CountryModel(
        name: name,
        phoneCode: json['idd']['root'] + json['idd']['suffixes'][0],
        flag: json['flags']['png'],
      );
    }
  }

  // Фабричный метод для создания объекта CountryModel с значениями по умолчанию
  factory CountryModel.defaultCountry() {
    return CountryModel(
      name: 'null',
      phoneCode: 'phoneCode',
      flag: 'flag',
    );
  }
}
