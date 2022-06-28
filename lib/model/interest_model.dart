class InterestModel {
  final int id;
  final String title;
  final String image;

  InterestModel({required this.id ,required this.title,required this.image});

  static List<InterestModel> interestList = [
    InterestModel(id: 1, title: 'Fashion', image: 'assets/images/fashion.png'),
    InterestModel(id: 2, title: 'Animal', image: 'assets/images/animal.png'),
    InterestModel(id: 3, title: 'Food', image: 'assets/images/food.png'),
    InterestModel(id: 4, title: 'Nature', image: 'assets/images/nature.png'),
    InterestModel(id: 5, title: 'Religion', image: 'assets/images/nature.png'),
    InterestModel(id: 6, title: 'Sports', image: 'assets/images/sports.png'),
    InterestModel(id: 7, title: 'Afterlife', image: 'assets/images/afterflie.png'),
    InterestModel(id: 8, title: 'Magic', image: 'assets/images/magic.png'),
  ];
}
