import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/meal_details_model.dart';
import 'package:food/provider/details_provider.dart';
import 'package:food/uitils/const_color.dart';
import 'package:food/uitils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final String name;

  DetailsPage(this.name);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isLoading = true;
  MealDetailsModel model;

  @override
  void initState() {
    super.initState();
    final payment = Provider.of<MealsDetailsProvider>(context, listen: false);
    payment.callAPIForMealDetailsData(widget.name).then((bool value) {
      if (value) {
        setState(() {
          model = payment.getMealModelDetailsData;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: SizeConfig.heightScreenSize/3.2,
              floating: false,

              backgroundColor: PrimaryDarkColor,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(_isLoading ? '' : model.meals[0]['strMeal'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: _isLoading
                      ? Container()
                      : Image.network(
                          model.meals[0]['strMealThumb'],
                          fit: BoxFit.cover,
                        )),
            ),
          ];
        },
        body: ListView(

          children: <Widget>[
            _isLoading
                ? LinearProgressIndicator(backgroundColor: PrimaryDarkColor)
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: SizeConfig.widthScreenSize / 2.5,
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                  margin: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.grey[200]),
                    borderRadius: BorderRadius.all(
                        Radius.circular(2 * SizeConfig.heightMultiplier)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Category',
                        style: TextStyle(fontSize: 18, color: AccentColor),
                      ),
                      Text(
                        _isLoading ? '' : model.meals[0]['strCategory'],
                        style: TextStyle(fontSize: 18, color: AccentColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.widthScreenSize / 2.5,
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                  margin: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.grey[200]),
                    borderRadius: BorderRadius.all(
                        Radius.circular(2 * SizeConfig.heightMultiplier)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Area',
                        style: TextStyle(fontSize: 18, color: AccentColor),
                      ),
                      Text(
                        _isLoading ? '' : model.meals[0]['strArea'],
                        style: TextStyle(fontSize: 18, color: AccentColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Instructions',
                    style: TextStyle(
                        color: AccentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.info,
                    color: AccentColor,
                    size: SizeConfig.heightMultiplier * 4,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
              margin: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.grey[200]),
                borderRadius: BorderRadius.all(
                    Radius.circular(2 * SizeConfig.heightMultiplier)),
              ),
              child: Expanded(
                  child: Text(
                      _isLoading ? '' : model.meals[0]['strInstructions'])),
            ),
            Container(
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
              margin: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.grey[200]),
                borderRadius: BorderRadius.all(
                    Radius.circular(2 * SizeConfig.heightMultiplier)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                    margin: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(fontSize: 18, color: AccentColor),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                    margin: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          _isLoading
                              ? ''
                              : "\n \u2022" +
                                      model.meals[0]['strIngredient1'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient2'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient3'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient4'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient5'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient6'] +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient7'] ??
                                  "" +
                                      "\n \u2022" +
                                      model.meals[0]['strIngredient8'] ??
                                  "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _isLoading
                              ? ''
                              : "\n " +
                                      model.meals[0]['strMeasure1'] +
                                      "\n " +
                                      model.meals[0]['strMeasure2'] +
                                      "\n " +
                                      model.meals[0]['strMeasure3'] +
                                      "\n " +
                                      model.meals[0]['strMeasure4'] +
                                      "\n " +
                                      model.meals[0]['strMeasure5'] +
                                      "\n " +
                                      model.meals[0]['strMeasure6'] +
                                      "\n " +
                                      model.meals[0]['strMeasure7'] ??
                                  "" + "\n " + model.meals[0]['strMeasure8'] ??
                                  "",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xEAFFE1E1),
                        ),
                      ),
                      color: Color(0xEAFFE1E1),
                      onPressed: () {
                       _isLoading?null:_launchURL(model.meals[0]['strYoutube']);
                      },
                      icon: Icon(
                        Icons.play_circle_filled,
                        color: Colors.red,
                      ),
                      label: Text('YouTube')),
               /*   RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xEAD0FFDB),
                        ),
                      ),
                      color: Color(0xEAD0FFDB),
                      onPressed: () {},
                      icon: Icon(
                        Icons.link,
                        color: Colors.green,
                      ),
                      label: Text('Source')),*/
                ],
              ),
            ),
          ],

          //Text("\n \u2022Sample Text"),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    //launch(url);
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
