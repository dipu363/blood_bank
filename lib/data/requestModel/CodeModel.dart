class CodeModel {
  late String CODE;
  late String NAME_NATIVE;
  late String NAME_GLOBAL;
  late String SHORT_NAME;

  CodeModel();

  CodeModel.fromJson(Map json)
      : CODE = json["CODE"] ?? "",
        NAME_NATIVE = json["NAME_NATIVE"] ?? "",
        NAME_GLOBAL = json["NAME_GLOBAL"] ?? "",
        SHORT_NAME = json["SHORT_NAME"] ?? "";
}
