import 'package:flutter/material.dart';

class WidgetCustomisationExample extends StatelessWidget {
  const WidgetCustomisationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Customisation Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Container Box Decoration & Shadow & Gradients',
              textScaleFactor: 2.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.red, Colors.cyan],
                    // end: Alignment(0.4, 1.0),
                    // tileMode: TileMode.decal,
                  ),
                  // gradient: RadialGradient(
                  //   colors: [
                  //     Colors.red,
                  //     Colors.cyan,
                  //     Colors.purple,
                  //     Colors.lightGreenAccent
                  //   ],
                  //   center: Alignment(0, 0),
                  //   radius: .7,
                  //   stops: [0.3, 0.5, 0.6, 0.7],
                  //   tileMode: TileMode.clamp,
                  // ),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkTQ8DFOgujidIRil33r2QnSZ2Y_ZHahrUlw&usqp=CAU",
                  //   ),
                  // centerSlice: Rect.fromLTWH(50.0, 50.0, 170.0, 90.0),
                  // fit: BoxFit.none,

                  // repeat: ImageRepeat.repeat,
                  // colorFilter: ColorFilter.mode(
                  //   Colors.redAccent.withOpacity(.5),
                  //   // BlendMode.colorBurn,
                  //   BlendMode.hue,
                  // ),
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.red,
                  //     // offset: Offset(10.0, 10.0),
                  //     blurRadius: 20.0,
                  //     spreadRadius: 6.0,
                  //     // blurStyle: BlurStyle.inner,
                  //   ),
                  //   BoxShadow(
                  //     color: Colors.yellow,
                  //     // offset: Offset(20.0, 20.0),
                  //     blurRadius: 10.0,
                  //     spreadRadius: 5.0,
                  //     // blurStyle: BlurStyle.inner,
                  //   )
                  // ],
                  // shape: BoxShape.circle,
                ),
                // width: 200.0,
                // height: 200.0,
                child: const FlutterLogo(
                  size: 200.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'TextField Input Decoration',
              textScaleFactor: 2.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enabled decoration text ...",
                  )),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Disabled decoration text ...",
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Error decoration text ...",
                        errorText: "Ooops, something is not right!",
                        errorStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Focus decoration text ...",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red, //this has no effect
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Border decoration text ...",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.cyan,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 5.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Border decoration text ...",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      labelText: 'demo',
                      floatingLabelStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 24.0,
                      ),
                      // alignLabelWithHint: true,
                      // isCollapsed: true,
                      // isDense: true,
                      // contentPadding: const EdgeInsets.symmetric(
                      //     horizontal: 20.0),
                      // counter: TextButton(
                      //   onPressed: () {},
                      //   child: const Text('Forgot Password'),
                      // ),
                      // semanticCounterText: 'Testing',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Text Style decoration',
              textScaleFactor: 3.0,
              style: TextStyle(
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                leadingDistribution:
                    TextLeadingDistribution.proportional,
              ),
              // strutStyle: StrutStyle(
              //   fontSize: 10.0,
              //   leading: 10.0,
              // ),
              // softWrap: true,
              // overflow: TextOverflow.ellipsis,
              // textWidthBasis: TextWidthBasis.longestLine,
              // textHeightBehavior: TextHeightBehavior(),
            ),
          ],
        ),
      ),
    );
  }
}
