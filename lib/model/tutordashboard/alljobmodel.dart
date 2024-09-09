class AlljobModel {
  List<Jobs>? jobs;
  int? total;

  AlljobModel({this.jobs, this.total});

  AlljobModel.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Jobs {
  int? id;
  String? userId;
  String? tuitionTypeId;
  String? instituteName;
  String? countryId;
  String? divisionId;
  String? districtId;
  Null? curriculumId;
  String? areaId;
  String? categoryId;
  String? classOrCourseId;
  String? subjectIds;
  String? numberOfStudent;
  String? daysOfWeek;
  Null? tuitionTime;
  String? hireDate;
  String? salary;
  String? studentGender;
  String? tutorGender;
  String? hearAboutUsId;
  String? educationBackgroundId;
  String? moreRequirement;
  String? addressDetails;
  String? guardianName;
  String? guardianMobile;
  String? applicationFee;
  String? firstInstallment;
  String? secondInstallment;
  String? autoApprovalStatus;
  Null? assignedAdmin;
  String? status;
  String? applicationStatus;
  String? updatedBy;
  Null? createdBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<String>? subjectNames;
  List<String>? categoryNames;
  List<String>? classOrCourseNames;
  List<String>? collegeName;
  Null? matchPercentage;
  TuitionType? tuitionType;
  TuitionType? country;
  Division? division;
  District? district;
  Area? area;
  ClassOrCourse? classOrCourse;

  Jobs(
      {this.id,
        this.userId,
        this.tuitionTypeId,
        this.instituteName,
        this.countryId,
        this.divisionId,
        this.districtId,
        this.curriculumId,
        this.areaId,
        this.categoryId,
        this.classOrCourseId,
        this.subjectIds,
        this.numberOfStudent,
        this.daysOfWeek,
        this.tuitionTime,
        this.hireDate,
        this.salary,
        this.studentGender,
        this.tutorGender,
        this.hearAboutUsId,
        this.educationBackgroundId,
        this.moreRequirement,
        this.addressDetails,
        this.guardianName,
        this.guardianMobile,
        this.applicationFee,
        this.firstInstallment,
        this.secondInstallment,
        this.autoApprovalStatus,
        this.assignedAdmin,
        this.status,
        this.applicationStatus,
        this.updatedBy,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.subjectNames,
        this.categoryNames,
        this.classOrCourseNames,
        this.collegeName,
        this.matchPercentage,
        this.tuitionType,
        this.country,
        this.division,
        this.district,
        this.area,
        this.classOrCourse});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tuitionTypeId = json['tuition_type_id'];
    instituteName = json['institute_name'];
    countryId = json['country_id'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    curriculumId = json['curriculum_id'];
    areaId = json['area_id'];
    categoryId = json['category_id'];
    classOrCourseId = json['class_or_course_id'];
    subjectIds = json['subject_ids'];
    numberOfStudent = json['number_of_student'];
    daysOfWeek = json['days_of_week'];
    tuitionTime = json['tuition_time'];
    hireDate = json['hire_date'];
    salary = json['salary'];
    studentGender = json['student_gender'];
    tutorGender = json['tutor_gender'];
    hearAboutUsId = json['hear_about_us_id'];
    educationBackgroundId = json['education_background_id'];
    moreRequirement = json['more_requirement'];
    addressDetails = json['address_details'];
    guardianName = json['guardian_name'];
    guardianMobile = json['guardian_mobile'];
    applicationFee = json['application_fee'];
    firstInstallment = json['first_installment'];
    secondInstallment = json['second_installment'];
    autoApprovalStatus = json['auto_approval_status'];
    assignedAdmin = json['assigned_admin'];
    status = json['status'];
    applicationStatus = json['application_status'];
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    subjectNames = json['subject_names'].cast<String>();
    categoryNames = json['category_names'].cast<String>();
    classOrCourseNames = json['class_or_course_names'].cast<String>();
    collegeName = json['collegeName'].cast<String>();
    matchPercentage = json['matchPercentage'];
    tuitionType = json['tuition_type'] != null
        ? new TuitionType.fromJson(json['tuition_type'])
        : null;
    country = json['country'] != null
        ? new TuitionType.fromJson(json['country'])
        : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    classOrCourse = json['class_or_course'] != null
        ? new ClassOrCourse.fromJson(json['class_or_course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['tuition_type_id'] = this.tuitionTypeId;
    data['institute_name'] = this.instituteName;
    data['country_id'] = this.countryId;
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['curriculum_id'] = this.curriculumId;
    data['area_id'] = this.areaId;
    data['category_id'] = this.categoryId;
    data['class_or_course_id'] = this.classOrCourseId;
    data['subject_ids'] = this.subjectIds;
    data['number_of_student'] = this.numberOfStudent;
    data['days_of_week'] = this.daysOfWeek;
    data['tuition_time'] = this.tuitionTime;
    data['hire_date'] = this.hireDate;
    data['salary'] = this.salary;
    data['student_gender'] = this.studentGender;
    data['tutor_gender'] = this.tutorGender;
    data['hear_about_us_id'] = this.hearAboutUsId;
    data['education_background_id'] = this.educationBackgroundId;
    data['more_requirement'] = this.moreRequirement;
    data['address_details'] = this.addressDetails;
    data['guardian_name'] = this.guardianName;
    data['guardian_mobile'] = this.guardianMobile;
    data['application_fee'] = this.applicationFee;
    data['first_installment'] = this.firstInstallment;
    data['second_installment'] = this.secondInstallment;
    data['auto_approval_status'] = this.autoApprovalStatus;
    data['assigned_admin'] = this.assignedAdmin;
    data['status'] = this.status;
    data['application_status'] = this.applicationStatus;
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['subject_names'] = this.subjectNames;
    data['category_names'] = this.categoryNames;
    data['class_or_course_names'] = this.classOrCourseNames;
    data['collegeName'] = this.collegeName;
    data['matchPercentage'] = this.matchPercentage;
    if (this.tuitionType != null) {
      data['tuition_type'] = this.tuitionType!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.classOrCourse != null) {
      data['class_or_course'] = this.classOrCourse!.toJson();
    }
    return data;
  }
}

class TuitionType {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;

  TuitionType({this.id, this.name, this.createdAt, this.updatedAt});

  TuitionType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Division {
  int? id;
  String? countryId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Division(
      {this.id, this.countryId, this.name, this.createdAt, this.updatedAt});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class District {
  int? id;
  String? divisionId;
  String? name;
  String? createdAt;
  String? updatedAt;

  District(
      {this.id, this.divisionId, this.name, this.createdAt, this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Area {
  int? id;
  String? districtId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Area({this.id, this.districtId, this.name, this.createdAt, this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ClassOrCourse {
  int? id;
  String? categoryId;
  String? name;
  Null? createdAt;
  Null? updatedAt;

  ClassOrCourse(
      {this.id, this.categoryId, this.name, this.createdAt, this.updatedAt});

  ClassOrCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
