import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
class SilverListFlutterExample extends StatefulWidget {
  const SilverListFlutterExample({super.key});

  @override
  State<SilverListFlutterExample> createState() =>
      _SilverListFlutterExampleState();
}

class _SilverListFlutterExampleState extends State<SilverListFlutterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Center(child: Text('Horizon',style: TextStyle(color: Colors.white),),),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SingleChildScrollView(child: Column(children: [
            // Text(
            //   'Day ${index + 1}',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            WeatherDetailsWidgeted(
              currentDate: DateTime.now().add(Duration(days: index)),
              weekDay: DateTime.now().add(Duration(days: index)),
              highTemperature: 15.0 + index,
              lowTemperature: 10.0 + index,
            ),
            Divider(),

          ],));
        },
      ),
    );
  }
}

class WeatherDetailsWidgeted extends StatelessWidget {
  final DateTime currentDate;
  final DateTime weekDay;
  final double highTemperature;
  final double lowTemperature;
  const WeatherDetailsWidgeted({
    super.key,
    required this.currentDate,
    required this.weekDay,
    required this.highTemperature,
    required this.lowTemperature,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(currentDate.day.toString()),
        title: Text(DateFormat('EEEE').format(weekDay)),
        trailing: Text('${highTemperature.toString()}°C|${lowTemperature.toString()}°C'),
      ),
    );
  }
}



class SilverListAppExample2 extends StatefulWidget {
  const SilverListAppExample2({super.key});

  @override
  State<SilverListAppExample2> createState() =>
      _SilverListAppExample2State();
}

class _SilverListAppExample2State extends State<SilverListAppExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.green,title: Center(child: Text('Horizon',style: TextStyle(color: Colors.white),),),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
           // floating: true,
          // snap: true,
          stretch: true,
          stretchTriggerOffset: 100,
          onStretchTrigger: () async{
            print('Slivers are being stretched');
          },
           expandedHeight: 200,
           // title:Text('Horizons',style:TextStyle(color: Colors.white)),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title:Text('Horizons',style:TextStyle(color: Colors.white)),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                    Colors.teal[800]!,
                    Colors.transparent
                  ]),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:CachedNetworkImageProvider(
                    //fit: BoxFit.cover,
                    'https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                )),
              ),
            ),
            backgroundColor: Colors.green[800],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              
              childCount: 10,
               (context, index) {
                return Column(children: [
                  // Text(
                  //   'Day ${index + 1}',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  WeatherDetailsWidget(
                    currentDate: DateTime.now().add(Duration(days: index)),
                    weekDay: DateTime.now().add(Duration(days: index)),
                    highTemperature: 15.0 + index,
                    lowTemperature: 10.0 + index,
                  ),
                  Divider(),
                
                ],);
              },
            ),
          ),
        ],
      ),
    );
  }
}


class WeatherDetailsWidget extends StatelessWidget {
  final DateTime currentDate;
  final DateTime weekDay;
  final double highTemperature;
  final double lowTemperature;
  const WeatherDetailsWidget({
    super.key,
    required this.currentDate,
    required this.weekDay,
    required this.highTemperature,
    required this.lowTemperature,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(),
      child: Row(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.srcATop,
                    gradient: RadialGradient(colors: [
                      Colors.grey,
                      Colors.transparent
                    ]),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:CachedNetworkImageProvider('https://images.pexels.com/photos/593655/pexels-photo-593655.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
                  ),),
                Center(child: Text(currentDate.day.toString(),style: TextStyle(color: const Color.fromARGB(255, 3, 24, 255),fontSize: 35),)),
              ],
            )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(DateFormat('EEEE').format(weekDay)),
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${highTemperature.toString()}°C|${lowTemperature.toString()}°C'),
          )

        ],
       // leading: Text(currentDate.day.toString()),
       // title: Text(DateFormat('EEEE').format(weekDay)),
       // trailing: Text('${highTemperature.toString()}°C|${lowTemperature.toString()}°C'),
      ),
    );
  }
}