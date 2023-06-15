class NewsModel {
  String? code;
  String? message;
  static var dataList = <Data>[];

  NewsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      dataList.add(item);
    });


  }

}

class Data {
  String? date;
  String? body;
  String? imageUrl;
  String? linkUrl;
  String? title;
  Data.fromJson({required Map<String, dynamic> json}) {
    date = json['date'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    title = json['title'];
  }
}
