class ChildDetailsModel {
  ChildrenStatus childrenStatus;
  ChildThirdName childThirdName;
  ChildThirdName gender;
  ChildThirdName birthDate;
  ChildThirdName relation;
  ChildThirdName adress;
  ChildThirdName isRegisterInSchool;
  ChildThirdName lStage;
  ChildThirdName contact1Name;
  ChildThirdName contact1Phone;
  ChildThirdName contact1Relation;
  ChildThirdName contact2Name;
  ChildThirdName contact2Phone;
  ChildrenStatus contact2Relation;
  ChildThirdName leav1Name;
  ChildThirdName leav1Phone;
  ChildThirdName leav1Relation;
  ChildThirdName leav2Name;
  ChildThirdName leav2Phone;
  ChildThirdName leav2Relation;
  ChildThirdName childSensitivity;
  ChildThirdName childSensitivityOther;
  ChildThirdName adrinaGive;
  ChildThirdName thisChildSpecial;
  ChildThirdName childHealth;
  ChildThirdName childPhoto;
  ChildThirdName childrenPhotoCard;
  ChildThirdName childBirthCert;
  ChildThirdName childAf;
  ChildThirdName childMedicCert;
  ChildrenStatus images;
  ChildrenStatus reports;
  ChildrenStatus techer;
  ChildrenStatus chat;

  ChildDetailsModel(
      {this.childrenStatus,
        this.childThirdName,
        this.gender,
        this.birthDate,
        this.relation,
        this.adress,
        this.isRegisterInSchool,
        this.lStage,
        this.contact1Name,
        this.contact1Phone,
        this.contact1Relation,
        this.contact2Name,
        this.contact2Phone,
        this.contact2Relation,
        this.leav1Name,
        this.leav1Phone,
        this.leav1Relation,
        this.leav2Name,
        this.leav2Phone,
        this.leav2Relation,
        this.childSensitivity,
        this.childSensitivityOther,
        this.adrinaGive,
        this.thisChildSpecial,
        this.childHealth,
        this.childPhoto,
        this.childrenPhotoCard,
        this.childBirthCert,
        this.childAf,
        this.childMedicCert,
        this.images,
        this.reports,
        this.techer,
        this.chat});

