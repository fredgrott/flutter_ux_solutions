// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which 
// is under MIT License and copyrighted 2019

import 'package:flutter/material.dart';
import 'package:ticket_fold/build_context_extensions.dart';
import 'package:ticket_fold/demo_data.dart';
import 'package:ticket_fold/flight_barcode.dart';
import 'package:ticket_fold/flight_details.dart';
import 'package:ticket_fold/flight_summary.dart';
import 'package:ticket_fold/folding_ticket.dart';

class Ticket extends StatefulWidget {
  static const double nominalOpenHeight = 400;
  static const double nominalClosedHeight = 160;
  final BoardingPassData boardingPass;
  final VoidCallback? onClick;

  const Ticket({super.key, required this.boardingPass, required this.onClick});
  @override
  State<StatefulWidget> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  FlightSummary? topCard;
  late FlightSummary frontCard = FlightSummary(boardingPass: widget.boardingPass);
  late FlightDetails middleCard = FlightDetails(widget.boardingPass);
  FlightBarcode bottomCard = FlightBarcode();
  bool _isOpen = false;

  Widget backCard(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          
          color: context.surfaceBright,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FoldingTicket(entries: _getEntries(context), isOpen: _isOpen, onClick: _handleOnTap);
  }

  List<FoldEntry> _getEntries(BuildContext context) {
    return [
      FoldEntry(height: 160.0, front: topCard),
      FoldEntry(height: 160.0, front: middleCard, back: frontCard),
      FoldEntry(height: 80.0, front: bottomCard, back: backCard(context)),
    ];
  }

  void _handleOnTap() {
    widget.onClick?.call();
    setState(() {
      _isOpen = !_isOpen;
      topCard = FlightSummary(boardingPass: widget.boardingPass, theme: SummaryTheme.dark, isOpen: _isOpen);
    });
  }
}
