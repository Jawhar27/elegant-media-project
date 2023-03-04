class Hotel {
  String? id;
  String? title;
  String? description;
  String? address;
  String? postcode;
  String? phoneNumber;
  String? longitude;
  String? latitude;
  String? smallImage;
  String? mediumImage;
  String? largeImage;

  Hotel(
      {this.id,
      this.address,
      this.description,
      this.title,
      this.postcode,
      this.largeImage,
      this.latitude,
      this.longitude,
      this.mediumImage,
      this.phoneNumber,
      this.smallImage});

  factory Hotel.fromJson(Map<String, dynamic> parsedJson) {
    return Hotel(
      id: parsedJson["id"].toString(),
      title: parsedJson["title"],
      description: parsedJson["description"],
      address: parsedJson['address'],
      postcode: parsedJson['postcode'],
      phoneNumber: parsedJson['phoneNumber'],
      longitude: parsedJson['longitude'],
      latitude: parsedJson['latitude'],
      smallImage: parsedJson['image']['small'],
      largeImage: parsedJson['image']['medium'],
      mediumImage: parsedJson['image']['large'],
    );
  }
}
