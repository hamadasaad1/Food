import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/meals_model.dart';
import 'package:food/provider/meals_provider.dart';
import 'package:food/uitils/change_route.dart';
import 'package:food/uitils/const_color.dart';
import 'package:food/uitils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'connectivity_ui.dart';
import 'detials_page.dart';

class DetailsBody extends StatelessWidget {
  final String name;
  final String strCategoryDescription;
  final String strCategoryImage;

  DetailsBody(this.name, this.strCategoryDescription, this.strCategoryImage);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    final payment = Provider.of<MealsProvider>(context, listen: false);
    payment.callAPIForMealData(name);
    _context = context;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
          margin: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
          decoration: BoxDecoration(
            color: PrimaryColor,
            border: Border.all(width: 2.0, color: PrimaryColor),
            borderRadius: BorderRadius.all(
                Radius.circular(2 * SizeConfig.heightMultiplier)),
          ),
          child: InkWell(
            onTap: () {
              _buildDialog(context, name, strCategoryDescription);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(
                  strCategoryImage,
                  width: SizeConfig.heightMultiplier * 15,
                  height: SizeConfig.heightMultiplier * 15,
                  fit: BoxFit.fill,
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 10,
                  width: SizeConfig.heightMultiplier * 10,
                  child: Expanded(
                      child: Text(
                    strCategoryDescription,
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: NetworkSensitive(
            opacity: .9,
            child: _buildContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Container(child: Consumer<MealsProvider>(
      builder: (_, pragma, __) {
        Widget content = Center(
            child: Text(pragma.errorMessage != null
                ? pragma.errorMessage
                : "No Data for you"));
        if (!pragma.isLoading) {
          content = _buildListCard(pragma.getMealModelData);
        } else if (!pragma.isLoading && pragma.getMealModelData.meals == null) {
          content = Center(
              child: Text(pragma.errorMessage != null
                  ? pragma.errorMessage
                  : "No Data for you"));
        } else
          content = Center(child: CircularProgressIndicator());

        return content;
      },
    ));
  }

  Widget _buildListCard(MealModel model) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        model.meals.length,
        (index) {
          return _buildItem(model.meals[index], index);
        },
      ),
    );
  }

  Widget _buildItem(Meal mealModel, int index) {
    return Container(
        padding: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
        margin: EdgeInsets.all(SizeConfig.heightMultiplier * .5),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.grey[200]),
          borderRadius: BorderRadius.all(
              Radius.circular(2 * SizeConfig.heightMultiplier)),
        ),
        child: InkWell(
          onTap: () {
            print("Name" + mealModel.strMeal);
            changeScreen(_context,
                DetailsPage(mealModel.strMeal));
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                  mealModel.strMealThumb,
                  width: SizeConfig.heightMultiplier * 15,
                  height: SizeConfig.heightMultiplier * 15,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(mealModel.strMeal),
                ),
              )
            ],
          ),
        ));
  }

  void _buildDialog(BuildContext context, String name, String desc) {
    Alert(
      context: context,
      style: AlertStyle(
        animationType: AnimationType.fromRight,
        isCloseButton: true,
        isOverlayTapDismiss: true,
        descStyle: TextStyle(fontSize: 15),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.heightMultiplier * 2),
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
      title: name,
      desc: desc,
    ).show();
  }
}
