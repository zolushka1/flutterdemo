class Contract {
  int id;
  int activityId;
  String number;
  String ttd;
  String name;
  String endAt;
  String status;
  String address;
  String supermarketNumber;
  String supermarketNumber1;
  bool deleted;

  Contract({
    this.id = 0,
    this.activityId = 0,
    this.number = '',
    this.ttd = '',
    this.name = '',
    this.endAt = '',
    this.status = '',
    this.address = '',
    this.supermarketNumber = '',
    this.supermarketNumber1 = '',
    this.deleted = false,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
        id: json['id'],
        activityId: json['activityId'],
        number: json['number'],
        ttd: json['ttd'],
        name: json['name'],
        endAt: json['endAt'],
        status: json['status'],
        address: json['address'],
        supermarketNumber: json['supermarketNumber'],
        supermarketNumber1: json['supermarketNumber1'],
        deleted: json['deleted']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'supermarketNumber': this.supermarketNumber,
        'supermarketNumber1': this.supermarketNumber1,
        'address': this.address,
        'activityId': this.activityId,
        'ttd': this.ttd,
        'name': this.name
      };
}
