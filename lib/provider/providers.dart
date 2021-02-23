import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'Theme.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider(),
  )
];

/// 需要依赖的model
///
/// UserModel依赖globalFavouriteStateModel
List<SingleChildWidget> dependentServices = [
  
];

List<SingleChildWidget> uiConsumableProviders = [
];