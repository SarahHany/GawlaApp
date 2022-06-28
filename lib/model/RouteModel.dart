/// id : 0
/// objectId : 0
/// placeId : 0
/// roomId : 0
/// tourId : 0
/// previousCheckPoint : "string"
/// tour : {"id":0,"tour_creator":{"id":0,"first_name":"string","last_name":"string","birth":"string","gender":"string","email":"string","phone":"string","password":"string","address":"string","photo":"string","job":"string"},"name":"string","location":"string","distance":0,"departure_date":"2022-05-12T22:04:09.844Z","arrival_date":"2022-05-12T22:04:09.844Z","cover_photo":"string","max_participants":0,"cost":0,"visitors_joined":0,"creation_date":"2022-05-12T22:04:09.844Z","category":"string","description":"string"}

class RouteModel {
  RouteModel({
      int? id, 
      int? objectId, 
      int? placeId, 
      int? roomId, 
      int? tourId, 
      String? previousCheckPoint, 
      Tour? tour,}){
    _id = id;
    _objectId = objectId;
    _placeId = placeId;
    _roomId = roomId;
    _tourId = tourId;
    _previousCheckPoint = previousCheckPoint;
    _tour = tour;
}

  RouteModel.fromJson(dynamic json) {
    _id = json['id'];
    _objectId = json['objectId'];
    _placeId = json['placeId'];
    _roomId = json['roomId'];
    _tourId = json['tourId'];
    _previousCheckPoint = json['previousCheckPoint'];
    _tour = json['tour'] != null ? Tour.fromJson(json['tour']) : null;
  }
  int? _id;
  int? _objectId;
  int? _placeId;
  int? _roomId;
  int? _tourId;
  String? _previousCheckPoint;
  Tour? _tour;
RouteModel copyWith({  int? id,
  int? objectId,
  int? placeId,
  int? roomId,
  int? tourId,
  String? previousCheckPoint,
  Tour? tour,
}) => RouteModel(  id: id ?? _id,
  objectId: objectId ?? _objectId,
  placeId: placeId ?? _placeId,
  roomId: roomId ?? _roomId,
  tourId: tourId ?? _tourId,
  previousCheckPoint: previousCheckPoint ?? _previousCheckPoint,
  tour: tour ?? _tour,
);
  int? get id => _id;
  int? get objectId => _objectId;
  int? get placeId => _placeId;
  int? get roomId => _roomId;
  int? get tourId => _tourId;
  String? get previousCheckPoint => _previousCheckPoint;
  Tour? get tour => _tour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['objectId'] = _objectId;
    map['placeId'] = _placeId;
    map['roomId'] = _roomId;
    map['tourId'] = _tourId;
    map['previousCheckPoint'] = _previousCheckPoint;
    if (_tour != null) {
      map['tour'] = _tour?.toJson();
    }
    return map;
  }

}

/// id : 0
/// tour_creator : {"id":0,"first_name":"string","last_name":"string","birth":"string","gender":"string","email":"string","phone":"string","password":"string","address":"string","photo":"string","job":"string"}
/// name : "string"
/// location : "string"
/// distance : 0
/// departure_date : "2022-05-12T22:04:09.844Z"
/// arrival_date : "2022-05-12T22:04:09.844Z"
/// cover_photo : "string"
/// max_participants : 0
/// cost : 0
/// visitors_joined : 0
/// creation_date : "2022-05-12T22:04:09.844Z"
/// category : "string"
/// description : "string"

class Tour {
  Tour({
      int? id, 
      TourCreator? tourCreator, 
      String? name, 
      String? location, 
      int? distance, 
      String? departureDate, 
      String? arrivalDate, 
      String? coverPhoto, 
      int? maxParticipants, 
      int? cost, 
      int? visitorsJoined, 
      String? creationDate, 
      String? category, 
      String? description,}){
    _id = id;
    _tourCreator = tourCreator;
    _name = name;
    _location = location;
    _distance = distance;
    _departureDate = departureDate;
    _arrivalDate = arrivalDate;
    _coverPhoto = coverPhoto;
    _maxParticipants = maxParticipants;
    _cost = cost;
    _visitorsJoined = visitorsJoined;
    _creationDate = creationDate;
    _category = category;
    _description = description;
}

