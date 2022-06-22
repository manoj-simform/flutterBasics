import 'package:basic_widget/animations/animation_screen.dart';
import 'package:basic_widget/bottom_navigation_bar.dart';
import 'package:basic_widget/bottom_sheet_dialogs.dart';
import 'package:basic_widget/button_example.dart';
import 'package:basic_widget/column_example.dart';
import 'package:basic_widget/custom_scrollview.dart';
import 'package:basic_widget/datafile_example.dart';
import 'package:basic_widget/extension_example.dart';
import 'package:basic_widget/future_builder.dart';
import 'package:basic_widget/gridview_example.dart';
import 'package:basic_widget/helper_widget_example.dart';
import 'package:basic_widget/hero/hero_example.dart';
import 'package:basic_widget/image%20manipulation/image_manipulation.dart';
import 'package:basic_widget/image_example.dart';
import 'package:basic_widget/layout_builder.dart';
import 'package:basic_widget/page_view_example.dart';
import 'package:basic_widget/photo_filter.dart';
import 'package:basic_widget/route%20transition/route_transition_example.dart';
import 'package:basic_widget/row_example.dart';
import 'package:basic_widget/stack_example.dart';
import 'package:basic_widget/state%20management/global/global_state_management.dart';
import 'package:basic_widget/state%20management/provider/provider_model.dart';
import 'package:basic_widget/state%20management/state_management_example.dart';
import 'package:basic_widget/stream_builder.dart';
import 'package:basic_widget/tab_bar_example.dart';
import 'package:basic_widget/tableview_example.dart';
import 'package:basic_widget/text_field_example.dart';
import 'package:basic_widget/widget_customisation_example.dart';
import 'package:flutter/material.dart';

import 'main.dart';

var myDataList = [
  'column',
  'row',
  'textField',
  'button',
  'image',
  'stack',
  'data file',
  'bottom navigation bar',
  'tab bar',
  'bottomShit & diaLogs',
  'future builder',
  'layout builder',
  'stream builder',
  'gridview',
  'tableview',
  'pageView',
  'custom scrollview',
  'helper widget',
  'widget customisation',
  'route transition',
  'hero widget',
  'extension',
  'state management',
  'animation',
  'photo filter',
  'image manipulation',
];

Map<String, Widget Function(BuildContext)> routes(BuildContext context) {
  return {
    '/': (context) => const MyHomePage(),
    '/column': (context) => const ColumnExample(),
    '/row': (context) => const RowExample(),
    '/textField': (context) => const TextFieldExample(),
    '/button': (context) => const ButtonExample(),
    '/image': (context) => const ImageExample(),
    '/stack': (context) => const StackExample(),
    '/data file': (context) => const DataFileExample(),
    '/bottom navigation bar': (context) => const BottomNavigationBarExample(),
    '/tab bar': (context) => const TabBarExample(),
    '/bottomShit & diaLogs': (context) => const BottomSheetDialogExample(),
    '/future builder': (context) => const FutureBuilderExample(),
    '/layout builder': (context) => const LayoutBuilderExample(),
    '/stream builder': (context) => const StreamBuilderExample(),
    '/gridview': (context) => const GridViewExample(),
    '/tableview': (context) => const TableViewExample(),
    '/pageView': (context) => const PageViewExample(),
    '/custom scrollview': (context) => const CustomScrollViewExample(),
    '/helper widget': (context) => const HelperWidgetExample(),
    '/widget customisation': (context) => const WidgetCustomisationExample(),
    '/route transition': (context) => const RouteTransitionExample(),
    '/hero widget': (context) => HeroExample(),
    '/extension': (context) => const ExtensionExample(),
    '/state management': (context) => const StateManagementExample(),
    '/globalState': (context) => const GlobalStateManagement(),
    '/providerStateManagement': (context) => const ProviderModel(),
    '/animation': (context) => const AnimationScreen(),
    '/photo filter': (context) => const PhotoFilterExample(),
    '/image manipulation': (context) => const ImageManipulation(),
  };
}

var fruitList = List.generate(100, (index) => 'Fruit $index');

var mainAxisList = <Text, MainAxisAlignment>{
  const Text('center'): MainAxisAlignment.center,
  const Text('end'): MainAxisAlignment.end,
  const Text('spaceAround'): MainAxisAlignment.spaceAround,
  const Text('spaceBetween'): MainAxisAlignment.spaceBetween,
  const Text('spaceEvenly'): MainAxisAlignment.spaceEvenly,
  const Text('start'): MainAxisAlignment.start,
};

var crossAxisList = <Text, CrossAxisAlignment>{
  const Text('center'): CrossAxisAlignment.center,
  const Text('end'): CrossAxisAlignment.end,
  const Text('start'): CrossAxisAlignment.start,
  const Text('stretch'): CrossAxisAlignment.stretch,
};

var alignmentList = <Text, Alignment>{
  const Text('Top Left'): Alignment.topLeft,
  const Text('Top Center'): Alignment.topCenter,
  const Text('Top Right'): Alignment.topRight,
  const Text('Center Left'): Alignment.centerLeft,
  const Text('Center'): Alignment.center,
  const Text('Center Right'): Alignment.centerRight,
  const Text('Bottom Left'): Alignment.bottomLeft,
  const Text('Bottom Center'): Alignment.bottomCenter,
  const Text('Bottom Right'): Alignment.bottomRight,
};
