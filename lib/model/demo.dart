import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/shared/helper/mangers/constants.dart';

class demo {



  //  Map<String , dynamic > map ={
  //       "id": 1,
  //       "tour_creator": {
  //           "id": 251,
  //           "first_name": "Hamza",
  //           "last_name": "Mahmoud",
  //           "birth": "1973-04-29",
  //           "gender": "M",
  //           "email": "brandi.keeling@example.net",
  //           "phone": "001.415.4940x5472",
  //           "password": "4436f022d353532bd48d6d6f2447a17a3c596fd7",
  //           "address": "United States of America",
  //           "photo": "http://dummyimage.com/496x340.png/dddddd/000000",
  //           "job": "Kalinda"
  //       },
  //       "name": "Ungca",
  //       "location": "82 Derek Terrace",
  //       "distance": 1902,
  //       "departure_date": "2022-03-30 03:02:58",
  //       "arrival_date": "2022-12-28 21:35:46",
  //       "cover_photo": "http://dummyimage.com/635x662.png/cc0000/ffffff",
  //       "max_participants": 2286,
  //       "cost": 3016,
  //       "visitors_joined": 2290,
  //       "creation_date": "2022-07-13T00:00:00.000+00:00",
  //       "category": "Action",
  //       "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor."
  //   };


  List<TourModel> list = [
    TourModel(
        1,
        TourCreator(
            1251,
            "Mohamed",
            "Ahmed",
            "23/7/2000",
            "Male",
            "email@yahoo.com",
            "12345678901",
            'password',
            "Giza / Egypt",
            "user",
            "Tour Guide"),
        "Giza Pyramids Tour",
        "Egypt",
        5,
        "24/6/2022",
        "24/6/2022",
        "${ConstantsManger.PYRAMIDES}",
        10,
        124,
        2000,
        "14/6/2022",
        "History",
        "description"),
    TourModel(
        2,
        TourCreator(
            1251,
            "Mohamed",
            "Ahmed",
            "23/7/2000",
            "Male",
            "email@yahoo.com",
            "12345678901",
            'password',
            "Giza / Egypt",
            "user",
            "Tour Guide"),
        "Siwa Oasis Tour",
        "Egypt",
        5,
        "24/6/2022",
        "24/6/2022",
        "${ConstantsManger.SIWA}",
        10,
        124,
        2000,
        "14/6/2022",
        "History",
        "description"),
    TourModel(
        3,
        TourCreator(
            1251,
            "Mohamed",
            "Ahmed",
            "23/7/2000",
            "Male",
            "email@yahoo.com",
            "12345678901",
            'password',
            "Giza / Egypt",
            "user",
            "Tour Guide"),
        "River Nile",
        "Egypt",
        5,
        "24/6/2022",
        "24/6/2022",
        "${ConstantsManger.NILE}",
        10,
        124,
        2000,
        "14/6/2022",
        "History",
        "description"),
    TourModel(
        4,
        TourCreator(
            1251,
            "Mohamed",
            "Ahmed",
            "23/7/2000",
            "Male",
            "email@yahoo.com",
            "12345678901",
            'password',
            "Giza / Egypt",
            "user",
            "Tour Guide"),
        "Opera",
        "Egypt",
        5,
        "24/6/2022",
        "24/6/2022",
        "${ConstantsManger.OPERA}",
        10,
        124,
        2000,
        "14/6/2022",
        "History",
        "description"),
    TourModel(
        5,
        TourCreator(
            1251,
            "Mohamed",
            "Ahmed",
            "23/7/2000",
            "Male",
            "email@yahoo.com",
            "12345678901",
            'password',
            "Giza / Egypt",
            "user",
            "Tour Guide"),
        "Khan ElKhalili",
        "Egypt",
        5,
        "24/6/2022",
        "24/6/2022",
        "${ConstantsManger.KHAN}",
        10,
        124,
        2000,
        "14/6/2022",
        "History",
        "description"),
  ];
}
