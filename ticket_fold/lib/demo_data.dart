// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

import 'package:flutter/material.dart';

class BoardingPassData {
  String passengerName;
  _Airport origin;
  _Airport destination;
  _Duration duration;
  TimeOfDay boardingTime;
  DateTime departs;
  DateTime arrives;
  String gate;
  int zone;
  String seat;
  String flightClass;
  String flightNumber;

  BoardingPassData({
    required this.passengerName,
    required this.origin,
    required this.destination,
    required this.duration,
    required this.boardingTime,
    required this.departs,
    required this.arrives,
    required this.gate,
    required this.zone,
    required this.seat,
    required this.flightClass,
    required this.flightNumber,
  });
}

class _Airport {
  String code;
  String city;

  _Airport({required this.city, required this.code});
}

class _Duration {
  int hours;
  int minutes;

  _Duration({required this.hours, required this.minutes});

  @override
  String toString() {
    return '\t${hours}H ${minutes}M';
  }
}

class DemoData {
  final List<BoardingPassData> _boardingPasses = [
    BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YEG', city: 'Edmonton'),
      destination: _Airport(code: 'LAX', city: 'Los Angeles'),
      duration: _Duration(hours: 3, minutes: 30),
      boardingTime: const TimeOfDay(hour: 7, minute: 10),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '50',
      zone: 3,
      seat: '12A',
      flightClass: 'Economy',
      flightNumber: 'AC237',
    ),
    BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YYC', city: 'Calgary'),
      destination: _Airport(code: 'YOW', city: 'Ottawa'),
      duration: _Duration(hours: 3, minutes: 50),
      boardingTime: const TimeOfDay(hour: 12, minute: 15),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '22',
      zone: 1,
      seat: '17C',
      flightClass: 'Economy',
      flightNumber: 'AC237',
    ),
    BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YEG', city: 'Edmonton'),
      destination: _Airport(code: 'MEX', city: 'Mexico'),
      duration: _Duration(hours: 4, minutes: 15),
      boardingTime: const TimeOfDay(hour: 16, minute: 45),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '30',
      zone: 2,
      seat: '22B',
      flightClass: 'Economy',
      flightNumber: 'AC237',
    ),
    BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YYC', city: 'Calgary'),
      destination: _Airport(code: 'YOW', city: 'Ottawa'),
      duration: _Duration(hours: 3, minutes: 50),
      boardingTime: const TimeOfDay(hour: 12, minute: 15),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '22',
      zone: 1,
      seat: '17C',
      flightClass: 'Economy',
      flightNumber: 'AC237',
    ),
  ];

  List<BoardingPassData> get boardingPasses => _boardingPasses;

  BoardingPassData getBoardingPass(int index) {
    return _boardingPasses.elementAt(index);
  }
}
