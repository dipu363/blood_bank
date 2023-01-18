import 'package:blood_bank/controller/label_controller.dart';
import 'package:blood_bank/utils/LabelConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/reg_controller.dart';
import '../data/requestModel/CodeModel.dart';
import '../utils/AppConstant.dart';
import '../utils/CommonLabel.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  LabelController labelController = Get.put(LabelController());
  RegistrationController regController = Get.put(RegistrationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labelController.initLabelList(LabelConstant.regFormCode, context);
  }

  @override
  Widget build(BuildContext context) {
    //regController.initData();

    //print(regController.selectedGenderCode.value.NAME_GLOBAL);

    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          _getAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                child: Column(
                  children: [
                    // regController.isLoadingLabel.value || regController.loaderDemographicData.value ? ApplicationLoader().getListViewLoader():_getBody()
                    _getBody(),
                  ],
                ),
              ),
              childCount: 1,
            ),
          )
        ],
      )),
    );
  }

  Widget _getAppBar() {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      floating: true,
      centerTitle: true,
      title: const Text('Registration'),
      leading: InkWell(
        child: const Icon(Icons.arrow_back_ios),
        onTap: () => Navigator.pop(context, true),
      ),
      actions: [
        InkWell(
          onTap: () async {
            //FocusScope.of(context).unfocus();
            /*          if(_registrationKey.currentState.validate()){
              if(await AppUtils.checkConnection()){
                print("ex pat id > "+patNo);
                RegistrationModel model = RegistrationModel();
                model.T_PAT_NO = patNo;
                model.T_FIRST_LANG1_NAME = firstNameArController.text.toString();
                model.T_FIRST_LANG2_NAME = firstNameEnController.text.toString();
                model.T_FATHER_LANG1_NAME = fatherNameArController.text.toString();
                model.T_FATHER_LANG2_NAME = fatherNameEnController.text.toString();
                model.T_FAMILY_LANG1_NAME = familyNameArController.text.toString();
                model.T_FAMILY_LANG2_NAME = familyNameEnController.text.toString();

                model.T_GENDER = selectedGender.CODE;
                model.T_BIRTH_DATE = _getFullDOB();
                model.T_NTNLTY_CODE = selectedNational.CODE;
                model.T_NTNLTY_ID = this.nationalId;
                model.T_MOBILE_NO = this.phoneNo;
                model.T_PHONE_HOME = homePhoneController.text.toString();

                saveData(model);
              }else{
                AppToast(context).showToast(CommonLabel .commonCheckConnection, AppToast.ERROR, AppToast.LONG);
              }
            }*/
          },
          child: Container(
            margin: const EdgeInsets.only(top: 5.0, right: 10.0),
            child: Column(
              children: [
                const Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 25.0,
                ),
                // Text("يقدم")
                Text(CommonLabel.commonSubmit)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getNidPhoneRow(),
            _getDivider(),
            _getFirstNameRow(),
            const SizedBox(
              height: 20.0,
            ),
            _getFatherNameRow(),
            const SizedBox(
              height: 20.0,
            ),
            _getFamilyNameRow(),
            _getDivider(),
            Obx(() => _getNationalityGenderRow()),
            _getDivider(),
            _getDOBEnglish(),
             const SizedBox(height: 20.0,),
            _getDOBHijri(),
            // SizedBox(height: 20.0,),
            // _getAgeRow(),
          ],
        ),
      ),
    );
  }

