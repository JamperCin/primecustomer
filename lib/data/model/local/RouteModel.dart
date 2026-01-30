class RouteModel {
  String? distance;
  String? duration;
  String? startAddress;
  String? endAddress;
  String? route;
  int distanceValue;
  int durationValue;

  RouteModel({
    this.distance,
    this.duration,
    this.startAddress,
    this.endAddress,
    this.route,
    this.distanceValue = 0,
    this.durationValue = 0,
  });
}
