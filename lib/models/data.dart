class DataApi {
  String image;
  String title;
  String titlejapan;
  String episodes;
  String sinopsis;
  String? urlyoutube;

  DataApi({
    required this.image,
    required this.title,
    required this.titlejapan,
    required this.episodes,
    required this.sinopsis,
    required this.urlyoutube,
  });

  factory DataApi.fromJson(Map<String, dynamic> json) {
    return DataApi(
      image: json['image_url'],
      title: json['title'],
      titlejapan: json['title_japanese'],
      episodes: json['episodes'],
      sinopsis: json['synopsis'],
      urlyoutube: json['url'],
    );
    /*name: json["name"],
      state: json["status"],
      gender: json["species"]*/

    //List? get results => null;
  }
}
