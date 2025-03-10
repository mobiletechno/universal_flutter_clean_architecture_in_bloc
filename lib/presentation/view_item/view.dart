import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_univarsal_architecture/presentation/Home/view_model.dart';
import 'package:flutter_univarsal_architecture/presentation/view_item/view_model.dart';

import '../../utils/custom_ui.dart';
import '../../utils/gobal_timer.dart';
import '../home/bloc_events.dart';
import 'bloc_events.dart';



class ItemPage extends StatefulWidget {
  final String previousData;
  const ItemPage({super.key, required this.title, required this.previousData});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage>  with SingleTickerProviderStateMixin {

  final _itemViewModel =ItemViewModel();
  @override
  void initState() {
    _itemViewModel.initialPage();
    _itemViewModel.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    super.initState();
  }
@override
  void dispose() {
  GlobalTimer.instance.stop();
  _itemViewModel.subscription?.cancel();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  LayoutBuilder(builder: (context, constraints) {
          return
          StreamBuilder<ItemState>(stream: _itemViewModel.streamController.stream, builder: (context, snapshot) {
            final stateData=snapshot.data;
            if(stateData is ListenState) {
              return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(widget.previousData),

                    CustomPaint(child: Center(child: Text("count : ${stateData.count.toString()}")),painter: CustomUI(),size: Size(constraints.maxWidth*100, constraints.maxHeight*40),),
                      ClipPath(
                          clipper: WaveClipper(),

                        child: Image.network('https://media.istockphoto.com/id/2152960546/photo/young-woman-using-digital-tablet-at-home.jpg?s=1024x1024&w=is&k=20&c=27V7LRjvBh65_Zv0F5SNnHBh-_HAutLlkX-KXUgUmxk='),

                      ),
                AnimatedBuilder(
                  animation: _itemViewModel.controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: WavePainter(_itemViewModel.controller.value),
                      size: Size(double.infinity, 200),
                    );
                  },
                ),

                  ],)
              );
            }else{
              return SizedBox();
            };


          }

          );

        },),

    );
  }
}
