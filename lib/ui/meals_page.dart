import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/categories_model.dart';
import 'package:food/ui/widget/custom_tap.dart';
import 'package:food/ui/widget/meal_body.dart';
import 'package:food/uitils/const_color.dart';

class MealsPage extends StatefulWidget {
  final CategoriesModel model;
  final int position;

  MealsPage(this.model, this.position);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  int initPosition = 0;

  @override
  void initState() {
    initPosition = widget.position;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        backgroundColor: PrimaryDarkColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomTabView(
          initPosition: initPosition,
          itemCount: widget.model.categories.length,
          tabBuilder: (context, index) =>
              Tab(text: widget.model.categories[index].strCategory),
          pageBuilder: (context, index) => DetailsBody(
              widget.model.categories[index].strCategory,
              widget.model.categories[index].strCategoryDescription,
              widget.model.categories[index].strCategoryThumb),
          onPositionChange: (index) {
            print('current position: $index');
            initPosition = index;
          },
          onScroll: (position) => print('$position'),
        ),
      ),
    );
  }
}
