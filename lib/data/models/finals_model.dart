class FinalsModel {
  String? code;
  String? message;
  static var dataList = <Data>[];

  FinalsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

      json['data'].forEach((element) {
        Data item = Data.fromJson(json: element);
          dataList.add(item);
      });


  }

}

class Data {
  String? examSubject;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  //bool? finals;
  Data.fromJson({required Map<String, dynamic> json}) {
    examSubject = json['examSubject'];
    examDate = json['examDate'];
    examStartTime = json['examStartTime'];
    examEndTime = json['examEndTime'];
    //finals =json['final'];
  }
}
