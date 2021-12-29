import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_1/Controller/cart_provider.dart';
import 'package:flutter_application_1/Modals/cart_model.dart';
import 'package:http/http.dart' as http;
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

// san pham dt 1tr-3tr
Future<List<SanPham>> fetchSanPhamDienThoai1_3tr() async {
  List<SanPham> lstSanPhamDienThoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'get-product-price-1'));
    if (response.statusCode == 200) {
      List jsonlst = [];
      jsonlst = json.decode(response.body);
      lstSanPhamDienThoai = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return lstSanPhamDienThoai;
}

// san pham dt 3tr-7tr
Future<List<SanPham>> fetchSanPhamDienThoai3_7tr() async {
  List<SanPham> lstSanPhamDienThoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'get-product-price-2'));
    if (response.statusCode == 200) {
      List jsonlst = [];
      jsonlst = json.decode(response.body);
      lstSanPhamDienThoai = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return lstSanPhamDienThoai;
}

// san pham dt tren 7tr
Future<List<SanPham>> fetchSanPhamDienThoai7tr() async {
  List<SanPham> lstSanPhamDienThoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'get-product-price-3'));
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

//Chi tiết sản phẩm
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

// sản phẩm bán chạy
Future<List<SanPham>> fecthSanPhamBanChay() async {
  final url = urlBaseAPI + 'san-pham-top';
  List<SanPham> sanPhamTop = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      sanPhamTop = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return sanPhamTop;
}

// San pham dang khuyen mai~
Future<List<SanPham>> fetchSanPhamSale() async {
  String url = urlBaseAPI + 'get-all-product-sale';
  List<SanPham> lstSanPhamSale = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      return lstSanPhamSale = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return lstSanPhamSale;
}

//tiềm kiếm

Future<List<SanPham>> ftechSanPhamSearch(String tenSanPhamTiemKiem) async {
  final url = urlBaseAPI + "search-product?TenSanPham=$tenSanPhamTiemKiem";
  List<SanPham> lstSanPhamSearch = [];
  try {
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      return lstSanPhamSearch = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}
  return lstSanPhamSearch;
}

//Dang nhap
Future<KhachHang> api_DangNhap(String email, String matkhau) async {
  var _khachHang = KhachHang.empty();

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangNhap"),
        body: {"Email": "$email", "MatKhau": "$matkhau", "Username": "$email", "Phone": "$email"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      _khachHang = KhachHang.fromJson(jsonRaw);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return _khachHang;
}

// Dang ky
Future<dynamic> api_DangKy(String username, String email, String matkhau) async {
//Future<dynamic> api_DangKy(String username, String email, String matkhau) async {
  //var khachHang = KhachHang.empty();

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangKy"),
        body: {"Username": "$username", "Email": "$email", "MatKhau": "$matkhau"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}
}

Future<dynamic> api_Update_KhachHang(KhachHang khachHang) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}?_method=PUT");

  try {
    final response = await http.post(
      uri,
      body: json.encode(khachHang.toJson()),
      headers: {"accept": "application/json", "content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}
}

Future<bool> api_sendEmail_User_Reset(String username) async {
  bool _guiEmailThanhCong = false;
  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "sendEmail-User-Reset"),
        body: {"Email": "$username", "Username": "$username"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      _guiEmailThanhCong = jsonRaw["Success"];
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return _guiEmailThanhCong;
}

//them du lieu vao gio hang
// ignore: non_constant_identifier_names
Future<bool> api_HoaDon_LapHoaDon(int khachHangId) async {
  final url = urlBaseAPI + 'HoaDon/LapHoaDon';

  try {
    final cartProvider = CartProvider();
    final cart = await cartProvider.getData();

    if (cart.isEmpty) return false;

    List<Map<String, dynamic>> value = [];
    for (var item in cart) {
      value.add({"SanPhamId": "${item.productId}", "SoLuong": "${item.quantity}"});
    }
    final body = json.encode({"KhachHangId": "$khachHangId", "Data": value});
    final response = await http.post(Uri.parse(url),
        body: body, headers: {"accept": "application/json", "content-type": "application/json"});
    if (response.statusCode == 200) {
      return await cartProvider.deleteAllCart();
    }
  } catch (e) {}
  return false;
}

Future<dynamic> api_Update_KhachHang_HinhAnh(KhachHang khachHang, File imageFile) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}?_method=PATCH");

  try {
    //tao 1 request chua 1 hinh anh
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('HinhAnh', imageFile.path));
    //gui request do len sever, sever se luu hinh anh
    final streamedResponse = await request.send();
    //lay ket qua json tra ve cua sever
    final response = await http.Response.fromStream(streamedResponse);
    if (streamedResponse.statusCode == 200) {
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (streamedResponse.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${streamedResponse.statusCode}");
    }
  } catch (e) {}
}

Future<dynamic> api_Update_KhachHang_MatKhau(
    KhachHang khachHang, String oldPassword, String newPassword, String confirmPassword) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}/updatePassword?_method=PUT");

  try {
    final response = await http.post(
      uri,
      body: {
        "oldMatKhau": "$oldPassword",
        "MatKhau": "$newPassword",
        "XacNhan_MatKhau": "$confirmPassword"
      },
    );
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}
}
