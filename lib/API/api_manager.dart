import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import '../all_page.dart';

String urlBaseAPI = "http://10.0.2.2:8000/api/";
Future<List<SanPham>> fetchSanPham() async {
  List<SanPham> lstSanPham = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "SanPham"));
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      lstSanPham = jsonRaw.map((data) => SanPham.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return lstSanPham;
}

//Điện thoại
Future<List<SanPham>> fetchSanPhamDienThoai() async {
  List<SanPham> lstSanPhamDienThoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'dien-thoai'));
    if (response.statusCode == 200) {
      List jsonlst = [];
      jsonlst = json.decode(response.body);
      lstSanPhamDienThoai = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return lstSanPhamDienThoai;
}

//Laptop
Future<List<SanPham>> fetchSanPhamLapTop() async {
  List<SanPham> lstSanPhamLapTop = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'get-all-latop'));
    if (response.statusCode == 200) {
      List jsonlst = [];
      jsonlst = json.decode(response.body);
      lstSanPhamLapTop = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return lstSanPhamLapTop;
}

Future<List<SanPham>> fetchProductData(String id) async {
  final url = urlBaseAPI + 'san-pham/$id';
  List<SanPham> sanPhamChiTiet = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jSonlst = json.decode(response.body);
      sanPhamChiTiet = jSonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return sanPhamChiTiet;
}

Future<KhachHang> api_DangNhap(String email, String matkhau) async {
  var khachHang = KhachHang.empty();

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangNhap"),
        body: {"Email": "$email", "MatKhau": "$matkhau", "Username": "$email", "Phone": "$email"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      khachHang = KhachHang.fromJson(jsonRaw);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return khachHang;
}

Future<dynamic> api_DangKy(String username, String email, String matkhau) async {
  var khachHang = KhachHang.empty();

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangKy"),
        body: {"Username": "$username", "Email": "$email", "MatKhau": "$matkhau"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      khachHang = KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return khachHang;
}

Future<dynamic> api_Update_KhachHang(KhachHang khachHang) async {
  var _khachHang = KhachHang.empty();

  try {
    //final _pushBody = json.encode(khachHang);
    final _pushBody = json.encode(khachHang.toJson());
    final response = await http.post(
      Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}?_method=PUT"),
      body: _pushBody,
      headers: {"accept": "application/json", "content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      _khachHang = KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return _khachHang;
}

// Future<dynamic> UploadFile(File imageFile) async {
//   //ham nay la lay tu google
//   // ignore: deprecated_member_use
//   var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length = await imageFile.length();

//   var uri = Uri.parse("uploadURL");

//   var request = http.MultipartRequest("POST", uri);
//   var multipartFile =
//       http.MultipartFile('file', stream, length, filename: basename(imageFile.path));
//   //contentType: new MediaType('image', 'png'));

//   request.files.add(multipartFile);
//   var response = await request.send();
//   print(response.statusCode);
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
// }
