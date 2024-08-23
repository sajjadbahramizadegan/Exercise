
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled2/login_route.dart';
import 'package:untitled2/models/cards_mainRoute.dart';
import 'package:untitled2/splashScreen_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      return Color.fromARGB(100, 25, 26, 28);
    }
    PreferredSize _appBar() {


    return PreferredSize(preferredSize: Size.fromHeight(200),
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
                      color: Colors.white, fontSize: 24, fontFamily: GoogleFonts.lexend().fontFamily))),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 1,right: 1),
                    child: IconButton(
                      icon: Image.asset('images/arrow-swap.png',height: 25,width: 30,),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 1,right: 1),
                    child: IconButton(
                      icon:Image.asset('images/ic_menu.png'),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 1,right: 1),
                    child: IconButton(
                      icon:Image.asset('images/setting.png',width: 50,height: 50),
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
                          fontSize: 14),
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
          fontSize: 16,
          color: Color.fromARGB(100, 51, 139, 227),
          fontFamily: GoogleFonts.lexend().fontFamily,
        ),
      );
    }
  }




   class fragment_All extends StatefulWidget {
   @override
   State<fragment_All> createState() => _fragment_AllState();
   }

   class _fragment_AllState extends State<fragment_All> {


     List<String> listItems = ["English Learning","UI Kit Today","Morning Run","Buy Food"];
     List<bool> isSelected = [false,false,true,false];
     GroupController controller = GroupController();
     List<Widget> ic_chk = [Image.asset('images/checkbox_notchecked.png'),
       Image.asset('images/checkbox_notchecked.png'),
       Image.asset('images/checkbox_notchecked.png'),
       Image.asset('images/checkbox_notchecked.png'),
      ];







      @override
     Widget build(BuildContext context) {
       return  Scaffold(

         backgroundColor: Color.fromARGB(100, 25, 26, 28),
         body:MasonryGridView.builder(
             crossAxisSpacing: 3,
             mainAxisSpacing: 3,
             itemCount: 4,
             gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2),
              itemBuilder: (context, index) {

               switch(index){
                 case 0 :
                   return cardCreatorType1();
                   break;
                 case 1 :
                   return cardCreatorType3();
                   break;
                 case 2 :
                   return cardCreatorType1();
                   break;
                 case 3 :
                   return cardCreatorType2();
                   break;
                   default: return cardCreatorType1();
               }
             }


         ),


       );
     }
     Widget  cardCreatorType1() {
       return Container(
         margin: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 4),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
             color: Color.fromARGB(100, 50, 53, 56)),
         child: Column(

             children: [

               _cardHeader(),


               ListView.builder(
                 shrinkWrap: true,
                 itemCount: listItems.length,
                 itemBuilder: (BuildContext context, int index) {
                   return Container(
                     alignment: Alignment.centerLeft,
                     padding: EdgeInsets.zero,
                     margin: EdgeInsets.only(top: 8,left: 8,right: 8),
                     height: 27,
                       decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(15),
                           color: Color.fromARGB(100, 50, 53, 56),
                       ),
                       child: Row(
                         children: [
                           IconButton(
                             onPressed: (){
                             setState(() {
                               if(isSelected[index]){
                                 isSelected[index] = false;
                                 ic_chk[index] = Image.asset('images/checkbox_notchecked.png');
                               }else if(!isSelected[index]){
                                 isSelected[index] = true;
                                 ic_chk[index] = Image.asset('images/checkbox_checked.png');

                               }
                             });
                             },
                               constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                                icon: ic_chk[index],),


                           Text(listItems[index],
                             style:TextStyle(
                               color: Colors.white,
                               fontSize: 12
                             ),)
                         ],

                       ),


                   );
                 },

               ),


               Container(
                 margin: EdgeInsets.only(left: 10, bottom: 0, top: 0),

                 child: Row(
                   children: [
                     Text("Fri, 23Feb", style: TextStyle(
                         color: Colors.grey, fontFamily: GoogleFonts
                         .lexend()
                         .fontFamily, fontSize: 10)),
                     IconButton(
                         onPressed: () {}, icon: Image.asset('images/pin.png'))
                   ],
                 ),
               ),


             ]
         ),
       );
     }
     Widget cardCreatorType2() {
       return Container(

         margin: EdgeInsets.all(8),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(18),
             color: Color.fromARGB(100, 50, 53, 56)),
         child: Column(

             children: [




                 Image.asset('images/img_header.png',width: double.maxFinite,fit: BoxFit.fill,),



               _cardHeader(),

               Container(
                 padding: EdgeInsets.only(
                     left: 10, right: 10, top: 10, bottom: 0),
                 child: Text(
                   "Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to de...",
                   textAlign: TextAlign.left,
                   style: TextStyle(
                       fontFamily: GoogleFonts
                           .lexend()
                           .fontFamily,
                       color: Colors.grey,
                       fontSize: 12
                   ),),
               ),

               Row(
                 children: [
                   Container(
                     alignment: Alignment.centerLeft,
                     margin: EdgeInsets.only(top: 0, bottom: 0, left: 10,right: 0),
                     child: Text("Fri, 23Feb",
                       textAlign: TextAlign.left,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: GoogleFonts
                               .lexend()
                               .fontFamily,
                           color: Colors.grey
                       ),

                     ),
                   ),

                   IconButton(
                     padding: EdgeInsets.all(5),
                     constraints: BoxConstraints(),
                     icon: Image.asset('images/ic_voice.png',fit: BoxFit.fill,),
                     onPressed: () {},

                   ),

                   IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(5),
                        icon: Image.asset('images/ic_three.png',fit: BoxFit.fill,),
                        onPressed: () {},

                      ),



                 ],
               )


             ]
         ),
       );
     }
     Widget cardCreatorType3() {
       return Container(

         margin: EdgeInsets.all(8),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(18),
             color: Color.fromARGB(100, 50, 53, 56)),
         child: Column(

             children: [



            _cardHeader(),

               Container(
                 padding: EdgeInsets.only(
                     left: 10, right: 10, top: 10, bottom: 0),
                 child: Text(
                   "Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form commonly used...",
                   textAlign: TextAlign.left,
                   style: TextStyle(
                       fontFamily: GoogleFonts
                           .lexend()
                           .fontFamily,
                       color: Colors.grey,
                       fontSize: 12
                   ),),
               ),

               Row(
                 children: <Widget>[
                   Container(
                     alignment: Alignment.centerLeft,
                     margin: EdgeInsets.only(top: 0, bottom: 0, left: 10),
                     child: Text("Fri, 23Feb",
                       textAlign: TextAlign.left,
                       style: TextStyle(
                           fontSize: 10,
                           fontFamily: GoogleFonts
                               .lexend()
                               .fontFamily,
                           color: Colors.grey
                       ),

                     ),
                   ),

                   IconButton(
                     icon: Image.asset('images/ic_three.png'),
                     onPressed: () {},

                   ),


                     IconButton(
                       icon: Image.asset('images/pin.png'),
                       onPressed: () {},

                     ),



                 ],
               )


             ]
         ),
       );
     }
     Widget _cardHeader(){
       return Column(
         children: [
           Container(padding: const EdgeInsets.only(left: 10, top: 7),
             child: Row(
               children: <Widget>[

                 Container(
                   constraints: BoxConstraints(),
                   padding: EdgeInsets.zero,
                   child: Text(
                     "Today Work", style: TextStyle(color: Colors.white,
                       fontSize: 14,
                       fontFamily: GoogleFonts
                           .lexend()
                           .fontFamily,
                       ),
                   ),
                   margin: EdgeInsets.only(right: 20),
                 ),

                 IconButton(icon: Image.asset('images/flag.png', color: Colors.white),
                   onPressed: () {},)

               ],
             ),
           ),


           Container(padding: EdgeInsets.only(left: 10,top: 0),margin: EdgeInsets.only(bottom: 7,top: 0),
             constraints: BoxConstraints(),
             child: Row(
               children: [

                 Container(
                     margin: EdgeInsets.only(left: 0, right: 8),
                     child: Image.asset(
                       'images/arrow.png', width: 12, height: 12,)

                 ),

                 Text("folder 2", style: TextStyle(
                     color: Colors.orange, fontFamily: GoogleFonts
                     .lexend()
                     .fontFamily, fontSize: 10),)
               ],
             ),),


         ],
       );
     }
   }


   class fragment_Folder extends StatefulWidget {
   @override
   State<fragment_Folder> createState() => _fragment_FolderState();
   }

   class _fragment_FolderState extends State<fragment_Folder> {
   @override
   Widget build(BuildContext context) {
   return Scaffold(

   );
   }
   }



