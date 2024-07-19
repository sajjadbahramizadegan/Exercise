import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const MaterialApp(home: loginActivity(),));
}
class loginActivity extends StatefulWidget {
  const loginActivity({super.key});



  @override
  State<loginActivity> createState() => _loginActivityState();
}







class _loginActivityState extends State<loginActivity> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

      //background color Activity
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),

      appBar: AppBar(

        backgroundColor: Color.fromRGBO(7, 7, 7, 1),
        foregroundColor: Colors.grey,
        leading: IconButton(
          icon : Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){},
          padding:EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          hoverColor: Color.fromRGBO(32, 32, 32,1),),
        surfaceTintColor:Color.fromRGBO(32, 32, 32,1),
      ),


      body:SingleChildScrollView(child: Center(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
           child:Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children:
        [

          //txtLog in to Scale
          Container(
            child:Text("Log in to Scale",textAlign: TextAlign.left,style: TextStyle(color: Color(0Xffffffff),fontSize: 50),),
            margin: EdgeInsets.symmetric(vertical: 15,horizontal: 0),

         ),

          //txtEmail
          Container(
             child: Text("Email",style: TextStyle(color: Colors.white,fontSize: 20)),
             margin: EdgeInsets.only(top: 20,right: 0,left: 0,bottom: 0),


         ),

          //Input Email
          Container(margin: EdgeInsets.only(bottom:30,left: 0,right: 0,top: 0),
            child:TextField(
              style: TextStyle(color: Colors.white),

              //Text Decoration
              decoration: InputDecoration(
              labelStyle:const TextStyle(fontFamily: 'monospace'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:15),
              fillColor: Color.fromRGBO(7, 7, 7, 1),
              filled: true,
              hintText: "hello@company.com",
              hintStyle: TextStyle(color: Colors.grey),
              //border: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white) )

            ),

            ),
          ),

          //txtPassword
          Container(
            child:  Text("Password",style: TextStyle(color: Colors.white,fontSize: 20,),),
              margin: EdgeInsets.only(top: 0,right: 0,left: 0,bottom: 0),


              ),

          //Input password
          Container(margin: EdgeInsets.only(bottom: 40,left: 0,right: 0,top: 0),
            child: TextField(

                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,

                //Text Decoration
                decoration: InputDecoration(

                  suffix: Icon(Icons.remove_red_eye,color: Colors.white,),
                  labelStyle:  TextStyle(fontFamily: 'monospace'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  fillColor: Color.fromARGB(7, 7, 7, 1),
                  filled: true,
                  hintText: "Your password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white)),



                ),



              ),
          ),

          //txtButton_ForgotPass
          Container(
            margin: EdgeInsets.only(top: 0,right: 0,left: 0,bottom: 20),
            child:TextButton(
              onPressed: (){},
              child: Text("Forgot Password?",style:TextStyle(
                color: Colors.green,fontSize: 20),),)

        ,),


          //btnLogin
          Container(
            alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20,left: 0,right: 0,top: 0),

              child: SizedBox(width: double.infinity,height:60,
                child: ElevatedButton(
                onPressed: (){},
                child: Text("Login",),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.only(top: 20,right: 150,left: 150,bottom: 20),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8),side: BorderSide(color: Colors.white)),
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20,decoration: TextDecoration.none),

                ),



            ),
              ),
          ),


          //Divider
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey,)),
              Container(margin: EdgeInsets.all(3),child: Text("OR",style: TextStyle(color: Colors.grey),))
             ,
              Expanded(child: Divider(color: Colors.grey,)),
            ],
          ),

          //Btn_Apple
          Container(
            margin: EdgeInsets.only(bottom: 20,top: 20,left: 0,right: 0),
            child:  ElevatedButton(
              onPressed: (){},
              child: Text("Continue With Apple"),
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              minimumSize: Size(double.infinity, 60),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color : Colors.white,)),

              ),


                   ),
            ),

          //Btn_Google
          Container(
            margin: EdgeInsets.only(bottom: 20,top: 0,left: 0,right: 0),
            child:  ElevatedButton.icon(
              onPressed: (){},
              //icon : new Image.asset('assetfolder/icon-google.png'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                minimumSize: Size(double.infinity, 60),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color : Colors.white,)),

              ), label: Text("Continue With Google"),
            ),
          ),




          //TextEndActicity
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
            child: Text("Scale uses cookies for analytcs personalized\n"
              "content and ads. By using Scale's servies you\n agree to this use of cookies.Learn more ",style: TextStyle(
              color:Colors.grey
            ),),
          )

        ],//children
      ),
      ),
      ),

      ),




    ),
    );

  }





}


