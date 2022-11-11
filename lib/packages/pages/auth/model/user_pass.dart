import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:basic_2022/services/constant/path_icons.dart';

class ModelUserPass {
  bool isObscure;
  FaIcon icon;
  ModelUserPass({
    this.isObscure = true,
    this.icon = PathIcons.eyeIcon,
  });
}
