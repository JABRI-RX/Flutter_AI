import 'package:flutter/material.dart';
import 'package:tp/services/auth.dart';

import 'UIColors.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  late AuthService authService;
  late String? userName = "";
  bool is_Loading = false;
  void logout() {
    setState(() {
      is_Loading = true;
    });
    authService.logout().then((val){
      Navigator.pushNamed(context, "/");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService = AuthService();
    userName = authService.getCurrentUser()?.displayName;
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: UIColors.black,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: UIColors.white,
                  radius: 30,
                  child: Icon(Icons.person_2,size: 30,),
                ),
                const SizedBox(width: 20,),
                Text(
                  userName ?? "test",
                  style: const TextStyle(color: UIColors.white),)
              ],
            )
          ),
           ExpansionTile(
            title: const Text("Image Classification Model"),
            children: [
               ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/ann");
                },
                title: const Text("ANN Model"),
              ),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/cnn");
                },
                title: const Text("CNN Model"),
              ),

            ],
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/spp");
            },
            title: const Text("Stock Price Prediction"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, '/voa');
            },
            title: const Text("Vocal Assistant "),
          ),
           ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/rag");
            },
            title: const Text("RAG"),
          ),
          const Spacer(),
          is_Loading ? const CircularProgressIndicator() : Text(""),
          ListTile(
            minTileHeight: 80,
            onTap: (){
              logout();
            },
            title:  Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                color: UIColors.black,
                width: double.infinity,
                height: 30,
                child: const Center(
                  child: Text("Log Out",
                    style: TextStyle(fontSize: 15,color: UIColors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
