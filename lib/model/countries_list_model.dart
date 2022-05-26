class CountriesModel {
  CountriesModel({
    required this.data,
  });
  late final List<CountryData> data;

  CountriesModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>CountryData.fromJson(e)).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['data'] = data.map((e)=>e.toJson()).toList();
  //   return _data;
  // }
}

class CountryData {
  CountryData({
    required this.id,
    required this.iso,
    required this.name,
    required this.nicename,
    this.iso3,
    this.numcode,
    required this.phonecode,
  });
  late final String id;
  late final String iso;
  late final String name;
  late final String nicename;
  late final String? iso3;
  late final String? numcode;
  late final String phonecode;

  CountryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    iso = json['iso'];
    name = json['name'];
    nicename = json['nicename'];
    iso3 = json['iso3'] == null ? "" : json['iso3'];
    numcode = json['numcode'] == null ? "" : json['numcode'];
    phonecode = json['phonecode'];
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['iso'] = iso;
  //   _data['name'] = name;
  //   _data['nicename'] = nicename;
  //   _data['iso3'] = iso3;
  //   _data['numcode'] = numcode;
  //   _data['phonecode'] = phonecode;
  //   return _data;
  // }
}