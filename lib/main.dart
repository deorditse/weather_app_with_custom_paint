import 'package:custom_paint_17/page_custom_paint.dart';
import 'package:custom_paint_17/style_color/my_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build ________________');
    return StateWidget(
      //Для подключения к отслеживанию состояния Inherited widget
      child: Builder(builder: (innerContext) {
        final myThemeApp = MyThemeDataInherited.of(innerContext).theme;
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            //myThemeApp.colorScheme.backgroundColor,
            colorScheme: ColorScheme.light().copyWith(
              primary: myThemeApp.colorScheme.colorPrimary,
              secondary: myThemeApp.colorScheme.secondaryPrimary,
            ),
            textTheme: TextTheme(
              headline5: TextStyle(color: myThemeApp.textTheme.colorText),
              headline6: TextStyle(color: myThemeApp.textTheme.colorText),
              headline4: TextStyle(color: myThemeApp.textTheme.colorText),
              bodyText2: TextStyle(color: myThemeApp.textTheme.colorText),
            ),
          ),
          initialRoute: ExampleCustomPaint.id,
          getPages: [
            GetPage(
              name: ExampleCustomPaint.id,
              page: () => ExampleCustomPaint(),
            ),
          ],
        );
      }),
    );
  }
}
