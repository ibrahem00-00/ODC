class LecturesModel {
  String? code;
  String? message;
  static var dataList = <Data>[];

  LecturesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
        dataList.add(item);
    });


  }

}

class Data {
  String? lectureSubject;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;
  Data.fromJson({required Map<String, dynamic> json}) {
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
  }
}