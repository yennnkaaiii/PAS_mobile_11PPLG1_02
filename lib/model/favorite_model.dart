class FavoriteModel {
  final int? id;
  final String strTitle;
  final String strPrice;
  final String strDescription;
  final String strCategory;
  final String strImage;
  final double strRating;
  final bool isCompleted;

  FavoriteModel({
    this.id,
    required this.strTitle,
    required this.strPrice,
    required this.strDescription,
    required this.strCategory,
    required this.strImage,
    required this.strRating,
    required this.isCompleted,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      strTitle: map['strTitle'],
      strPrice: map['strPrice'],
      strDescription: map['Description'],
      strCategory: map['strCategory'],
      strImage: map['strImage'],
      strRating: map['strRating'],
      isCompleted: map['isCompleted'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'strTitle': strTitle,
      'strPrice': strPrice,
      'strDescription': strDescription,
      'strCategory': strCategory,
      'strImage': strImage,
      'strRating': strRating,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
