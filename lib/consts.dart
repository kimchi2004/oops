import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_prj/models/cart_model.dart';
import 'package:ecommerce_prj/models/mobi_model.dart';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color gray = Color.fromARGB(255, 143, 156, 168);
const Color blue = Color.fromARGB(255, 27, 53, 131);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);

List<MobileModel> mobilist = [
  MobileModel(
      name: 'Iphone 13 pro max',
      img: 'assets/dt1.jpg',
      company: 'Apple',
      title: "this phone",
      price: 923,
      isselected: false,
      color:gray),
  MobileModel(
      name: 'Iphone 12 pro ',
      img: 'assets/dt2.jpg',
      company: 'Apple',
        title: "this phone",
      price: 703,
      isselected: false,
      color: Colors.amber.shade700),
  MobileModel(
      name: 'Iphone 14 pro max',
      img: 'assets/dt3.jpg',
      company: 'Apple',
        title: "this phone",
      price: 700,
      isselected: false,
      color: gray),
      MobileModel(
      name: 'Iphone 12 pro ',
      img: 'assets/dt4.jpg',
      company: 'Apple',
      title: "this phone",
      price: 823,
      isselected: false,
      color:gray),
  MobileModel(
      name: 'Iphone 13 pro ',
      img: 'assets/dt5.jpg',
      company: 'Apple',
        title: "this phone",
      price: 803,
      isselected: false,
      color: Colors.amber.shade700),
  MobileModel(
      name: 'Iphone 14 pro ',
      img: 'assets/dt6.jpg',
      company: 'Apple',
        title: "this phone",
      price: 900,
      isselected: false,
      color: gray),
];

List<MobileModel> laptoplist = [
  MobileModel(
      name: 'Lenovo thinkpad',
      img: 'assets/lt1.jpg',
      company: 'Lenovo',
        title: "this laptop",
      price: 223,
      isselected: false,
      color: Colors.teal),
  MobileModel(
       name: 'Dell XPS',
      img: 'assets/lt2.jpg',
      company: 'Dell',
        title: "this laptop",
      price: 399,
      isselected: false,
      color: Colors.amber.shade700),
  MobileModel(
       name: 'Asus tufgaming',
      img: 'assets/lt3.jpg',
      company: 'Asus',
        title: "this laptop",
      price: 309,
      isselected: false,
      color: gray),
       MobileModel(
       name: 'Apple macbook pro 2022',
      img: 'assets/lt4.jpg',
      company: 'Apple',
        title: "this laptop",
      price: 499,
      isselected: false,
      color: Colors.amber.shade700),
  MobileModel(
       name: 'Apple macbook air 2022',
      img: 'assets/lt5.jpg',
      company: 'Apple',
        title: "this laptop",
      price: 509,
      isselected: false,
      color: gray),
];

List<MobileModel> phukienlist = [
  MobileModel(
      name: 'Tai nghe',
      img: 'assets/pk1.jpg',
      company: 'Apple',
        title: "this phukien",
      price: 199,
      isselected: false,
      color: Colors.amber.shade700),
  MobileModel(
      name: 'Tai nghe Airpod',
      img: 'assets/pk2.jpg',
      company: 'Asus',
       title: "this phukien",
      price: 167,
      isselected: false,
      color: gray),
  MobileModel(
      name: 'Apple watch serie 4',
      img: 'assets/pk3.jpg',
       title: "this phukien",
      company: 'Dell',
      price: 133,
      isselected: false,
      color: red),
       MobileModel(
      name: 'Apple watch ultra',
      img: 'assets/pk4.jpg',
      company: 'Asus',
       title: "this phukien",
      price: 167,
      isselected: false,
      color: gray),
  MobileModel(
      name: 'dây sạc',
      img: 'assets/pk5.jpg',
       title: "this phukien",
      company: 'Apple',
      price: 33,
      isselected: false,
      color: red),
];

List<MobileModel> all = mobilist + laptoplist + phukienlist;

// List sizes = [40, 41, 42, 43, 44];

List<CartModel> boughtitems = [];
List<MobileModel> favouriteitems = [];

double total = 0.00;
