import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chapter_01/page01_1.dart';
import 'chapter_01/page01_2.dart';
import 'chapter_01/page01_3.dart';
import 'chapter_01/page01_4.dart';
import 'chapter_01/page01_5.dart';
import 'chapter_02/page02_1.dart';
import 'chapter_02/page02_2.dart';
import 'chapter_02/page02_3.dart';
import 'chapter_02/page02_4.dart';
import 'chapter_02/page02_5.dart';
import 'chapter_03/page03_1.dart';
import 'chapter_03/page03_2.dart';
import 'chapter_03/page03_3.dart';
import 'chapter_03/page03_4.dart';
import 'chapter_03/page03_5.dart';
import 'chapter_04/page04_1.dart';
import 'chapter_04/page04_2.dart';
import 'chapter_04/page04_3.dart';
import 'chapter_04/page04_4.dart';
import 'chapter_04/page04_5.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the currently selected page, initialized to Page045
  Widget _selectedPage = Page045();

  // function to update the selected page
  void _selectPage(Widget page) {
    setState(() {
      _selectedPage = page;
    });
    Navigator.pop(context); // close the drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HEAD FIRST JAVA',
          style: GoogleFonts.nosifer(color: Colors.green[700]), // using custom font for title
        ),
        scrolledUnderElevation: 0, // remove elevation when scrolled
      ),
      endDrawer: Container(
        width: 180.0, // set the drawer width
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 70.0, // set the height of the drawer header
                child: DrawerHeader(
                  child: Text(
                    'ChapterQuizzes',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green[900],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                  ),
                ),
              ),
              // chapter 01 quizzes
              ExpansionTile(
                shape: Border(top: BorderSide.none, bottom: BorderSide.none,),
                title: Text('Chapter 01'),
                children: <Widget>[
                  ListTile(title: Text('Chapter 01 quiz 1'), onTap: () => _selectPage(Page011())),
                  ListTile(title: Text('Chapter 01 quiz 2'), onTap: () => _selectPage(Page012())),
                  ListTile(title: Text('Chapter 01 quiz 3'), onTap: () => _selectPage(Page013())),
                  ListTile(title: Text('Chapter 01 quiz 4'), onTap: () => _selectPage(Page014())),
                  ListTile(title: Text('Chapter 01 quiz 5'), onTap: () => _selectPage(Page015())),
                ],
              ),
               // add a divider between sections
              // chapter 02 quizzes
              ExpansionTile(
                shape: Border(top: BorderSide.none, bottom: BorderSide.none,),
                title: Text('Chapter 02'),
                children: <Widget>[
                  ListTile(title: Text('Chapter 02 quiz 1'), onTap: () => _selectPage(Page021())),
                  ListTile(title: Text('Chapter 02 quiz 2'), onTap: () => _selectPage(Page022())),
                  ListTile(title: Text('Chapter 02 quiz 3'), onTap: () => _selectPage(Page023())),
                  ListTile(title: Text('Chapter 02 quiz 4'), onTap: () => _selectPage(Page024())),
                  ListTile(title: Text('Chapter 02 quiz 5'), onTap: () => _selectPage(Page025())),
                ],
              ),
               // add a divider between sections
              // chapter 03 quizzes
              ExpansionTile(
                shape: Border(top: BorderSide.none, bottom: BorderSide.none,),
                title: Text('Chapter 03'),
                children: <Widget>[
                  ListTile(title: Text('Chapter 03 quiz 1'), onTap: () => _selectPage(Page031())),
                  ListTile(title: Text('Chapter 03 quiz 2'), onTap: () => _selectPage(Page032())),
                  ListTile(title: Text('Chapter 03 quiz 3'), onTap: () => _selectPage(Page033())),
                  ListTile(title: Text('Chapter 03 quiz 4'), onTap: () => _selectPage(Page034())),
                  ListTile(title: Text('Chapter 03 quiz 5'), onTap: () => _selectPage(Page035())),
                ],
              ),
               // add a divider between sections
              // chapter 04 quizzes
              ExpansionTile(
                shape: Border(top: BorderSide.none, bottom: BorderSide.none,),
                title: Text('Chapter 04'),
                children: <Widget>[
                  ListTile(title: Text('Chapter 04 quiz 1'), onTap: () => _selectPage(Page041())),
                  ListTile(title: Text('Chapter 04 quiz 2'), onTap: () => _selectPage(Page042())),
                  ListTile(title: Text('Chapter 04 quiz 3'), onTap: () => _selectPage(Page043())),
                  ListTile(title: Text('Chapter 04 quiz 4'), onTap: () => _selectPage(Page044())),
                  ListTile(title: Text('Chapter 04 quiz 5'), onTap: () => _selectPage(Page045())),
                ],
              ),
               // add a divider at the end of the drawer
            ],
          ),
        ),
      ),
      body: _selectedPage, // display the selected page in the body
    );
  }
}