  ChildDetailsModel.fromJson(Map<String, dynamic> json) {
    childrenStatus = json['children_status'] != null
        ? new ChildrenStatus.fromJson(json['children_status'])
        : null;
    childThirdName = json['child_third_name'] != null
        ? new ChildThirdName.fromJson(json['child_third_name'])
        : null;
    gender = json['gender'] != null
        ? new ChildThirdName.fromJson(json['gender'])
        : null;
    birthDate = json['birth_date'] != null
        ? new ChildThirdName.fromJson(json['birth_date'])
        : null;
    relation = json['relation'] != null
        ? new ChildThirdName.fromJson(json['relation'])
        : null;
    adress = json['adress'] != null
        ? new ChildThirdName.fromJson(json['adress'])
        : null;
    isRegisterInSchool = json['is_register_in_school'] != null
        ? new ChildThirdName.fromJson(json['is_register_in_school'])
        : null;
    lStage = json['l_stage'] != null
        ? new ChildThirdName.fromJson(json['l_stage'])
        : null;
    contact1Name = json['contact_1_name'] != null
        ? new ChildThirdName.fromJson(json['contact_1_name'])
        : null;
    contact1Phone = json['contact_1_phone'] != null
        ? new ChildThirdName.fromJson(json['contact_1_phone'])
        : null;
    contact1Relation = json['contact_1_relation'] != null
        ? new ChildThirdName.fromJson(json['contact_1_relation'])
        : null;
    contact2Name = json['contact_2_name'] != null
        ? new ChildThirdName.fromJson(json['contact_2_name'])
        : null;
    contact2Phone = json['contact_2_phone'] != null
        ? new ChildThirdName.fromJson(json['contact_2_phone'])
        : null;
    contact2Relation = json['contact_2_relation'] != null
        ? new ChildrenStatus.fromJson(json['contact_2_relation'])
        : null;
    leav1Name = json['leav_1_name'] != null
        ? new ChildThirdName.fromJson(json['leav_1_name'])
        : null;
    leav1Phone = json['leav_1_phone'] != null
        ? new ChildThirdName.fromJson(json['leav_1_phone'])
        : null;
    leav1Relation = json['leav_1_relation'] != null
        ? new ChildThirdName.fromJson(json['leav_1_relation'])
        : null;
    leav2Name = json['leav_2_name'] != null
        ? new ChildThirdName.fromJson(json['leav_2_name'])
        : null;
    leav2Phone = json['leav_2_phone'] != null
        ? new ChildThirdName.fromJson(json['leav_2_phone'])
        : null;
    leav2Relation = json['leav_2_relation'] != null
        ? new ChildThirdName.fromJson(json['leav_2_relation'])
        : null;
    childSensitivity = json['child_sensitivity'] != null
        ? new ChildThirdName.fromJson(json['child_sensitivity'])
        : null;
    childSensitivityOther = json['child_sensitivity_other'] != null
        ? new ChildThirdName.fromJson(json['child_sensitivity_other'])
        : null;
    adrinaGive = json['adrina_give'] != null
        ? new ChildThirdName.fromJson(json['adrina_give'])
        : null;
    thisChildSpecial = json['this_child_special'] != null
        ? new ChildThirdName.fromJson(json['this_child_special'])
        : null;
    childHealth = json['child_health'] != null
        ? new ChildThirdName.fromJson(json['child_health'])
        : null;
    childPhoto = json['child_photo'] != null
        ? new ChildThirdName.fromJson(json['child_photo'])
        : null;
    childrenPhotoCard = json['children_photo_card'] != null
        ? new ChildThirdName.fromJson(json['children_photo_card'])
        : null;
    childBirthCert = json['child_birth_cert'] != null
        ? new ChildThirdName.fromJson(json['child_birth_cert'])
        : null;
    childAf = json['child_af'] != null
        ? new ChildThirdName.fromJson(json['child_af'])
        : null;
    childMedicCert = json['child_medic_cert'] != null
        ? new ChildThirdName.fromJson(json['child_medic_cert'])
        : null;
    images = json['images'] != null
        ? new ChildrenStatus.fromJson(json['images'])
        : null;
    reports = json['reports'] != null
        ? new ChildrenStatus.fromJson(json['reports'])
        : null;
    techer = json['techer'] != null
        ? new ChildrenStatus.fromJson(json['techer'])
        : null;
    chat =
    json['chat'] != null ? new ChildrenStatus.fromJson(json['chat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childrenStatus != null) {
      data['children_status'] = this.childrenStatus.toJson();
    }
    if (this.childThirdName != null) {
      data['child_third_name'] = this.childThirdName.toJson();
    }
    if (this.gender != null) {
      data['gender'] = this.gender.toJson();
    }
    if (this.birthDate != null) {
      data['birth_date'] = this.birthDate.toJson();
    }
    if (this.relation != null) {
      data['relation'] = this.relation.toJson();
    }
    if (this.adress != null) {
      data['adress'] = this.adress.toJson();
    }
    if (this.isRegisterInSchool != null) {
      data['is_register_in_school'] = this.isRegisterInSchool.toJson();
    }
    if (this.lStage != null) {
      data['l_stage'] = this.lStage.toJson();
    }
    if (this.contact1Name != null) {
      data['contact_1_name'] = this.contact1Name.toJson();
    }
    if (this.contact1Phone != null) {
      data['contact_1_phone'] = this.contact1Phone.toJson();
    }
    if (this.contact1Relation != null) {
      data['contact_1_relation'] = this.contact1Relation.toJson();
    }
    if (this.contact2Name != null) {
      data['contact_2_name'] = this.contact2Name.toJson();
    }
    if (this.contact2Phone != null) {
      data['contact_2_phone'] = this.contact2Phone.toJson();
    }
    if (this.contact2Relation != null) {
      data['contact_2_relation'] = this.contact2Relation.toJson();
    }
    if (this.leav1Name != null) {
      data['leav_1_name'] = this.leav1Name.toJson();
    }
    if (this.leav1Phone != null) {
      data['leav_1_phone'] = this.leav1Phone.toJson();
    }
    if (this.leav1Relation != null) {
      data['leav_1_relation'] = this.leav1Relation.toJson();
    }
    if (this.leav2Name != null) {
      data['leav_2_name'] = this.leav2Name.toJson();
    }
    if (this.leav2Phone != null) {
      data['leav_2_phone'] = this.leav2Phone.toJson();
    }
    if (this.leav2Relation != null) {
      data['leav_2_relation'] = this.leav2Relation.toJson();
    }
    if (this.childSensitivity != null) {
      data['child_sensitivity'] = this.childSensitivity.toJson();
    }
    if (this.childSensitivityOther != null) {
      data['child_sensitivity_other'] = this.childSensitivityOther.toJson();
    }
    if (this.adrinaGive != null) {
      data['adrina_give'] = this.adrinaGive.toJson();
    }
    if (this.thisChildSpecial != null) {
      data['this_child_special'] = this.thisChildSpecial.toJson();
    }
    if (this.childHealth != null) {
      data['child_health'] = this.childHealth.toJson();
    }
    if (this.childPhoto != null) {
      data['child_photo'] = this.childPhoto.toJson();
    }
    if (this.childrenPhotoCard != null) {
      data['children_photo_card'] = this.childrenPhotoCard.toJson();
    }
    if (this.childBirthCert != null) {
      data['child_birth_cert'] = this.childBirthCert.toJson();
    }
    if (this.childAf != null) {
      data['child_af'] = this.childAf.toJson();
    }
    if (this.childMedicCert != null) {
      data['child_medic_cert'] = this.childMedicCert.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.reports != null) {
      data['reports'] = this.reports.toJson();
    }
    if (this.techer != null) {
      data['techer'] = this.techer.toJson();
    }
    if (this.chat != null) {
      data['chat'] = this.chat.toJson();
    }
    return data;
  }
}

class ChildrenStatus {
  String label;
  String value;

  ChildrenStatus({this.label, this.value});

  ChildrenStatus.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'] == null ? '0' : '1';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

class ChildThirdName {
  String label;
  String value;

  ChildThirdName({this.label, this.value});

  ChildThirdName.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
