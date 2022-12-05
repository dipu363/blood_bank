class RegistrationModel{
  var tBIRTHDATE;
  var tFAMILYLANG1NAME;
  var tFAMILYLANG2NAME;
  var tFATHERLANG1NAME;
  var tFATHERLANG2NAME;
  var tFIRSTLANG1NAME;
  var tFIRSTLANG2NAME;
  var tGENDER;
  var tMOBILENO;
  var tNTNLTYCODE;
  var tNTNLTYID;
  var tPATNO;
  var tPHONEHOME;


  RegistrationModel(
      this.tBIRTHDATE,
      this.tFAMILYLANG1NAME,
      this.tFAMILYLANG2NAME,
      this.tFATHERLANG1NAME,
      this.tFATHERLANG2NAME,
      this.tFIRSTLANG1NAME,
      this.tFIRSTLANG2NAME,
      this.tGENDER,
      this.tMOBILENO,
      this.tNTNLTYCODE,
      this.tNTNLTYID,
      this.tPATNO,
      this.tPHONEHOME
      );


  RegistrationModel.fromJson(Map<String, dynamic> json) {
    tBIRTHDATE = json['T_BIRTH_DATE'];
    tFAMILYLANG1NAME = json['T_FAMILY_LANG1_NAME'];
    tFAMILYLANG2NAME = json['T_FAMILY_LANG2_NAME'];
    tFATHERLANG1NAME = json['T_FATHER_LANG1_NAME'];
    tFATHERLANG2NAME = json['T_FATHER_LANG2_NAME'];
    tFIRSTLANG1NAME = json['T_FIRST_LANG1_NAME'];
    tFIRSTLANG2NAME = json['T_FIRST_LANG2_NAME'];
    tGENDER = json['T_GENDER'];
    tMOBILENO = json['T_MOBILE_NO'];
    tNTNLTYCODE = json['T_NTNLTY_CODE'];
    tNTNLTYID = json['T_NTNLTY_ID'];
    tPATNO = json['T_PAT_NO'];
    tPHONEHOME = json['T_PHONE_HOME'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['T_BIRTH_DATE'] = this.tBIRTHDATE;
    data['T_FAMILY_LANG1_NAME'] = this.tFAMILYLANG1NAME;
    data['T_FAMILY_LANG2_NAME'] = this.tFAMILYLANG2NAME;
    data['T_FATHER_LANG1_NAME'] = this.tFATHERLANG1NAME;
    data['T_FATHER_LANG2_NAME'] = this.tFATHERLANG2NAME;
    data['T_FIRST_LANG1_NAME'] = this.tFIRSTLANG1NAME;
    data['T_FIRST_LANG2_NAME'] = this.tFIRSTLANG2NAME;
    data['T_GENDER'] = this.tGENDER;
    data['T_MOBILE_NO'] = this.tMOBILENO;
    data['T_NTNLTY_CODE'] = this.tNTNLTYCODE;
    data['T_NTNLTY_ID'] = this.tNTNLTYID;
    data['T_PAT_NO'] = this.tPATNO;
    data['T_PHONE_HOME'] = this.tPHONEHOME;
    return data;
  }
}