class LoginModel {
  bool? success;
  User? user;
  String? accessToken;
  String? role;
  String? message;

  LoginModel(
      {this.success, this.user, this.accessToken, this.role, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    role = json['role'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['role'] = this.role;
    data['message'] = this.message;
    return data;
  }
}

class User {
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
  Null? gender;
  String? otpCreatedAt;
  int? loginAt;
  String? percentage;
  String? uid;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
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
        this.uid,
        this.status,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    uid = json['uid'];
    status = json['status'];
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
    data['uid'] = this.uid;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
