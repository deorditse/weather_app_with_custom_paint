import 'package:custom_paint_17/style_color/render_object.dart';
import 'package:flutter/material.dart';
import 'style_color/my_app_theme.dart';
import 'widgets/app_bar.dart';
import 'paint/custom_paint.dart';
import 'paint/detail_information_about_weather.dart';
import 'dart:math' as math;

class ExampleCustomPaint extends StatefulWidget {
  static const id = '/';

  const ExampleCustomPaint({Key? key}) : super(key: key);

  @override
  State<ExampleCustomPaint> createState() => _ExampleCustomPaintState();
}

class _ExampleCustomPaintState extends State<ExampleCustomPaint>
    with TickerProviderStateMixin {
  bool _isFirstVisible = false;
  double _currentRangeValues = 0; //имитация состояния погоды

  late AnimationController _controller;
  late Animation<double> _myAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _myAnimation = Tween<double>(begin: 100, end: 350).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myStyleThemeProvider = MyThemeDataInherited.of(context);
    final myThemeApp = MyThemeDataInherited.of(context).theme;

    return Scaffold(
      backgroundColor: myThemeApp.colorScheme.backgroundColor,
      appBar: myAppBar(myStyleThemeProvider),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: AnimatedBuilder(
                  animation: _myAnimation,
                  builder: (BuildContext context, Widget? child) =>
                      GestureDetector(
                    onTap: () {
                      !_isFirstVisible
                          ? _controller.forward()
                          : _controller.reverse();
                      setState(() {
                        _isFirstVisible = !_isFirstVisible;
                      });
                    },
                    child: Container(
                      height: _myAnimation.value,
                      width: _myAnimation.value,
                      //  color: Colors.black,
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: _myAnimation.value,
                        width: _myAnimation.value,
                        child: CustomPaint(
                          painter: MyCustomPainter(
                              currentRangeValues: _currentRangeValues),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _isFirstVisible
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InnerShadow(
                            blur: 5,
                            color: Colors.indigo,
                            offset: const Offset(5, 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.lightBlueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Сегодня: облачно, 12 градусов, в ближайшее время осадков не ожидается',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),

                          // CustomStateLessWidget(
                          //   text:
                          //       'Сегодня: облачно, 12 градусов, в ближайшее время осадков не ожидается',
                          // ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : Text(''),
              Text(
                'Погода на неделю: ',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              Divider(),
              Container(
                color: myThemeApp.colorScheme.colorPrimary?.withOpacity(0.3),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('Пн'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter:
                                    MyCustomPainter(currentRangeValues: 0.5),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Вт'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter:
                                    MyCustomPainter(currentRangeValues: 0.7),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Ср'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter:
                                    MyCustomPainter(currentRangeValues: 0.9),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Чт'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter: MyCustomPainter(currentRangeValues: 0),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Пт'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter: MyCustomPainter(currentRangeValues: 1),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Сб'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter: MyCustomPainter(currentRangeValues: 1),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Вс'),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CustomPaint(
                                painter:
                                    MyCustomPainter(currentRangeValues: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде Сюда выводится какая-то информация о погоде',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'Индикатор имитации погоды',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Slider(
                      value: _currentRangeValues,
                      min: 0,
                      max: 1,
                      divisions: 100,
                      label: _currentRangeValues.toString(),
                      onChanged: (double values) {
                        setState(() {
                          _currentRangeValues = values;
                          print(_currentRangeValues);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
