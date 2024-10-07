// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

// ignore_for_file: avoid_redundant_argument_values, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ticket_fold/build_context_extensions.dart';
import 'package:ticket_fold/demo_data.dart';

enum SummaryTheme { dark, light }

class FlightSummary extends StatelessWidget {
  final BoardingPassData boardingPass;
  final SummaryTheme theme;
  final bool isOpen;

  const FlightSummary({super.key, required this.boardingPass, this.theme = SummaryTheme.light, this.isOpen = false});

  bool get isLight => theme == SummaryTheme.light;

  @override
  Widget build(BuildContext context) {
    final TextStyle bodyTextStyle =
        context.bodySmall!.copyWith(color: context.secondaryFixed);

    final Color? secondaryTextColor = context.secondaryFixedDim;

    final Color? mainTextColor = context.secondaryFixed;

    final Color? separatorColor = context.inversePrimary;

    return Container(
      decoration: _getBackgroundDecoration() as Decoration,
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildLogoHeader(context, mainTextColor!) as Widget,
            _buildSeparationLine(separatorColor!),
            _buildTicketHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Stack(
                children: <Widget>[
                  Align(alignment: Alignment.centerLeft, child: _buildTicketOrigin(bodyTextStyle, secondaryTextColor!)),
                  Align(alignment: Alignment.center, child: _buildTicketDuration(bodyTextStyle)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildTicketDestination(bodyTextStyle, secondaryTextColor),
                  ),
                ],
              ),
            ),
            _buildBottomIcon(mainTextColor),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getBackgroundDecoration() {
    return isLight
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white,
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/bg_blue.png',
              ),
              fit: BoxFit.cover,
            ),
          );
  }

  RenderObjectWidget _buildLogoHeader(BuildContext context, Color mainTextColor) {
    if (isLight) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Image.asset(
              'assets/images/flutter-logo.png',
              width: 8,
            ),
          ),
          Text(
            'Fluttair'.toUpperCase(),
            style: context.labelLarge?.copyWith(color: mainTextColor),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Image.asset(
          'assets/images/logo_white.png',
          height: 12,
        ),
      );
    }
  }

  Widget _buildSeparationLine(Color separatorColor) {
    return Container(
      width: double.infinity,
      height: 1,
      color: separatorColor,
    );
  }

  Widget _buildTicketHeader(BuildContext context) {
    final headerStyle = context.labelLarge?.copyWith(color: context.secondaryFixed);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(boardingPass.passengerName.toUpperCase(), style: headerStyle),
        Text('BOARDING ${boardingPass.boardingTime.format(context)}', style: headerStyle),
      ],
    );
  }

  Widget _buildTicketOrigin(TextStyle bodyTextStyle, Color secondaryTextColor) {
    return Column(
      children: <Widget>[
        Text(
          boardingPass.origin.code.toUpperCase(),
          style: bodyTextStyle.copyWith(fontSize: 42),
        ),
        Text(boardingPass.origin.city, style: bodyTextStyle.copyWith(color: secondaryTextColor)),
      ],
    );
  }

  Widget _buildTicketDuration(TextStyle bodyTextStyle) {
    final String routeType = isLight ? 'blue' : 'white';
    final planeImage = Image.asset(
      'assets/images/airplane_$routeType.png',
      height: 20,
      fit: BoxFit.contain,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 120,
            height: 58,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/planeroute_$routeType.png',
                  fit: BoxFit.cover,
                ),
                if (isLight) planeImage else _AnimatedSlideToRight(isOpen: isOpen, child: planeImage),
              ],
            ),
          ),
          Text(boardingPass.duration.toString(), textAlign: TextAlign.center, style: bodyTextStyle),
        ],
      ),
    );
  }

  Widget _buildTicketDestination(TextStyle bodyTextStyle, Color secondaryTextColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          boardingPass.destination.code.toUpperCase(),
          style: bodyTextStyle.copyWith(fontSize: 42),
        ),
        Text(
          boardingPass.destination.city,
          style: bodyTextStyle.copyWith(color: secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildBottomIcon(Color mainTextColor) {
    final IconData icon = isLight ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up;
    return Icon(
      icon,
      color: mainTextColor,
      size: 18,
    );
  }
}

class _AnimatedSlideToRight extends StatefulWidget {
  final Widget child;
  final bool isOpen;

  const _AnimatedSlideToRight({required this.child, required this.isOpen});

  @override
  _AnimatedSlideToRightState createState() => _AnimatedSlideToRightState();
}

class _AnimatedSlideToRightState extends State<_AnimatedSlideToRight> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1700));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOpen) _controller.forward(from: 0);
    return SlideTransition(
      position: Tween(begin: const Offset(-2, 0), end: const Offset(1, 0)).animate(
        CurvedAnimation(curve: Curves.easeOutQuad, parent: _controller),
      ),
      child: widget.child,
    );
  }
}