// section divider
  Widget _getDivider() {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: .3,
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }

  Widget _getNidPhoneRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() =>
                  _getTextFieldLabel(labelController.regiNationality.value)),
              TextFormField(
                enabled: false,
                controller: regController.nidController,
                decoration: AppConstant.textFieldDecoration,
                style: AppConstant.textStyle,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => _getTextFieldLabel(labelController.regiPhone.value)),
              TextFormField(
                controller: regController.phoneController,
                enabled: false,
                decoration: AppConstant.textFieldDecoration,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getFirstNameRow() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _getTextFieldLabel(
                        '${labelController.regiFirstName} ${CommonLabel.commonEn}'),
                    _getRequiredField()
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        /*child: Focus(
                         */ /*   onFocusChange: (hasFocus) {
                              if(!hasFocus) {
                                regController.getTranslatedName(context,regController.firstNameEnController.value.text, regController.LANG_NATIVE, regController.firstNameArController, 1);
                              }
                            },*/ /*
                            child: _getTextField(regController.firstNameEnController, true)
                        ),*/
                        child: _getTextField(
                            regController.firstNameEnController, true)),
                    // _getDataLoader(regController.loaderFirstNameEn.value),
                  ],
                ),
              ],
            )),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getTextFieldLabel(
                    '${labelController.regiFirstName} ${CommonLabel.commonAr}'),
                Row(
                  children: [
                    Expanded(
                        /*    child: Focus(
                           */ /* onFocusChange: (hasFocus) {
                              if(!hasFocus) {
                                regController.getTranslatedName(context,regController.firstNameArController.text, regController.LANG_GLOBAL, regController.firstNameEnController, 4);
                              }
                            },*/ /*
                            child: _getTextField(regController.firstNameArController, false)
                        ),*/

                        child: _getTextField(
                            regController.firstNameArController, false)),
                    // _getDataLoader(regController.loaderFirstNameAr.value),
                  ],
                ),
              ],
            ))
      ],
    );
  }

  Widget _getFatherNameRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _getTextFieldLabel(
                      '${labelController.regiFirstName} ${CommonLabel.commonAr}'),
                  _getRequiredField()
                ],
              ),
              Row(
                children: [
                  Expanded(
                      /*    child: Focus(
                          onFocusChange: (hasFocus) {
                            if(!hasFocus) {
                              regController.getTranslatedName(context,regController.fatherNameEnController.text, regController.LANG_GLOBAL, regController.fatherNameEnController, 2);
                            }
                          },
                          child: _getTextField(regController.fatherNameEnController, true)
                      ),*/

                      child: _getTextField(
                          regController.fatherNameEnController, true)),
                  // _getDataLoader(regController.loaderFatherNameEn.value),
                ],
              ),

              /*Focus(
                onFocusChange: (hasFocus) {
                  if(!hasFocus) {
                    _getTranslatedName(fatherNameEnController.text, LANG_NATIVE, fatherNameArController, 2);
                  }
                },
                child: _getTextField(fatherNameEnController, true)
              ),*/
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getTextFieldLabel(
                  '${labelController.regiFirstName} ${CommonLabel.commonAr}'),
              Row(
                children: [
                  // Expanded(child: _getTextField(fatherNameArController, false)),
                  Expanded(
                    /* child: Focus(
                          onFocusChange: (hasFocus) {
                            if(!hasFocus) {
                              regController.getTranslatedName(context,regController.fatherNameArController.text, regController.LANG_GLOBAL, regController.fatherNameArController, 5);
                            }
                          },
                          child: _getTextField(regController.fatherNameArController, false)
                      )*/
                    child: _getTextField(
                        regController.fatherNameArController, false),
                  ),
                  //_getDataLoader(regController.loaderFatherNameAr.value),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getFamilyNameRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _getTextFieldLabel(
                      '${labelController.regiFirstName} ${CommonLabel.commonEn}'),
                  _getRequiredField()
                ],
              ),
              Row(
                children: [
                  Expanded(
                      /*child: Focus(
                          onFocusChange: (hasFocus) {
                            if(!hasFocus) {
                              regController.getTranslatedName(context,regController.familyNameEnController.text, regController.LANG_GLOBAL, regController.familyNameEnController, 3);
                            }
                          },
                          child: _getTextField(regController.familyNameEnController, true)
                      )*/
                      child: _getTextField(
                          regController.familyNameEnController, true)),
                  // _getDataLoader(regController.loaderFamilyNameEn.value),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getTextFieldLabel(
                  '${labelController.regiFirstName} ${CommonLabel.commonEn}'),
              Row(
                children: [
                  //
                  /* Expanded(
                      child: Focus(
                          onFocusChange: (hasFocus) {
                            if(!hasFocus) {
                              regController.getTranslatedName(context,regController.familyNameArController.text, regController.LANG_GLOBAL, regController.familyNameArController, 6);
                            }
                          },
                          child: _getTextField(regController.familyNameArController, false)
                      )
                  ),*/
                  Expanded(
                    child: _getTextField(
                        regController.familyNameArController, false),
                  ),
                  // _getDataLoader(regController.loaderFamilyNameAr.value),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getNationalityGenderRow() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _getTextFieldLabel(
                            labelController.regiNationality.value),
                        _getRequiredField()
                      ],
                    ),
                    DropdownButtonFormField<CodeModel>(
                      validator: (value) =>
                          value == null ? CommonLabel.commonEmptyField : null,
                      value: regController.selectedNationalCode.value,
                      hint: const Text('select nationality'),
                      onChanged: (value) {
                        regController.selectedNationalCode.value = value!;
                        print(
                            'REG Screen ${regController.selectedNationalCode.value.CODE}');
                        print(regController
                            .selectedNationalCode.value.NAME_GLOBAL);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      items: regController.nationalList.map((item) {
                        return DropdownMenuItem<CodeModel>(
                          value: item,
                          child: Text(labelController.isLocalActive.value
                              ? item.NAME_NATIVE
                              : item.NAME_GLOBAL),
                        );
                      }).toList(),
                      decoration: AppConstant.textFieldDecoration,
                    ),
                  ],
                ),
              ),
              _getDataLoader(regController.loaderNationality.value),
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _getTextFieldLabel(labelController.regiGender.value),
                        _getRequiredField()
                      ],
                    ),
                    DropdownButtonFormField<CodeModel>(
                      validator: (value) =>
                          value == null ? CommonLabel.commonEmptyField : null,
                      value: regController.selectedGenderCode.value,
                      hint: const Text(
                        'select Gender',
                        style: TextStyle(fontSize: 14),
                      ),
                      onChanged: (value) {
                        print(value);
                         regController.selectedGenderCode.value = value! ;
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      items: regController.genderList.map((item) {
                        return DropdownMenuItem<CodeModel>(
                          value: item,
                          child: Text(
                            labelController.isLocalActive.value
                                ? item.NAME_NATIVE
                                : item.NAME_GLOBAL,
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                      decoration: AppConstant.textFieldDecoration,
                    ),
                  ],
                ),
              ),
              _getDataLoader(regController.loaderGender.value),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getDOBEnglish(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _getTextFieldLabel('regiDobGregorian'),
            _getRequiredField(),
            _getDataLoader(true),

          ],
        ),
        const SizedBox(height: 10.0,),
        Row(
          children: [
            Expanded(
              flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null? CommonLabel.commonEmptyField: null,
                  onChanged: (value){
                    CodeModel code = value!;
                    print(code.NAME_GLOBAL);
                  },
                  hint: const Text('D',style: TextStyle(fontSize: 14),),
                 items: regController.nationalList.map((item) {
                   return DropdownMenuItem<CodeModel>(
                     value: item,
                       child: Text(regController.islocalactive.value?item.NAME_GLOBAL:item.NAME_NATIVE)
                   );
                 }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                )
            ),
            Expanded(
                flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null ? CommonLabel.commonEmptyField:null,
                  onChanged: (value){
                    CodeModel code = value!;
                    print(code.NAME_GLOBAL);
                  },
                  hint: const  Text('M',style: TextStyle(fontSize: 14),),
                  items: regController.nationalList.map((item) {
                    return DropdownMenuItem <CodeModel>(
                        value: item,
                        child: Text(regController.islocalactive.value? item.NAME_GLOBAL:item.NAME_NATIVE),

                    );

                  }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                  )
            ), Expanded(
                flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null ? CommonLabel.commonEmptyField: null,
                  hint: const Text('y', style: TextStyle(fontSize: 14),),
                  onChanged: (value){
                    CodeModel code = value!;
                  },
                  items: regController.nationalList.map((e) {
                    return DropdownMenuItem<CodeModel>(
                        value: e,
                        child: Text(regController.islocalactive.value? e.NAME_GLOBAL: e.NAME_NATIVE)
                    );

                  }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                )


            ),
          ],
        ),
      ],
    );
  } Widget _getDOBHijri(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _getTextFieldLabel('regiDobGregorian'),
            _getRequiredField(),
            _getDataLoader(true),

          ],
        ),
        const SizedBox(height: 10.0,),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null? CommonLabel.commonEmptyField: null,
                  onChanged: (value){
                    CodeModel code = value!;
                    print(code.NAME_GLOBAL);
                  },
                  hint: const Text('D',style: TextStyle(fontSize: 14),),
                  items: regController.nationalList.map((item) {
                    return DropdownMenuItem<CodeModel>(
                        value: item,
                        child: Text(regController.islocalactive.value?item.NAME_GLOBAL:item.NAME_NATIVE)
                    );
                  }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                )
            ),
            Expanded(
                flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null ? CommonLabel.commonEmptyField:null,
                  onChanged: (value){
                    CodeModel code = value!;
                    print(code.NAME_GLOBAL);
                  },
                  hint: const  Text('M',style: TextStyle(fontSize: 14),),
                  items: regController.nationalList.map((item) {
                    return DropdownMenuItem <CodeModel>(
                      value: item,
                      child: Text(regController.islocalactive.value? item.NAME_GLOBAL:item.NAME_NATIVE),

                    );

                  }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                )
            ), Expanded(
                flex: 1,
                child: DropdownButtonFormField<CodeModel>(
                  validator: (value)=> value == null ? CommonLabel.commonEmptyField: null,
                  hint: const Text('y', style: TextStyle(fontSize: 14),),
                  onChanged: (value){
                    CodeModel code = value!;
                  },
                  items: regController.nationalList.map((e) {
                    return DropdownMenuItem<CodeModel>(
                        value: e,
                        child: Text(regController.islocalactive.value? e.NAME_GLOBAL: e.NAME_NATIVE)
                    );

                  }).toList(),
                  decoration: AppConstant.textFieldDecoration,
                )


            ),
          ],
        ),
      ],
    );
  }

  Widget _getTextFieldLabel(text) {
    return Text(
      text,
      style: AppConstant.textStyle,
    );
  }

  Widget _getTextField(var controller, needValidate) {
    return TextFormField(
      controller: controller,
      validator: needValidate
          ? (var value) {
              if (value!.isEmpty) {
                return CommonLabel.commonEmptyField;
              }
              return null;
            }
          : null,
      decoration: AppConstant.textFieldDecoration,
    );
  }

  Widget _getRequiredField() {
    return const Text(
      "*",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  Widget _getDataLoader(visible) {
    return Visibility(
      visible: visible,
      child: const Padding(
        padding: EdgeInsets.only(top: 5.0, left: 5.0),
        child: SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            )),
      ),
    );
  }
}
