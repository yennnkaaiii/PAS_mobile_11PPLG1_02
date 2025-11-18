class HomeModel {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final double rating;

  HomeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] ?? 'Tidak ada kategori',
      title: json['strTitle'] ?? 'Tidak ada kategori',
      price: json['strPrice'] ?? '',
      description: json['strDescription'] ?? 'Tidak ada kategori',
      category: json['strCategory'] ?? 'Tidak ada deskripsi',
      image: json['strImage'] ?? '',
      rating: (json['strRating'])
          ? double.tryParse(json['strRating'].toString()) ?? 0.0
          : 0.0,
    );
  }
}
