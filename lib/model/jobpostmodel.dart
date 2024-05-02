class jobpost {
  String? message;
  Job? job;

  jobpost({this.message, this.job});

  jobpost.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    return data;
  }
}

class Job {
  int? id;
  String? userId;
  String? tuitionTypeId;
  Null? instituteName;
  String? countryId;
  String? divisionId;
  String? districtId;
  Null? curriculumId;
  String? areaId;
  String? categoryId;
  String? classOrCourseId;
  String? subjectIds;
  String? numberOfStudent;
  Null? daysOfWeek;
  Null? tuitionTime;
  String? hireDate;
  String? salary;
  String? studentGender;
  String? tutorGender;
  String? hearAboutUsId;
  Null? educationBackgroundId;
  Null? moreRequirement;
  Null? addressDetails;
  String? guardianName;
  String? guardianMobile;
  String? applicationFee;
  String? firstInstallment;
  Null? secondInstallment;
  String? autoApprovalStatus;
  Null? assignedAdmin;
  String? status;
  Null? updatedBy;
  Null? createdBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Area? area;

  Job(
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
        this.updatedBy,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.area});

  Job.fromJson(Map<String, dynamic> json) {
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
    updatedBy = json['updated_by'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
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
    data['updated_by'] = this.updatedBy;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? districtId;
  String? name;
  Null? createdAt;
  Null? updatedAt;

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
