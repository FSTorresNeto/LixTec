class TrashListEntity {
  final String street;
  final String number;
  final String state;
  final String city;
  final String country;
  final String complement;

  TrashListEntity({
    this.street = "",
    this.number = "",
    this.state = "",
    this.city = "",
    this.country = "",
    this.complement = "",
  });

  Map<String, dynamic> toDocument() {
    return {
      "street": street,
      "number": number,
      "state": state,
      "city": city,
      "country": country,
      "complement": complement,
    };
  }
}
