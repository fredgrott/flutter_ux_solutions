// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// has to have englishLike as that has the geometry
// and that as regular text theme will merge with black
// or white color dependening on themeMode.
//
// The logic of how textTheme is merged is in the ThemeData
// source coe lines 467 to 487. With non primary text theme
// the light mode black or dark white color text theme
// will be merged with our defined one.
//
// For primary we have to include the primary color so that
// black or white is overriden.
//
// I use a Theme.of(context0 hook to make it less boilerplate
// dense as we can grab the defined textStyle and input it into
// the GoogleFonts textStyle parameter to get GoogleFonts to
// deliver the right textStyle without manually defining every
// thing by hand.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme appTextTheme(BuildContext context) => TextTheme(
      displayLarge: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displayLarge),
      displayMedium: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displayMedium),
      displaySmall: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displaySmall),
      headlineLarge: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineLarge),
      headlineMedium: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineMedium),
      headlineSmall: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineSmall),
      titleLarge: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleLarge),
      titleMedium: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleMedium),
      titleSmall: GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleSmall),
      labelLarge: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelLarge),
      labelMedium: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelMedium),
      labelSmall: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelSmall),
      bodyLarge: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyLarge),
      bodyMedium: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyMedium),
      bodySmall: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodySmall),
    );

TextTheme appPrimaryTextTheme(BuildContext context, Color primaryColor) => TextTheme(
      displayLarge:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(color: primaryColor)),
      displayMedium:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: primaryColor)),
      displaySmall:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(color: primaryColor)),
      headlineLarge:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(color: primaryColor)),
      headlineMedium:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(color: primaryColor)),
      headlineSmall:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primaryColor)),
      titleLarge:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: primaryColor)),
      titleMedium:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: primaryColor)),
      titleSmall:
          GoogleFonts.openSans(textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: primaryColor)),
      labelLarge: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: primaryColor)),
      labelMedium:
          GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: primaryColor)),
      labelSmall: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: primaryColor)),
      bodyLarge: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor)),
      bodyMedium: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor)),
      bodySmall: GoogleFonts.oswald(textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: primaryColor)),
    );
