// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, await_only_futures
import 'package:flutter/material.dart';
import 'package:myapi/data.dart';
import 'package:myapi/page/AddNote.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:superellipse_shape/superellipse_shape.dart';
import 'package:provider/provider.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'updatenote.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String ?indexst;
class _HomePageState extends State<HomePage> {
  String changedate(String  n){
    String s="";
    for(var i in n.characters){
      if (i=="-") {
        s=s+"/";
      }else{
        s=s+i;
      }
    }
    return s;
  }
  Future fetchdata() async{
    await context.read<texti>().gettitle; 
  }
  
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<texti>().gettitle();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(context.watch<texti>().st.isNotEmpty){
      int i=1;
      while( i<context.watch<texti>().st.length){
          context.watch<texti>().st[i]["created"]=changedate(context.watch<texti>().st[i]["created"]??"");
          i=i+1;
      }
    }
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
       final  result= await showDialog<bool>(context: context, builder:(context) {
          return AddNote();
        },);
        if (result == true) {
    // Refresh the state if the result is true
     setState(() {
      context.read<texti>().gettitle();
    });
  }
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          context.read<texti>().gettitle();
        },
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              ),
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),child:Image.asset('images/image.png',fit: BoxFit.cover,) ),
                  Positioned(top: 10,  child: SizedBox(height: 220,
              width: MediaQuery.of(context).size.width,child: Text('Hello You Have ${context.watch<texti>().st.length} Tasks in this month',style: TextStyle(color: Colors.cyan,fontSize: 32,fontWeight: FontWeight.w600,letterSpacing: 1),textAlign: TextAlign.start)))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text('Tasks',style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: context.watch<texti>().st.length,
              itemBuilder:(context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async{
                        final re=await Navigator.of(context).push(PageAnimationTransition(
                          page: updatenote(st: index), pageAnimationType: ScaleAnimationTransition()));
                          if (re==true){
                              context.read<texti>().gettitle();
                          }
                      },
                    child: Slidable(
                      key: const ValueKey(1),
                      endActionPane: ActionPane(
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed:(i) async{
                            int s=context.read<texti>().st[index]['id'] ;
                               await deletenot(s);
                              context.read<texti>().gettitle();
                              
                            
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          )
                        ],
                      ),
                      child: Material(
                        shape: SuperellipseShape(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        color: Colors.black,
                        child:  Container(
                          width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(top:15.0,left: 25,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(context.watch<texti>().st[index]["title"],style: TextStyle(color: Colors.blue,),),
                                  SizedBox(height: 10,),
                                  Text(context.watch<texti>().st[index]["created"]??'',style: TextStyle(color: Colors.blue),)
                              ]),
                            ),
                          ),
                        ),
                    ),
                  ),
                  );
              },)
          ],
        ),
      ),
    );
  }
}