class Animal {
  final int id;
  final String name;
  final int price;
  final String iconUri;

  Animal({this.id, this.name, this.price, this.iconUri});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
        id: json['id'],
        name: json['name']['name-EUde'],
        price: json['price'],
        iconUri: json['icon_uri']);
  }
}
