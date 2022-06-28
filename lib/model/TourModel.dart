
class TourModel {





  int ? id;
  TourCreator ? tourCreator;
  String? name;
  String? location;
  int? distance;
  String? departureDate;
  String? arrivalDate;
  String? coverPhoto;
  int? maxParticipants;
  int? cost;
  int? visitorsJoined;
  String? creationDate;
  String? category;
  String? description;


  TourModel(
      this.id,
      this.tourCreator,
      this.name,
      this.location,
      this.distance,
      this.departureDate,
      this.arrivalDate,
      this.coverPhoto,
      this.maxParticipants,
      this.cost,
      this.visitorsJoined,
      this.creationDate,
      this.category,
      this.description);

  TourModel.fromJson(dynamic json){
    id = json['id'];
    tourCreator = json['tour_creator'] != null
        ? TourCreator.fromJson(json['tour_creator'])
        : null;
    name = json['name'];
    location = json['location'];
    distance = json['distance'];
    departureDate = json['departure_date'];
    arrivalDate = json['arrival_date'];
    coverPhoto = json['cover_photo'];
    maxParticipants = json['max_participants'];
    cost = json['cost'];
    visitorsJoined = json['visitors_joined'];
    creationDate = json['creation_date'];
    category = json['category'];
    description = json['description'];
  }

}
class TourCreator {



  TourCreator.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birth = json['birth'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    photo = json['photo'];
    job = json['job'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? birth;
  String? gender;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? photo;
  String? job;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['birth'] = birth;
    map['gender'] = gender;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['address'] = address;
    map['photo'] = photo;
    map['job'] = job;
    return map;
  }

  TourCreator(
      this.id,
      this.firstName,
      this.lastName,
      this.birth,
      this.gender,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.photo,
      this.job);
}


