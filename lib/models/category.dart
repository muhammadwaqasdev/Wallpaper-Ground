class CategorieModel {
  String? categorieName;
  String? imgUrl;
  CategorieModel({
    this.categorieName,
    this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'categorieName': categorieName,
      'imgUrl': imgUrl,
    };
  }

  factory CategorieModel.fromMap(Map<String, dynamic> map) {
    return CategorieModel(
      categorieName: map['categorieName'],
      imgUrl: map['imgUrl'],
    );
  }
}
