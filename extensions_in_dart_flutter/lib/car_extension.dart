import 'package:extensions_in_dart_flutter/car_service.dart';

extension CarExtension on Car {
  double get mileageInKm => this.mileage * 0.6; // 8
}

extension CarExtension2 on Car {
  double get mileageInKm => this.mileage * 0.8; // 8
}

