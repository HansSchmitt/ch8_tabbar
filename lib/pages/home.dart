import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Birthdays(),
            Gratitude(),
            Reminders(),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black54,
        unselectedLabelColor: Colors.black38,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.cake,
            color: Colors.orange,
            ),
            text: 'Birthdays',
          ),
          Tab(
            icon: Icon(Icons.sentiment_satisfied,
            color: Colors.red,
            ),
            text: 'Gratitude',
          ),
          Tab(
            icon: Icon(Icons.access_alarm,
            color: Colors.cyan,
            ),
            text: 'Reminders',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();

  }

  void _tabChanged(){
    //Check if tab controller index is changing, otherwise we get the notice twice
    if(_tabController.indexIsChanging){
      print('tabChanged: ${_tabController.index}');
    }
  }

}



