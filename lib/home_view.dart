import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mercy_contact_app/contact_details_view.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
   Homeview({ Key? key }) : super(key: key);

  final ScrollController _scrollController=ScrollController();

  final List<Map<String,String>> data =
  [
	{
		"name": "Rylee Leonard",
		"phone": "1-266-507-2572",
		"country": "Italy",
		"region": "Vermont",
		"email": "fringilla@icloud.edu"
	},
	{
		"name": "Miranda Ortega",
		"phone": "1-832-678-5170",
		"country": "India",
		"region": "Västra Götalands län",
		"email": "odio@protonmail.couk"
	},
	{
		"name": "Shaine Montoya",
		"phone": "510-9193",
		"country": "Germany",
		"region": "Sachsen",
		"email": "curabitur.sed@protonmail.ca"
	},
	{
		"name": "Fulton Becker",
		"phone": "1-179-151-7081",
		"country": "Spain",
		"region": "Berlin",
		"email": "quam.elementum@google.couk"
	},
	{
		"name": "Nehru Gallagher",
		"phone": "1-831-446-2668",
		"country": "India",
		"region": "Đà Nẵng",
		"email": "fringilla.purus@google.net"
	},
 {
		"name": "Moana Montoya",
		"phone": "664-5862",
		"country": "Belgium",
		"region": "Carinthia",
		"email": "tempus.lorem.fringilla@hotmail.com"
	},
	{
		"name": "Debra Holder",
		"phone": "1-474-143-1847",
		"country": "United States",
		"region": "Sakhalin Oblast",
		"email": "tempor.lorem.eget@google.com"
	},
	{
		"name": "Emily Atkins",
		"phone": "630-7626",
		"country": "Austria",
		"region": "Namen",
		"email": "auctor.velit@protonmail.edu"
	},
	{
		"name": "Wyatt Roberts",
		"phone": "1-961-113-4383",
		"country": "Poland",
		"region": "Xīnán",
		"email": "rutrum.justo@protonmail.edu"
	},
	{
		"name": "Dante Weaver",
		"phone": "223-8599",
		"country": "Ireland",
		"region": "Lambayeque",
		"email": "imperdiet@google.couk"
	},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,
        color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(radius: 25,
              backgroundImage: AssetImage('images/smile.jpg'),
              ),
            ),
          )
       ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize:  const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                hintText: 'search by name or number',
                prefixIcon: const Icon(Icons.search)
              ),
            ),
          ),
      ) 
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
         children:  [
            const Padding(
               padding:  EdgeInsets.symmetric(horizontal: 16),
               child: Text(
                 'Recent',
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
            ),
             ),
            ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context,index) {
                return  ListTile(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ContactDetailsView(
                        contact: Contact(country: 'Ghana',
                        email:'nessa@gmail.com',
                        name:'lizzysmith',
                        phone: '+233 54 67 689 934',
                        region: 'Greater Accra'));
                    }));
                  },
              leading:const  CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/afro.jpg'),
              ),
              title:const Text('Lizzy Smith',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
              ),
              subtitle:const Text('+233 54 46 88 134'),
              trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
            );
              }, 
              separatorBuilder: (context,index){
                return const Divider(
              indent: 25,
              thickness: 2,
                ); 
              },
              itemCount: 3),
               const Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                  'Contacts',
              style: TextStyle( fontSize: 14,fontWeight: FontWeight.w600),
              ),
            ),
             GroupedListView<Map<String, String>, String>(
               shrinkWrap: true,
               elements:  data,
         groupBy: (element) => element['name'].toString().substring(0,1),
          groupSeparatorBuilder: (String groupByValue) => 
          SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            groupByValue.substring(0,1),textAlign:
           TextAlign.right,style: 
          const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
        ),
          ),
          itemBuilder: (context, Map<String,String> element) {
            Contact contact =Contact.fromJson(element);
            return Column(
        children:  [
           ListTile(
             onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) {
            return   ContactDetailsView(contact: contact,);
             }));
             },
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/afro.jpg'),
                  ),
                  title: Text(
                    '${element['name']}',
                  style:const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('${element['phone']}'),
                  trailing: 
                  const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                ),
                const Divider(
              indent: 25,
              thickness: 2,
                )
            ],
          );
          },
          itemComparator: (item1, item2) => 
          item1['name']!.compareTo(item2['name']!), // optional
          useStickyGroupSeparators: true, // optional
          floatingHeader: true, // optional
          order: GroupedListOrder.ASC, // optional
        ) // GroupListView
      ],
     ),
    ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: (){
         
           
        },
        child: const Icon(Icons.add),
        ),
    );
 }
}