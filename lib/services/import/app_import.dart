import 'dart:async';
import 'dart:collection';

import 'dart:io';
import 'package:basic_2022/packages/pages/home/model/order.dart';
import 'package:basic_2022/services/constant/key_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../packages/components/config_material.dart';
import '../../packages/pages/auth/model/user_auth.dart';
import '../../packages/pages/auth/model/user_pass.dart';
import '../../packages/pages/home/model/coffee.dart';
import '../../packages/pages/home/model/ingredients.dart';
import '../dimen/app_dimen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../packages/components/loading/enum_loading.dart';
import '../constant/path_icons.dart';
import '../constant/path_image.dart';
import '../language/generated/key_lang.dart';

import 'dart:developer' as developer;
import 'package:validators/validators.dart' as validators;

// * main
part '../../start_main.dart';

// * view
part '../../packages/pages/home/view/body.dart';
part '../../packages/pages/splash/views/body.dart';
part '../../packages/pages/auth/view/login.dart';
part '../../packages/pages/auth/view/register.dart';
part '../../packages/pages/auth/view/forgot.dart';
part '../../packages/pages/home/view/order.dart';
// * Service
part '../constant/path_svg.dart';
part '../language/config/config_lang.dart';
part '../language/language_status.dart';
part '../restart_app/app_restart.dart';
part '../routes/app_route.dart';
part '../themes/app_colors.dart';
part '../themes/custom_theme.dart';
part '../themes/theme_status.dart';
part '../validotors/app_validators.dart';
part '../themes/change_theme.dart';

// * Manage State
part '../../packages/pages/auth/manage_state/auth_service.dart';
part '../../packages/pages/auth/view/wrapper.dart';
part '../../packages/pages/home/manage_state/coffee.dart';
part '../../packages/pages/home/manage_state/ingredients.dart';
part '../../packages/pages/home/manage_state/order_service.dart';

// * Components
part '../../packages/components/app_drawer/drawer_home/lang/alert_lang.dart';
part '../../packages/components/app_drawer/drawer_home/lang/flag_lang.dart';
part '../../packages/components/app_drawer/drawer_home/body_drawer.dart';
part '../../packages/components/app_drawer/drawer_home/header_drawer.dart';
part '../../packages/components/app_drawer/drawer_home/listtile_drawer.dart';
part '../../packages/components/app_drawer/drawer_home/settings_drawer.dart';
part '../../packages/components/loading/app_loading.dart';
part '../../packages/components/loading/loading_page.dart';
part '../../packages/components/button/outlined_btn.dart';
part '../../packages/pages/auth/components/header_auth.dart';
part '../../packages/pages/auth/components/forgot_pass_text.dart';
part '../../packages/pages/auth/components/footer_auth.dart';
part '../../packages/components/button/gradient_btn.dart';
part '../../packages/components/form_filed/custom_filed.dart';
part '../../packages/pages/auth/components/field_email.dart';
part '../../packages/pages/auth/components/field_pass.dart';
part '../../packages/components/errors/error_text.dart';
part '../../packages/components/toast/custom_toast.dart';
part '../../packages/pages/home/components/floating_button/floating_btn.dart';
part '../../packages/pages/home/components/app_bar/appbar_home.dart';
part '../../packages/pages/home/components/order/choose_coffee/coffee_image.dart';
part '../../packages/pages/home/components/order/choose_coffee/coffee_radio.dart';
part '../../packages/pages/home/components/order/choose_coffee/row_choose_coffee.dart';
part '../../packages/pages/home/components/order/ingredient/build_checkbox.dart';
part '../../packages/pages/home/components/order/ingredient/build_ingredinet.dart';
part '../../packages/pages/home/components/order/show_order/view_order.dart';
