import 'package:flutter/material.dart';
import 'package:todo/screens/home/tabs/list/list_tabs.dart';
import 'package:todo/screens/home/tabs/settings/settings_tab.dart';
import 'package:todo/ui/screens/bottom_sheets/app_bottom_sheet.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedTabIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNav(),
      body:currentSelectedTabIndex==0?ListTab():SettingsTab(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget buildAppBar() =>
      AppBar(
        title: const Text("To Do List"),
        toolbarHeight: MediaQuery.of(context).size.height*.1,
      );

  Widget buildBottomNav() =>
      BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          onTap: (index){
            currentSelectedTabIndex=index;
            setState(() {});
          },
          currentIndex: currentSelectedTabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ],
        ),
      );

  Widget buildFab() =>
      FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (_) =>
              Padding(
                padding: MediaQuery
                    .of(context)
                    .viewInsets,
                child: const AddBottomSheet(),
              ));
        },
        child: const Icon(Icons.add),
      );
}
