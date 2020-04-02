import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food/model/xml_model.dart';
import 'package:food/uitils/const_color.dart';
import 'package:food/uitils/size_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeTaskPage extends StatefulWidget {
  @override
  _HomeTaskPageState createState() => _HomeTaskPageState();
}

class _HomeTaskPageState extends State<HomeTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _buildMain(),
      ),
    );
  }

  Widget _builImageSwaper(TastModel model) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: SizeConfig.widthScreenSize,
              height: SizeConfig.heightScreenSize / 2.5,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    model.img[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: model.img.length,
                pagination:
                    new SwiperPagination(builder: SwiperPagination.dots),
                control: new SwiperControl(),
              ),
            ),
            Positioned(
              top: SizeConfig.heightMultiplier * 6.5,
              //left: SizeConfig.heightMultiplier * 2,
              child: Container(
                margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      model.isLiked ? Icons.star : Icons.star_border,
                      size: SizeConfig.heightMultiplier * 5,
                      color: Colors.deepPurple[300],
                    ),
                    Icon(
                      model.isSold ? Icons.share : Icons.share,
                      size: SizeConfig.heightMultiplier * 5,
                      color: Colors.deepPurple[300],
                    ),
                  ],
                ),
              ),
            ),
/*            Positioned(
              top: SizeConfig.heightMultiplier * 6.5,
              right: SizeConfig.heightMultiplier * 2,
              child: Container(
                margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
                child: Icon(
                  model.isSold ? Icons.place : Icons.place,
                  size: SizeConfig.heightMultiplier * 4,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),*/
          ],
        ),
        _buildInterest(model.interest),
        _buildTitle(model.title),
        _buildPrice(model.price.toString()),
        _buildDate(model.date.toString()),
        _buildAddress(model.address),
        Container(
          width: SizeConfig.widthScreenSize,
          height: .5,
          color: AccentColor,
        ),
        _buildProfileImage(model),
        _buildTranging(model.trainerInfo),
        Container(
          width: SizeConfig.widthScreenSize,
          height: .5,
          color: AccentColor,
        ),
        _buildDetails(),
        _buildDetail(model.occasionDetail),
        _buildBookedBottom(model)
      ],
    );
  }

  Widget _buildProfileImage(TastModel model) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
          width: SizeConfig.heightMultiplier * 10,
          height: SizeConfig.heightMultiplier * 10,
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
          child: Image.network(
            model.trainerImg,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: PrimaryColor,
              width: SizeConfig.heightMultiplier * .5,
            ),
          ),
        ),
        Container(
          child: Text(
            model.trainerName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buildTranging(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInterest(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '#  ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }

  Widget _buildPrice(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.monetization_on),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }

  Widget _buildDate(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.date_range),
          Expanded(
              child: Text(
                  title.substring(0, 11) + "  " + title.substring(11, 16))),
        ],
      ),
    );
  }

  Widget _buildAddress(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.place),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }

  Widget _buildBookedBottom(TastModel model) {
    return InkWell(
      onTap: () {
        //  _buildDialog(model);
      },
      child: Container(
        width: SizeConfig.widthScreenSize,
        margin: EdgeInsets.all(SizeConfig.heightMultiplier),
        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
        child: Center(
            child: Text(
          'Booking',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.heightMultiplier * 2)),
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'About Training ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(""),
          )
        ],
      ),
    );
  }

  Widget _buildDetail(String title) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier),
      margin: EdgeInsets.all(SizeConfig.heightMultiplier * .2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(title),
          )
        ],
      ),
    );
  }

  Widget _buildMain() {
    return Container(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/xml.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            TastModel model =
                new TastModel.fromJson(json.decode(snapshot.data));
            print(model.title);
            return _builImageSwaper(model);
          }
        },
      ),
    );
  }

  void _buildDialog(TastModel model) {
    Alert(
        context: context,
        style: AlertStyle(
          animationType: AnimationType.fromRight,
          isCloseButton: true,
          isOverlayTapDismiss: true,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.heightMultiplier * 2),
            side: BorderSide(
              color: PrimaryDarkColor,
            ),
          ),
          titleStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
          ),
          //backgroundColor: PrimaryLightColor
        ),
        type: AlertType.none,
        title: "Trainer",
        content: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(SizeConfig.heightMultiplier),
              child: Text(
                "Trainer Name : ${model.trainerName}",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.all(SizeConfig.heightMultiplier),
                child: Image.network(
                  model.trainerImg,
                  fit: BoxFit.fill,
                )),
            Container(
              margin: EdgeInsets.all(SizeConfig.heightMultiplier),
              child: Text(
                "Trainer Info : ${model.trainerInfo}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        )).show();
  }
}
