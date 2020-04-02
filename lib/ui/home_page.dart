import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/provider/home_provider.dart';
import 'package:food/uitils/const_color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final payment = Provider.of<HomeProvider>(context, listen: false);
    payment.callAPIForXmlData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
        drawer:
            Drawer(child: Container() // Populate the Drawer in the next step.
                ),
        body: SingleChildScrollView(
            child: Container(
                color: PrimaryDarkColor,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Food",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffEFEFEF),
                            borderRadius: BorderRadius.circular(14)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            TextField(

                              style:
                                  TextStyle(color: Colors.grey, fontSize: 19),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        /*  child: ListView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return CategorieTile(
                categorie: categories[index],
                isSelected: selectedCategorie == categories[index],
                context: this,
              );
            }),*/
                      ),
                    ]))));
  }

  Widget _buildTop() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Foods"),
          ],
        ),
      ),
    );
  }

  Widget _buildBotton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Foods"),
          ],
        ),
      ),
    );
  }
}
