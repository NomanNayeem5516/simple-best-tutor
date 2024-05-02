class tutorprofileModel {
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
  String? uid;
  String? status;
  Null? emergencyTuition;
  String? createdAt;
  String? updatedAt;
  AvailabilityInfo? availabilityInfo;
  Experience? experience;
  PrimaryInfo? primaryInfo;
  List<EmergencyInfo>? emergencyInfo;
  OtherInfo? otherInfo;

  tutorprofileModel(
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
        this.emergencyTuition,
        this.createdAt,
        this.updatedAt,
        this.availabilityInfo,
        this.experience,
        this.primaryInfo,
        this.emergencyInfo,
        this.otherInfo});

  tutorprofileModel.fromJson(Map<String, dynamic> json) {
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
    emergencyTuition = json['emergency_tuition'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    availabilityInfo = json['availability_info'] != null
        ? new AvailabilityInfo.fromJson(json['availability_info'])
        : null;
    experience = json['experience'] != null
        ? new Experience.fromJson(json['experience'])
        : null;
    primaryInfo = json['primary_info'] != null
        ? new PrimaryInfo.fromJson(json['primary_info'])
        : null;
    if (json['emergency_info'] != null) {
      emergencyInfo = <EmergencyInfo>[];
      json['emergency_info'].forEach((v) {
        emergencyInfo!.add(new EmergencyInfo.fromJson(v));
      });
    }
    otherInfo = json['other_info'] != null
        ? new OtherInfo.fromJson(json['other_info'])
        : null;
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
    data['emergency_tuition'] = this.emergencyTuition;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.availabilityInfo != null) {
      data['availability_info'] = this.availabilityInfo!.toJson();
    }
    if (this.experience != null) {
      data['experience'] = this.experience!.toJson();
    }
    if (this.primaryInfo != null) {
      data['primary_info'] = this.primaryInfo!.toJson();
    }
    if (this.emergencyInfo != null) {
      data['emergency_info'] =
          this.emergencyInfo!.map((v) => v.toJson()).toList();
    }
    if (this.otherInfo != null) {
      data['other_info'] = this.otherInfo!.toJson();
    }
    return data;
  }
}

class AvailabilityInfo {
  int? id;
  String? userId;
  String? dayId;
  String? fromTime;
  String? toTime;
  String? countryId;
  String? divisionId;
  String? districtId;
  String? areaId;
  String? relatedAreasIds;
  String? expectedSalary;
  String? tuitionTypeId;
  String? tutoringMethod;
  String? createdAt;
  String? updatedAt;

  AvailabilityInfo(
      {this.id,
        this.userId,
        this.dayId,
        this.fromTime,
        this.toTime,
        this.countryId,
        this.divisionId,
        this.districtId,
        this.areaId,
        this.relatedAreasIds,
        this.expectedSalary,
        this.tuitionTypeId,
        this.tutoringMethod,
        this.createdAt,
        this.updatedAt});

  AvailabilityInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dayId = json['day_id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    countryId = json['country_id'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    areaId = json['area_id'];
    relatedAreasIds = json['related_areas_ids'];
    expectedSalary = json['expected_salary'];
    tuitionTypeId = json['tuition_type_id'];
    tutoringMethod = json['tutoring_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['day_id'] = this.dayId;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['country_id'] = this.countryId;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['area_id'] = this.areaId;
    data['related_areas_ids'] = this.relatedAreasIds;
    data['expected_salary'] = this.expectedSalary;
    data['tuition_type_id'] = this.tuitionTypeId;
    data['tutoring_method'] = this.tutoringMethod;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Experience {
  int? id;
  String? userId;
  String? totalYear;
  String? totalMonth;
  String? details;
  String? createdAt;
  String? updatedAt;

  Experience(
      {this.id,
        this.userId,
        this.totalYear,
        this.totalMonth,
        this.details,
        this.createdAt,
        this.updatedAt});

  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalYear = json['total_year'];
    totalMonth = json['total_month'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['total_year'] = this.totalYear;
    data['total_month'] = this.totalMonth;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PrimaryInfo {
  int? id;
  String? userId;
  String? identityTypeId;
  String? identityNumber;
  String? religionId;
  Null? additionalNumber;
  String? presentAddress;
  String? permanentAddress;
  String? gender;
  String? dob;
  String? countryId;
  String? facebookLink;
  String? linkedinLink;
  String? overview;
  String? fatherName;
  String? fatherNumber;
  String? motherName;
  String? motherNumber;
  String? createdAt;
  String? updatedAt;

  PrimaryInfo(
      {this.id,
        this.userId,
        this.identityTypeId,
        this.identityNumber,
        this.religionId,
        this.additionalNumber,
        this.presentAddress,
        this.permanentAddress,
        this.gender,
        this.dob,
        this.countryId,
        this.facebookLink,
        this.linkedinLink,
        this.overview,
        this.fatherName,
        this.fatherNumber,
        this.motherName,
        this.motherNumber,
        this.createdAt,
        this.updatedAt});

  PrimaryInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    identityTypeId = json['identity_type_id'];
    identityNumber = json['identity_number'];
    religionId = json['religion_id'];
    additionalNumber = json['additional_number'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    gender = json['gender'];
    dob = json['dob'];
    countryId = json['country_id'];
    facebookLink = json['facebook_link'];
    linkedinLink = json['linkedin_link'];
    overview = json['overview'];
    fatherName = json['father_name'];
    fatherNumber = json['father_number'];
    motherName = json['mother_name'];
    motherNumber = json['mother_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['identity_type_id'] = this.identityTypeId;
    data['identity_number'] = this.identityNumber;
    data['religion_id'] = this.religionId;
    data['additional_number'] = this.additionalNumber;
    data['present_address'] = this.presentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['country_id'] = this.countryId;
    data['facebook_link'] = this.facebookLink;
    data['linkedin_link'] = this.linkedinLink;
    data['overview'] = this.overview;
    data['father_name'] = this.fatherName;
    data['father_number'] = this.fatherNumber;
    data['mother_name'] = this.motherName;
    data['mother_number'] = this.motherNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EmergencyInfo {
  int? id;
  String? userId;
  String? name;
  String? relation;
  String? number;
  String? address;
  String? createdAt;
  String? updatedAt;

  EmergencyInfo(
      {this.id,
        this.userId,
        this.name,
        this.relation,
        this.number,
        this.address,
        this.createdAt,
        this.updatedAt});

  EmergencyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    relation = json['relation'];
    number = json['number'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['number'] = this.number;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OtherInfo {
  int? id;
  String? userId;
  String? preferableCategoriesIds;
  String? preferableClassIds;
  String? preferableSubjectIds;
  String? tutoringPlace;
  String? createdAt;
  String? updatedAt;

  OtherInfo(
      {this.id,
        this.userId,
        this.preferableCategoriesIds,
        this.preferableClassIds,
        this.preferableSubjectIds,
        this.tutoringPlace,
        this.createdAt,
        this.updatedAt});

  OtherInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    preferableCategoriesIds = json['preferable_categories_ids'];
    preferableClassIds = json['preferable_class_ids'];
    preferableSubjectIds = json['preferable_subject_ids'];
    tutoringPlace = json['tutoringPlace'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['preferable_categories_ids'] = this.preferableCategoriesIds;
    data['preferable_class_ids'] = this.preferableClassIds;
    data['preferable_subject_ids'] = this.preferableSubjectIds;
    data['tutoringPlace'] = this.tutoringPlace;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
