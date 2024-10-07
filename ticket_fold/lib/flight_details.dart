// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_fold/build_context_extensions.dart';

import 'package:ticket_fold/demo_data.dart';

class FlightDetails extends StatelessWidget {
  final BoardingPassData boardingPass;

  const FlightDetails(this.boardingPass);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = context.titleSmall!.copyWith(
          color: context.secondary,
        );
    final TextStyle contentTextStyle = context.titleMedium!.copyWith(
          color: context.secondary,
        );

    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Gate'.toUpperCase(), style: titleTextStyle),
                  Text(boardingPass.gate, style: contentTextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Zone'.toUpperCase(), style: titleTextStyle),
                  Text(boardingPass.zone.toString(), style: contentTextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Seat'.toUpperCase(), style: titleTextStyle),
                  Text(boardingPass.seat, style: contentTextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Class'.toUpperCase(), style: titleTextStyle),
                  Text(boardingPass.flightClass, style: contentTextStyle),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Flight'.toUpperCase(), style: titleTextStyle),
                  Text(boardingPass.flightNumber, style: contentTextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Departs'.toUpperCase(), style: titleTextStyle),
                  Text(DateFormat('MMM d, H:mm').format(boardingPass.departs).toUpperCase(), style: contentTextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Arrives'.toUpperCase(), style: titleTextStyle),
                  Text(DateFormat('MMM d, H:mm').format(boardingPass.arrives).toUpperCase(), style: contentTextStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