  Tour.fromJson(dynamic json) {
    _id = json['id'];
    _tourCreator = json['tour_creator'] != null ? TourCreator.fromJson(json['tour_creator']) : null;
    _name = json['name'];
    _location = json['location'];
    _distance = json['distance'];
    _departureDate = json['departure_date'];
    _arrivalDate = json['arrival_date'];
    _coverPhoto = json['cover_photo'];
    _maxParticipants = json['max_participants'];
    _cost = json['cost'];
    _visitorsJoined = json['visitors_joined'];
    _creationDate = json['creation_date'];
    _category = json['category'];
    _description = json['description'];
  }
  int? _id;
  TourCreator? _tourCreator;
  String? _name;
  String? _location;
  int? _distance;
  String? _departureDate;
  String? _arrivalDate;
  String? _coverPhoto;
  int? _maxParticipants;
  int? _cost;
  int? _visitorsJoined;
  String? _creationDate;
  String? _category;
  String? _description;
Tour copyWith({  int? id,
  TourCreator? tourCreator,
  String? name,
  String? location,
  int? distance,
  String? departureDate,
  String? arrivalDate,
  String? coverPhoto,
  int? maxParticipants,
  int? cost,
  int? visitorsJoined,
  String? creationDate,
  String? category,
  String? description,
}) => Tour(  id: id ?? _id,
  tourCreator: tourCreator ?? _tourCreator,
  name: name ?? _name,
  location: location ?? _location,
  distance: distance ?? _distance,
  departureDate: departureDate ?? _departureDate,
  arrivalDate: arrivalDate ?? _arrivalDate,
  coverPhoto: coverPhoto ?? _coverPhoto,
  maxParticipants: maxParticipants ?? _maxParticipants,
  cost: cost ?? _cost,
  visitorsJoined: visitorsJoined ?? _visitorsJoined,
  creationDate: creationDate ?? _creationDate,
  category: category ?? _category,
  description: description ?? _description,
);
  int? get id => _id;
  TourCreator? get tourCreator => _tourCreator;
  String? get name => _name;
  String? get location => _location;
  int? get distance => _distance;
  String? get departureDate => _departureDate;
  String? get arrivalDate => _arrivalDate;
  String? get coverPhoto => _coverPhoto;
  int? get maxParticipants => _maxParticipants;
  int? get cost => _cost;
  int? get visitorsJoined => _visitorsJoined;
  String? get creationDate => _creationDate;
  String? get category => _category;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_tourCreator != null) {
      map['tour_creator'] = _tourCreator?.toJson();
    }
    map['name'] = _name;
    map['location'] = _location;
    map['distance'] = _distance;
    map['departure_date'] = _departureDate;
    map['arrival_date'] = _arrivalDate;
    map['cover_photo'] = _coverPhoto;
    map['max_participants'] = _maxParticipants;
    map['cost'] = _cost;
    map['visitors_joined'] = _visitorsJoined;
    map['creation_date'] = _creationDate;
    map['category'] = _category;
    map['description'] = _description;
    return map;
  }

}

/// id : 0
/// first_name : "string"
/// last_name : "string"
/// birth : "string"
/// gender : "string"
/// email : "string"
/// phone : "string"
/// password : "string"
/// address : "string"
/// photo : "string"
/// job : "string"

class TourCreator {
  TourCreator({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? birth, 
      String? gender, 
      String? email, 
      String? phone, 
      String? password, 
      String? address, 
      String? photo, 
      String? job,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _birth = birth;
    _gender = gender;
    _email = email;
    _phone = phone;
    _password = password;
    _address = address;
    _photo = photo;
    _job = job;
}

  TourCreator.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _birth = json['birth'];
    _gender = json['gender'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _address = json['address'];
    _photo = json['photo'];
    _job = json['job'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _birth;
  String? _gender;
  String? _email;
  String? _phone;
  String? _password;
  String? _address;
  String? _photo;
  String? _job;
TourCreator copyWith({  int? id,
  String? firstName,
  String? lastName,
  String? birth,
  String? gender,
  String? email,
  String? phone,
  String? password,
  String? address,
  String? photo,
  String? job,
}) => TourCreator(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  birth: birth ?? _birth,
  gender: gender ?? _gender,
  email: email ?? _email,
  phone: phone ?? _phone,
  password: password ?? _password,
  address: address ?? _address,
  photo: photo ?? _photo,
  job: job ?? _job,
);
  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get birth => _birth;
  String? get gender => _gender;
  String? get email => _email;
  String? get phone => _phone;
  String? get password => _password;
  String? get address => _address;
  String? get photo => _photo;
  String? get job => _job;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['birth'] = _birth;
    map['gender'] = _gender;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    map['address'] = _address;
    map['photo'] = _photo;
    map['job'] = _job;
    return map;
  }

}