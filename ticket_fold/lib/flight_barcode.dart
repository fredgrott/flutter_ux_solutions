// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

import 'package:flutter/material.dart';
import 'package:ticket_fold/build_context_extensions.dart';

class FlightBarcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
       
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: context.surfaceBright),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: ElevatedButton(
            child: const Image(image: AssetImage('assets/images/barcode.png')),
            
            
            onPressed: () {
              debugPrint('Button was pressed');
            },
          ),
        ),
      );
}
