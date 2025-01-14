import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((hrf) => false);
//colores immutables
final colorsProvider = Provider((ref) => colorList);


final selectedColorProvider = StateProvider<int>((hrf) => 0);
