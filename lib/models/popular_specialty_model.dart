class Specialty {
  late List<SpecialtyModel> _specialties;
  List<SpecialtyModel> get specialties => _specialties;

  Specialty({required specialties}) {
    this._specialties = specialties;
  }

  Specialty.fromJson(Map<String, dynamic> json) {
    if (json['Specialties'] != null) {
      _specialties = <SpecialtyModel>[];
      json['Specialties'].forEach((v) {
        _specialties.add(SpecialtyModel.fromJson(v));
      });
    }
  }
}

class SpecialtyModel {
  int? id;
  String? name;
  String? introduction;
  int? price;
  String? createAt;
  String? turnaroundTime;
  String? img;
  String? type;
  String? time;
  List<double>? location;
  String? provider;
  String? material;

  SpecialtyModel(
      {this.id,
      this.name,
      this.introduction,
      this.price,
      this.createAt,
      this.turnaroundTime,
      this.type,
      this.time,
      this.img,
      this.location,
      this.material,
      this.provider});

  SpecialtyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    introduction = json['introduction'];
    price = json['price'];
    createAt = json['createAt'];
    turnaroundTime = json['turnaroundTime'];
    type = json['type'];
    time = json['time'];
    img = json['img'];
    material = json['material'];
    location = json['location']?.cast<double>();
    provider = json['provider'];
  }

  Map<String, dynamic>? toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'introduction': this.introduction,
      'img': this.img,
      'type': this.type,
      'time': this.time,
      'material': this.material,
      'location': this.location,
      'createdAt': this.createAt,
      'turnaroundTime': this.turnaroundTime,
      'provider': this.provider,
    };
  }
}
