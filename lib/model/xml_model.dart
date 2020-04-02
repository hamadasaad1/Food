class TastModel {
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  DateTime date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  dynamic questionnaire;
  dynamic questExplanation;
  List<ReservType> reservTypes;
  dynamic questionnaireFields;
  List<dynamic> occasionAgenda;

  TastModel({
    this.id,
    this.title,
    this.img,
    this.interest,
    this.price,
    this.date,
    this.address,
    this.trainerName,
    this.trainerImg,
    this.trainerInfo,
    this.occasionDetail,
    this.latitude,
    this.longitude,
    this.isLiked,
    this.isSold,
    this.isPrivateEvent,
    this.hiddenCashPayment,
    this.specialForm,
    this.questionnaire,
    this.questExplanation,
    this.reservTypes,
    this.questionnaireFields,
    this.occasionAgenda,
  });

  factory TastModel.fromJson(Map<String, dynamic> json) => TastModel(
        id: json["id"],
        title: json["title"],
        img: List<String>.from(json["img"].map((x) => x)),
        interest: json["interest"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        address: json["address"],
        trainerName: json["trainerName"],
        trainerImg: json["trainerImg"],
        trainerInfo: json["trainerInfo"],
        occasionDetail: json["occasionDetail"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isLiked: json["isLiked"],
        isSold: json["isSold"],
        isPrivateEvent: json["isPrivateEvent"],
        hiddenCashPayment: json["hiddenCashPayment"],
        specialForm: json["specialForm"],
        questionnaire: json["questionnaire"],
        questExplanation: json["questExplanation"],
        reservTypes: List<ReservType>.from(
            json["reservTypes"].map((x) => ReservType.fromJson(x))),
        questionnaireFields: json["questionnaireFields"],
        occasionAgenda:
            List<dynamic>.from(json["occasionAgenda"].map((x) => x)),
      );
}

class ReservType {
  int id;
  String name;
  int count;
  int price;

  ReservType({
    this.id,
    this.name,
    this.count,
    this.price,
  });

  factory ReservType.fromJson(Map<String, dynamic> json) => ReservType(
        id: json["id"],
        name: json["name"],
        count: json["count"],
        price: json["price"],
      );
}
