class TrapModel {
  final String id;
  final String name;
  String ? description;
  final int levelMin;
  final String scarcity;
  final int success;
  final int timer;
  int ? qantity;
  int price;
  String url;
  

  

  TrapModel(this.id, this.name, this.description , this.levelMin, this.scarcity,
      this.success, this.timer, this.qantity, this.price, this.url);
  

  TrapModel.inventory(this.id, this.name,this.description,this.levelMin, this.scarcity,this.success,this.timer, this.price,this.url);

set setQantity(value) => qantity = value;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'levelMin': levelMin,
        'sucess': success,
        'timer': timer,
        'scarcity': scarcity,
        'qantity': qantity,
        'price': price,
        'url' : url
      };

  factory TrapModel.fromJson(Map<String, dynamic> json) {
    return TrapModel(
      json['id'],
      json['name'],
      json['description'],
      json['levelMin'],
      json['scarcity'],
      json['sucess'],
      json['timer'],
      json['qantity'],
      json['price'] ,
      json['url']
    );
  }
}
