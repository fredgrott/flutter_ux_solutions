// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:ticket_fold/app_brand_key_colors.dart';
import 'package:ticket_fold/app_scroll_behavior.dart';
import 'package:ticket_fold/app_text_themes.dart';
import 'package:ticket_fold/demo.dart';
import 'package:ticket_fold/platform_adaptive_color_scheme_builder.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformAdaptiveColorSchemeBuilder(
      builder: (ColorScheme? lightCSAdaptive, ColorScheme? darkCSAdaptive) {
        // we can do the brand color adjust here
        lightCSAdaptive = lightCSAdaptive!.copyWith(
          // we want to hue shift the fixed accent colors
          // towards brand color only
          primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixedDim.value)),

          onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixed.value)),

          onPrimaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixedVariant.value)),
          secondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.secondaryFixed.value)),
          secondaryFixedDim: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.secondaryFixedDim.value)),
          onSecondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.onSecondaryFixed.value)),
          onSecondaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.onSecondaryFixedVariant.value)),
          tertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.tertiaryFixed.value)),
          tertiaryFixedDim: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.tertiaryFixedDim.value)),
          onTertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.onTertiaryFixed.value)),
          onTertiaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.onTertiaryFixedVariant.value)),
        );

        darkCSAdaptive = darkCSAdaptive!.copyWith(
          primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixedDim.value)),
          onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixed.value)),
          onPrimaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixedVariant.value)),
          secondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.secondaryFixed.value)),
          secondaryFixedDim: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.secondaryFixedDim.value)),
          onSecondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.onSecondaryFixed.value)),
          onSecondaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.onSecondaryFixedVariant.value)),
          tertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.tertiaryFixed.value)),
          tertiaryFixedDim: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.tertiaryFixedDim.value)),
          onTertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.onTertiaryFixed.value)),
          onTertiaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.onTertiaryFixedVariant.value)),
        );

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightCSAdaptive,
            useMaterial3: true,
            textTheme: appTextTheme(context),
            primaryTextTheme: appPrimaryTextTheme(context, lightCSAdaptive.primary),
          ),
          darkTheme: ThemeData(
            colorScheme: darkCSAdaptive,
            useMaterial3: true,
            textTheme: appTextTheme(context),
            primaryTextTheme: appPrimaryTextTheme(context, darkCSAdaptive.primary),
          ),
          scrollBehavior: AppScrollBehavior(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: TicketFoldDemo(),
        );
      },
    );
  }
}
