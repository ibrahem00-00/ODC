class SectionsModel {
  String? code;
  String? message;
  static var dataList = <Data>[];

  SectionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      Data item = Data.fromJson(json: element);
      dataList.add(item);
    });
  }

}

class Data {
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;
  Data.fromJson({required Map<String, dynamic> json}) {
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }
}

