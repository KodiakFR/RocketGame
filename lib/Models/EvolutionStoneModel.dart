class EvolutionStoneModel {
  //Attributes
  final String id;
  final String name;
  final String description;
  final int price;
  int qantity;
  final String type;
  final String url;
 

  //constructor
  EvolutionStoneModel(this.id, this.name, this.description, this.price,
      this.qantity, this.type, this.url);

  //Setter - Getter

    get getQantity => this.qantity;

    set setQantity(qantity) => this.qantity = qantity;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'qantity': qantity,
        'type': type,
        'url': url,
      };

      factory EvolutionStoneModel.fromJson(Map<String, dynamic> json) {
    return EvolutionStoneModel(
      json['id'],
      json['name'],
      json['description'],
      json['price'],
      json['qantity'],
      json['type'],
      json['url'],
    );
  }
}
