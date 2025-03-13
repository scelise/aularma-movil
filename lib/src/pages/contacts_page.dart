import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../classes/contact.dart';

import '../providers/contacts_provider.dart';

import '../utils/responsive_app.dart';

import '../widgets/contacts_widgets/navigation_tabs.dart';
import '../widgets/contacts_widgets/item_contact_list.dart';

class ContactsPage extends StatefulWidget {
   
  const ContactsPage( { super.key } );

  @override
  State<ContactsPage> createState() => _ContactsPageState();

}

class _ContactsPageState extends State<ContactsPage> {

  Set<String> selected = { 'Profesores' };

  List<Contact> lContacts = [];

  @override
  Widget build( BuildContext context ) {

    final contactsProvider = Provider.of<ContactsProvider>( context );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          NavigationTabs(
            selected: selected,
            onSelectionChanged: ( p0 ) => setState( () => selected = p0 )
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selected.contains('Papás') ? contactsProvider.lParents.length : contactsProvider.lTeachers.length,
              itemBuilder: ( context, index ) => ItemContactList(
                sImage: selected.contains('Papás') ? contactsProvider.lParents[index].sPhoto! : contactsProvider.lTeachers[index].sPhoto!,
                sName: selected.contains('Papás') ? contactsProvider.lParents[index].sName! : contactsProvider.lTeachers[index].sName!
              )
            )
          )
        ]
      )
    );
  }
}