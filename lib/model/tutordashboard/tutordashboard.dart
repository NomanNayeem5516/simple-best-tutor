class tutordashboardModel {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? mobile;
  String? isTutor;
  String? isGuardian;
  String? isAdmin;
  String? isSuperAdmin;
  String? verify;
  Null? otp;
  String? image;
  String? gender;
  String? otpCreatedAt;
  String? loginAt;
  String? percentage;
  String? smsSwitch;
  String? uid;
  String? status;
  Null? smsCount;
  String? emergencyTuition;
  String? createdAt;
  String? updatedAt;

  tutordashboardModel(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.mobile,
        this.isTutor,
        this.isGuardian,
        this.isAdmin,
        this.isSuperAdmin,
        this.verify,
        this.otp,
        this.image,
        this.gender,
        this.otpCreatedAt,
        this.loginAt,
        this.percentage,
        this.smsSwitch,
        this.uid,
        this.status,
        this.smsCount,
        this.emergencyTuition,
        this.createdAt,
        this.updatedAt});

  tutordashboardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    isTutor = json['isTutor'];
    isGuardian = json['isGuardian'];
    isAdmin = json['isAdmin'];
    isSuperAdmin = json['isSuperAdmin'];
    verify = json['verify'];
    otp = json['otp'];
    image = json['image'];
    gender = json['gender'];
    otpCreatedAt = json['otp_created_at'];
    loginAt = json['login_at'];
    percentage = json['Percentage'];
    smsSwitch = json['sms_switch'];
    uid = json['uid'];
    status = json['status'];
    smsCount = json['sms_count'];
    emergencyTuition = json['emergency_tuition'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile'] = this.mobile;
    data['isTutor'] = this.isTutor;
    data['isGuardian'] = this.isGuardian;
    data['isAdmin'] = this.isAdmin;
    data['isSuperAdmin'] = this.isSuperAdmin;
    data['verify'] = this.verify;
    data['otp'] = this.otp;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['otp_created_at'] = this.otpCreatedAt;
    data['login_at'] = this.loginAt;
    data['Percentage'] = this.percentage;
    data['sms_switch'] = this.smsSwitch;
    data['uid'] = this.uid;
    data['status'] = this.status;
    data['sms_count'] = this.smsCount;
    data['emergency_tuition'] = this.emergencyTuition;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
