class Category {
  int id;
  String title;
  String imagePath;
 
 
 Category({required this.id,required this.title,required this.imagePath});

static List<Category> getCategories(){
  return[
    Category(id: 28, title: 'Action', imagePath: 'assets/images/Action.jpeg'),
    Category(id: 18, title: 'Drama', imagePath: 'assets/images/drama.jpeg'),
    Category(id: 27, title: 'Horror', imagePath: 'assets/images/horror.jpeg'),
    Category(id: 53, title: 'Thriller', imagePath: 'assets/images/Thriller.jpeg'),
    Category(id: 14, title: 'Fantasy', imagePath: 'assets/images/comedy.jpeg'),
    Category(id: 16, title: 'Animation', imagePath: 'assets/images/comedy.jpeg'),
    Category(id: 10749, title: 'Romance', imagePath: 'assets/images/romantic.jpeg'),
    Category(id: 35, title: 'Comedy', imagePath: 'assets/images/comedy.jpeg'),
  ];
}
}