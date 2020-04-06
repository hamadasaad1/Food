class MealDetailsModel {
  List<Map<String, String>> meals;

  MealDetailsModel({
    this.meals,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) =>
      MealDetailsModel(
        meals: List<Map<String, String>>.from(json["meals"].map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
      );
}
