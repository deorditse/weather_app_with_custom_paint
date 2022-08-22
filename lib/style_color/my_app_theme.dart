import 'package:custom_paint_17/style_color/stylesTheme.dart';
import 'package:flutter/material.dart';

//Виджет для изменения состояния приложения
class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StateWidget> createState() => StateWidgetState();
}

class StateWidgetState extends State<StateWidget> {
  late StyleColorTheme theme;

  @override
  void initState() {
    super.initState();
    profileStyleChange();
  }

  void profileStyleChange({
    Color? colorPrimary,
    Color? secondaryPrimary,
    Color? colorText,
    Color? backgroundColor,
  }) {
    setState(
      () => theme = StyleColorTheme(
        colorScheme: ColorSchemeStyle(
          colorPrimary: colorPrimary,
          secondaryPrimary: secondaryPrimary,
          backgroundColor: backgroundColor,
        ),
        textTheme: TextThemeStyle(colorText: colorText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => MyThemeDataInherited(
        child: widget.child,
        theme: theme,
        stateWidget: this,
      );
}


class MyThemeDataInherited extends InheritedWidget {
  //все виджеты которые будут дочерними от этого виджета смогуть получать данные напрямую
  final StyleColorTheme theme;
  Widget child;
  final StateWidgetState stateWidget;

  MyThemeDataInherited(
      {required this.theme,
      required this.child,
      required this.stateWidget,
      Key? key}) //все таки нужно закидывать child
      : super(child: child, key: key);

  @override
  bool updateShouldNotify(MyThemeDataInherited old) =>
      theme != old.theme; //проверяем не равняются ли старые данные новым данным

  static StateWidgetState of(BuildContext context) {
    // переопределяем of чтобы каждый раз не использовать context.dependOnInheritedWidgetOfExactType<TextStyleTheme>()
    final result =
        context.dependOnInheritedWidgetOfExactType<MyThemeDataInherited>();
    assert(result != null, 'No Text Style Theme found in context');
    return result!.stateWidget;
  }
//также можно возвращать и сам виджет модельк
}

//моделька темы
class StyleColorTheme {
  ColorSchemeStyle colorScheme;
  TextThemeStyle textTheme;

  StyleColorTheme({required this.textTheme, required this.colorScheme});
}

class ColorSchemeStyle {
  Color? colorPrimary;
  Color? secondaryPrimary;
  Color? backgroundColor;

  ColorSchemeStyle(
      {this.colorPrimary, this.secondaryPrimary, this.backgroundColor});
}

class TextThemeStyle {
  Color? colorText;

  TextThemeStyle({this.colorText});
}
