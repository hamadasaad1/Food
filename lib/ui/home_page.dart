import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/model/categories_model.dart';
import 'package:food/provider/home_provider.dart';
import 'package:food/ui/meals_page.dart';
import 'package:food/ui/widget/connectivity_ui.dart';
import 'package:food/uitils/change_route.dart';
import 'package:food/uitils/const_color.dart';
import 'package:food/uitils/size_config.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final payment = Provider.of<HomeProvider>(context, listen: false);
    payment.callAPIForCategoriesData();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              color: PrimaryDarkColor,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier,
                  horizontal: SizeConfig.heightMultiplier * 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    Text(
                      "Food",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: SizeConfig.heightMultiplier * 6,
                      decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.heightMultiplier * 2)),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(
                            width: SizeConfig.heightMultiplier * 1,
                          ),
/*                            TextField(
                          style:
                              TextStyle(color: Colors.grey, fontSize: 19),
                        )*/
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.isPortrait
                          ? SizeConfig.heightMultiplier * 15
                          : SizeConfig.heightMultiplier * 10,
                    ),
                  ])),
          Container(
            margin: EdgeInsets.all(SizeConfig.heightMultiplier),
            padding: EdgeInsets.all(SizeConfig.heightMultiplier),
            child: Text(
              "Meal Categories",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: NetworkSensitive(
              opacity: .9,
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(child: Consumer<HomeProvider>(
      builder: (_, pragma, __) {
        Widget content = Center(
            child: Text(pragma.errorMessage != null
                ? pragma.errorMessage
                : "No Data for you"));
        if (!pragma.isLoading) {
          content = _buildListCard(pragma.getCategoriesModelData);
        } else if (!pragma.isLoading &&
            pragma.getCategoriesModelData.categories == null) {
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

  Widget _buildListCard(CategoriesModel model) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        model.categories.length,
        (index) {
          return _buildItem(model,model.categories[index],index);
        },
      ),
    );
  }

  Widget _buildList(CategoriesModel model) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildItem(model,model.categories[index],index);
          },
          itemCount: model.categories.length,
        ),
      ),
    );
  }

  Widget _buildItem(CategoriesModel model,Category categoryModel,int index) {
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
            print("Name" + categoryModel.strCategory);
            changeScreen(context, MealsPage(model,index));
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                  categoryModel.strCategoryThumb,
                  width: SizeConfig.heightMultiplier * 6,
                  height: SizeConfig.heightMultiplier * 6,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(categoryModel.strCategory),
                ),
              )
            ],
          ),
        ));
  }
}
