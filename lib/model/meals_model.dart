class MealModel {
  List<Meal> meals;

  MealModel({
    this.meals,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );
}
