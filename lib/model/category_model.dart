// class Category {
//   final String title;
//   final String description;
//   final String colorName;

//   Category({
//     required this.title,
//     required this.description,
//     required this.colorName,
//   });
// }
class Category {
  final int? id; // id can be null for new categories
  final String title;
  final String description;
  final String colorName;

  Category({
    this.id,
    required this.title,
    required this.description,
    required this.colorName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'colorName': colorName,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      colorName: map['colorName'],
    );
  }
}
