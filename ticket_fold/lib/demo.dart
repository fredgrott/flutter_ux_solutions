// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ticket_fold/build_context_extensions.dart';

import 'package:ticket_fold/demo_data.dart';

import 'package:ticket_fold/ticket.dart';

class TicketFoldDemo extends StatefulWidget {
  @override
  _TicketFoldDemoState createState() => _TicketFoldDemoState();
}

class _TicketFoldDemoState extends State<TicketFoldDemo> {
  final List<BoardingPassData> _boardingPasses = DemoData().boardingPasses;

  final ScrollController _scrollController = ScrollController();

  final List<int> _openTickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: _boardingPasses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Ticket(
                    boardingPass: _boardingPasses.elementAt(index),
                    onClick: () => _handleClickedTicket(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _handleClickedTicket(int clickedTicket) {
    // Scroll to ticket position
    // Add or remove the item of the list of open tickets
    _openTickets.contains(clickedTicket) ? _openTickets.remove(clickedTicket) : _openTickets.add(clickedTicket);

    // Calculate heights of the open and closed elements before the clicked item
    final double openTicketsOffset = Ticket.nominalOpenHeight * _getOpenTicketsBefore(clickedTicket);
    final double closedTicketsOffset =
        Ticket.nominalClosedHeight * (clickedTicket - _getOpenTicketsBefore(clickedTicket));

    final double offset = openTicketsOffset + closedTicketsOffset - (Ticket.nominalClosedHeight * .5);

    // Scroll to the clicked element
    _scrollController.animateTo(
      max(0, offset),
      duration: const Duration(seconds: 1),
      curve: const Interval(.25, 1, curve: Curves.easeOutQuad),
    );
    // Return true to stop the notification propagation
    return true;
  }

  int _getOpenTicketsBefore(int ticketIndex) {
    // Search all indexes that are smaller to the current index in the list of indexes of open tickets
    return _openTickets.where((int index) => index < ticketIndex).length;
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back, color: context.primary),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Icon(Icons.more_horiz, color: context.primary, size: 28),
        ),
      ],
      backgroundColor: context.surface,
      elevation: 0,
      title: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Boarding Passes'.toUpperCase(),
          textAlign: TextAlign.center,
          style: context.titleMedium?.copyWith(
                color: context.primary,
              ),
        ),
      ),
    );
  }
}
