class NoticeModel {
  int? id;
  String? name;
  String? noticeFor;
  String? createdAt;
  String? updatedAt;

  NoticeModel(
      {this.id, this.name, this.noticeFor, this.createdAt, this.updatedAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noticeFor = json['notice_for'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['notice_for'] = this.noticeFor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
