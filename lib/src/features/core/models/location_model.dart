class LocationModel {
  final double latitude;
  final double longitude;

  const LocationModel({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() =>
      {"latitude": latitude, "longitude": longitude};
}
