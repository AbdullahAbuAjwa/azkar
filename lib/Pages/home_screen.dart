import 'package:azkar/Pages/azkar_screen.dart';
import 'package:azkar/Pages/sebha_screen.dart';
import 'package:azkar/Widget/dialog.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    Provider.of<AzkarProvider>(context, listen: false).getNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(),
        body: TabBarView(
          controller: tabController,
          children: [
            AzkarScreen(),
            SebhaScreen(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text('أذكاري'),
      actions: [
        IconButton(
          onPressed: () {
            CustomDialog.customDialog.rateApp(context);
          },
          icon: Icon(
            Icons.star_rate,
            color: Colors.yellow[600],
            size: 28.sp,
          ),
          tooltip: 'قم بتقييم التطبيق الآن',
        )
      ],
      bottom: TabBar(
        labelColor: Theme.of(context).colorScheme.primary,
        indicatorWeight: 1.5,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        controller: tabController,
        unselectedLabelColor: Colors.black,
        onTap: (index) {
          currentIndex = index;
          tabController!.animateTo(index);
        },
        tabs: [
          Tab(
            child: Text('الأذكار'),
          ),
          Tab(
            child: Text('السبحة الالكترونية'),
          ),
        ],
      ),
    );
  }
}
