import 'package:flutter/material.dart';

import '../classes/contact.dart';

class ContactsProvider with ChangeNotifier {

  final List<Contact> _lTeachers = [
    Contact( sName: 'Carolina Pérez', sPhoto: 'assets/images/teachers/01.jpg' ),
    Contact( sName: 'Dexi Cordero', sPhoto: 'assets/images/teachers/02.jpg' ),
    Contact( sName: 'Ricardo Gómez', sPhoto: 'assets/images/teachers/03.jpg' ),
    Contact( sName: 'Tatiana Gutiérrez', sPhoto: 'assets/images/teachers/04.jpg' ),
    Contact( sName: 'Wilmer Eduardo Esteban', sPhoto: 'assets/images/teachers/05.jpg' ),
    Contact( sName: 'Wilson Rodríguez', sPhoto: 'assets/images/teachers/06.jpg' ),
    Contact( sName: 'Zharick Vera', sPhoto: 'assets/images/teachers/07.jpg' )
  ];

  final List<Contact> _lParents = [
    Contact( sName: 'Andrea Milena Oviedo', sPhoto: 'assets/images/parents/01.jpg' ),
    Contact( sName: 'Carlos Tarazona', sPhoto: 'assets/images/parents/02.jpg' ),
    Contact( sName: 'Fabián Alexis Celis', sPhoto: 'assets/images/parents/03.jpg' ),
    Contact( sName: 'Gabriela Blanco', sPhoto: 'assets/images/parents/04.jpg' ),
    Contact( sName: 'Juliana Baez', sPhoto: 'assets/images/parents/05.jpg' ),
    Contact( sName: 'Luis Carlos Ruíz', sPhoto: 'assets/images/parents/06.jpg' ),
    Contact( sName: 'Paula Rueda Moreno', sPhoto: 'assets/images/parents/07.jpg' ),
    Contact( sName: 'Rosa Delia Joya', sPhoto: 'assets/images/parents/08.jpg' ),
  ];

  List<Contact> get lTeachers => _lTeachers;
  List<Contact> get lParents => _lParents;

}