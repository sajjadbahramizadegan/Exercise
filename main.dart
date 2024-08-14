import 'package:flutter/material.dart';
import 'package:untitled2/login_route.dart';
import 'package:untitled2/splashScreen_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'dart:ui';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MaterialApp(home: splash_route(),debugShowCheckedModeBanner: false,));

}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  
  static TabController? tabController;
  TextEditingController inputTextAppBar = new TextEditingController();
  


  @override
  void initState() {
    // TODO: implement initState






    super.initState();
  }


  @override
  void dispose() {
    super.dispose();

    tabController?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
        return FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context , snapshot){
              if(snapshot.hasData){

                SharedPreferences preferences = snapshot.data!;

                bool? islogged = preferences.getBool('isLogged') ?? false;
                if(islogged){
                   return mainWrapper();
                }else{
                   return login_route();
                }
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        );



    }



    Widget mainWrapper(){
      return DefaultTabController(

        length: 2,
        child: Scaffold(
          backgroundColor: bgColor(),


          appBar: _appBar(),


          body: TabBarView(
            controller: tabController,
            children: [
              fragment_All(),
              fragment_Folder(),
            ],
          ),

        ),

      );
    }


    Color bgColor() {
      return Color.fromARGB(100, 30, 33, 36);
    }
    PreferredSize _appBar() {
      return PreferredSize(preferredSize: Size.fromHeight(175),
        child: Container(
          margin: EdgeInsets.only(top: 20,),
          color: bgColor(),
          // decoration: _boxDecoration(),
          child: Column(
            children: [
              SizedBox(height: 5,),
              _topBar(),
              _searchBar(),

              _bottomAppBar()

            ],
          ),
        ),
      );
    }
    Widget _topBar() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(margin: EdgeInsets.only(left: 12,),
                  child: Text("Cold NOTE", style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: GoogleFonts.lexend()
                      .fontFamily))),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.compare_arrows,
                        size: 40,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 40,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),

                ],
              )),

            ],
          ),

        ],
      );
    }
    Widget _searchBar() {
      return Row(
        children: [
          Expanded(
              child: Container(
                margin:
                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: TextField(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                  fontFamily: GoogleFonts.lexend().fontFamily),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(100, 200, 200, 200),
                          fontSize: 16),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(
                            top: 3, bottom: 3, left: 0, right: 0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(100, 80, 80, 80),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ))
        ],
      );
    }
    Widget _bottomAppBar() {
      return TabBar(
        controller: tabController,
        labelColor: Colors.blueAccent,
        dividerColor: bgColor(),
        indicatorColor: Colors.blueAccent,
        tabs: [
          Tab(
            text: "All",
          ),
          Tab(text: "Folder"),
        ],
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.blueAccent,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }




   class fragment_All extends StatefulWidget {
   @override
   State<fragment_All> createState() => _fragment_AllState();
   }

   class _fragment_AllState extends State<fragment_All> {

     GroupController controller = GroupController();

     bool value = false;


     @override
     Widget build(BuildContext context) {
       return Scaffold(
           backgroundColor: Color.fromARGB(100, 50, 53, 56),
           body: MasonryGridView.builder(itemCount: 6,
             gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2), itemBuilder: (context, index) =>
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(18),
                         border: Border.all(color: Colors.black12),
                         color: Color.fromARGB(100, 70, 70, 70)),


                     // height: 200,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(

                           children: [

                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Text(
                                   "Today Work", style: TextStyle(color: Colors
                                     .white, fontSize: 15),),
                                 Expanded(child: Icon(
                                   Icons.flag_outlined, color: Colors.white,)),
                               ],
                             ),

                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [


                                 Transform.rotate(angle: 180 * pi / 180,
                                     child: Icon(
                                       Icons.turn_slight_left, color: Colors
                                         .white,)),

                                 Padding(
                                   padding: EdgeInsets.only(top: 5, left: 10),
                                   child: Text("folder 2", style: TextStyle(
                                       color: Colors.yellowAccent),),)
                               ],
                             ),



                             // ...notifications.map(BuildingSingleCheckBox).toList()


                           ]
                       ),
                     ),
                   ),

                 ),


           ));
     }

     Widget _buildCard() =>
         Card(
           margin: EdgeInsets.zero,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8)),
           child: Container(
             margin: EdgeInsets.all(8),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(8),
               child: ListView.builder(itemBuilder: (context, index) {

               },),
             ),
           ),
         );


// Widget BuildingSingleCheckBox(NotificationSetting notification) => customcheckbox(
//   notification: notification,
//   onClicked: () {setState(() {
//     final newvalue = !notification.value;
//     notification.value = newvalue;
//   });}
// );
//
// Widget customcheckbox({required VoidCallback onClicked,required NotificationSetting notification }) =>ListTile(
//
//   onTap: onClicked,
//   leading: Checkbox(
//     value: value,
//     onChanged: (value) => onClicked),title: Text(
//  notification.title,
//    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
// ),);
//
//


   }

   class fragment_Folder extends StatefulWidget {
   @override
   State<fragment_Folder> createState() => _fragment_FolderState();
   }

   class _fragment_FolderState extends State<fragment_Folder> {
   @override
   Widget build(BuildContext context) {
   return Scaffold(
   backgroundColor: Color.fromARGB(100, 50, 53, 56),
   body: Text(""),
   );
   }
   }



