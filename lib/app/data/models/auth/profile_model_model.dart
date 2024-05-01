class ProfileModel {
  Profile? profile;

  ProfileModel({this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    profile = json['data'] != null ? Profile?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (profile != null) {
      data['data'] = profile?.toJson();
    }
    return data;
  }
}

class Profile {
  User? user;
  BasicInformationProfile? basicInformationProfile;
  AdvanceInformationProfile? advanceInformationProfile;

  Profile(
      {this.user,
      this.basicInformationProfile,
      this.advanceInformationProfile});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    basicInformationProfile = json['basicInformationProfile'] != null
        ? BasicInformationProfile?.fromJson(json['basicInformationProfile'])
        : null;
    advanceInformationProfile = json['advanceInformationProfile'] != null
        ? AdvanceInformationProfile?.fromJson(json['advanceInformationProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (basicInformationProfile != null) {
      data['basicInformationProfile'] = basicInformationProfile?.toJson();
    }
    if (advanceInformationProfile != null) {
      data['advanceInformationProfile'] = advanceInformationProfile?.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? fullName;
  String? phone;
  String? gender;
  bool? isVerifiedAccount;
  String? uuid;
  String? username;
  bool? linkedWithGoogle;
  String? googleEmail;

  User({
    this.id,
    this.email,
    this.fullName,
    this.phone,
    this.gender,
    this.isVerifiedAccount,
    this.uuid,
    this.username,
    this.linkedWithGoogle,
    this.googleEmail,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    phone = json['phone'];
    gender = json['gender'];
    isVerifiedAccount = json['isVerifiedAccount'];
    uuid = json['uuid'];
    username = json['username'];
    linkedWithGoogle = json['linkedWithGoogle'];
    googleEmail = json['googleEmail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phone'] = phone;
    data['gender'] = gender;
    data['isVerifiedAccount'] = isVerifiedAccount;
    data['uuid'] = uuid;
    data['username'] = username;
    data['linkedWithGoogle'] = linkedWithGoogle;
    data['googleEmail'] = googleEmail;
    return data;
  }
}

class BasicInformationProfile {
  String? address;
  String? city;
  String? placeOfBirth;
  String? dateOfBirth;
  String? passportNo;
  String? photo;
  String? residentNo;
  UserType? userType;

  BasicInformationProfile({
    this.address,
    this.city,
    this.placeOfBirth,
    this.dateOfBirth,
    this.passportNo,
    this.photo,
    this.residentNo,
    this.userType,
  });

  BasicInformationProfile.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    placeOfBirth = json['placeOfBirth'];
    dateOfBirth = json['dateOfBirth'];
    passportNo = json['passportNo'].toString();
    photo = json['photo'];
    residentNo = json['residentNo'].toString();
    userType =
        json['userType'] != null ? UserType?.fromJson(json['userType']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['placeOfBirth'] = placeOfBirth;
    data['dateOfBirth'] = dateOfBirth;
    data['passportNo'] = passportNo;
    data['photo'] = photo;
    data['residentNo'] = residentNo;
    if (userType != null) {
      data['userType'] = userType?.toJson();
    }
    return data;
  }
}

class UserType {
  String? createdDate;
  String? userType;
  String? description;
  String? modifiedDate;
  String? deletedAt;

  UserType({
    this.createdDate,
    this.userType,
    this.description,
    this.modifiedDate,
    this.deletedAt,
  });

  UserType.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    userType = json['userType'];
    description = json['description'];
    modifiedDate = json['modifiedDate'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['userType'] = userType;
    data['description'] = description;
    data['modifiedDate'] = modifiedDate;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class AdvanceInformationProfile {
  Lecturer? lecturer;
  Student? student;

  AdvanceInformationProfile({this.lecturer, this.student});

  AdvanceInformationProfile.fromJson(Map<String, dynamic> json) {
    lecturer =
        json['lecturer'] != null ? Lecturer?.fromJson(json['lecturer']) : null;
    student =
        json['student'] != null ? Student?.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (lecturer != null) {
      data['lecturer'] = lecturer?.toJson();
    }
    if (student != null) {
      data['student'] = student?.toJson();
    }
    return data;
  }
}

class Lecturer {
  String? informationId;
  String? lecturerNo;
  dynamic academicDegree1;
  dynamic academicDegree2;
  String? university;
  String? programStudy;

  Lecturer({
    this.informationId,
    this.lecturerNo,
    this.academicDegree1,
    this.academicDegree2,
    this.university,
    this.programStudy,
  });

  Lecturer.fromJson(Map<String, dynamic> json) {
    informationId = json['informationId'];
    lecturerNo = json['lecturerNo'];
    academicDegree1 = json['academicDegree1'];
    academicDegree2 = json['academicDegree2'];
    university = json['university'];
    programStudy = json['programStudy'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['informationId'] = informationId;
    data['lecturerNo'] = lecturerNo;
    data['academicDegree1'] = academicDegree1;
    data['academicDegree2'] = academicDegree2;
    data['university'] = university;
    data['programStudy'] = programStudy;
    return data;
  }
}

class Student {
  String? informationId;
  String? studentNo;
  String? university;
  Faculty? faculty;
  Faculty? studyProgram;
  Program? program;

  Student({
    this.informationId,
    this.studentNo,
    this.university,
    this.faculty,
    this.studyProgram,
    this.program,
  });

  Student.fromJson(Map<String, dynamic> json) {
    informationId = json['informationId'];
    studentNo = json['studentNo'];
    university = json['university'];
    faculty =
        json['faculty'] != null ? Faculty?.fromJson(json['faculty']) : null;
    studyProgram = json['studyProgram'] != null
        ? Faculty?.fromJson(json['studyProgram'])
        : null;
    program =
        json['program'] != null ? Program?.fromJson(json['program']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['informationId'] = informationId;
    data['studentNo'] = studentNo;
    data['university'] = university;
    if (faculty != null) {
      data['faculty'] = faculty?.toJson();
    }
    if (studyProgram != null) {
      data['studyProgram'] = studyProgram?.toJson();
    }
    if (program != null) {
      data['program'] = program?.toJson();
    }
    return data;
  }
}

class Faculty {
  String? createdDate;
  String? id;
  String? name;
  dynamic migrationId;
  String? modifiedDate;
  dynamic deletedAt;

  Faculty({
    this.createdDate,
    this.id,
    this.name,
    this.migrationId,
    this.modifiedDate,
    this.deletedAt,
  });

  Faculty.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    id = json['id'];
    name = json['name'];
    migrationId = json['migrationId'];
    modifiedDate = json['modifiedDate'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['id'] = id;
    data['name'] = name;
    data['migrationId'] = migrationId;
    data['modifiedDate'] = modifiedDate;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class Program {
  String? createdDate;
  int? id;
  String? name;
  String? migrationId;
  String? modifiedDate;
  dynamic deletedAt;

  Program(
      {this.createdDate,
      this.id,
      this.name,
      this.migrationId,
      this.modifiedDate,
      this.deletedAt});

  Program.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    id = json['id'];
    name = json['name'];
    migrationId = json['migrationId'];
    modifiedDate = json['modifiedDate'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['id'] = id;
    data['name'] = name;
    data['migrationId'] = migrationId;
    data['modifiedDate'] = modifiedDate;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
