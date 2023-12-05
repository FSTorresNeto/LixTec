class QrCodeEntity {
  final double depositsTotalValue;

  QrCodeEntity({
    this.depositsTotalValue = 0,
  });

  Map<String, dynamic> toDocument() {
    return {
      "depositsTotalValue": depositsTotalValue,
    };
  }
}
