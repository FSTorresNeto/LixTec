class FeatureEntity {
  int featureType;

  FeatureEntity({
    this.featureType = 0,
  });

  Map<String, dynamic> toDocument() {
    return {
      "featureType": featureType,
    };
  }
}
