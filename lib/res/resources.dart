import 'package:flutter/material.dart';
import 'package:gro_stellar_renewed/res/strings/strings.dart';
import 'package:gro_stellar_renewed/res/styles/app_styles.dart';

import 'colors/app_colors.dart';
import 'dimensions/app_dimensions.dart';
import 'drawables/app_drawables.dart';


class Resources {
  final BuildContext _context;

  Resources(this._context);

  Strings? get strings {
    return Localizations.of<Strings>(_context, Strings);
  }

  AppColors get color {
    return AppColors();
  }

  AppDrawables get drawable {
    return AppDrawables();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppStyle get style {
    return AppStyle();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
