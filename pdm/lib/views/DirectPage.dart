import 'package:flutter/material.dart';
import 'package:pdm/components/direct_components/message_tile.dart';
import 'package:pdm/components/direct_components/message_title.dart';
import 'package:pdm/components/direct_components/search.dart';
import 'package:pdm/data/models/message.dart';
import 'package:pdm/data/models/user.dart';

class DirectPage extends StatefulWidget {
  const DirectPage({Key? key}) : super(key: key);

  @override
  _DirectPageState createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  List<Message> msgs = [
    Message(
        user: User(
            name: "Sofia Lara",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher3.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: true),
    Message(
        user: User(
            name: "lil_lapislazull",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Legal!',
        time: DateTime.now(),
        muted: false,
        online: true,
        read: false,
        status: false),
    Message(
        user: User(
            name: "loft232",
            description: 'description',
            images: [],
            image: 'assets/images/pessoas/homem1.jpg'),
        lastText: 'Oque você acha?',
        time: DateTime.now(),
        muted: true,
        online: false,
        read: true,
        status: false),
    Message(
        user: User(
            name: "dark_emeralds",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher3.jpg'),
        lastText: 'Que casa incrível!',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: true),
    Message(
        user: User(
            name: "eloears",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: false),
    Message(
        user: User(
            name: "Renato",
            description: '',
            images: [],
            image: 'assets/images/pessoas/homem2.jpg'),
        lastText: 'a',
        time: DateTime.now(),
        muted: true,
        online: true,
        read: true,
        status: true),
    Message(
        user: User(
            name: "Sofia Lara",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher1.jpg'),
        lastText: 'Olá, bom dia!',
        time: DateTime.now(),
        muted: false,
        online: true,
        read: true,
        status: true),
    Message(
        user: User(
            name: "lil_lapislazull",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Legal!',
        time: DateTime.now(),
        muted: false,
        online: true,
        read: false,
        status: false),
    Message(
        user: User(
            name: "loft232",
            description: 'description',
            images: [],
            image: 'assets/images/pessoas/homem1.jpg'),
        lastText: 'Oque você acha?',
        time: DateTime.now(),
        muted: true,
        online: false,
        read: true,
        status: false),
    Message(
        user: User(
            name: "dark_emeralds",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher3.jpg'),
        lastText: 'Que casa incrível!',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: true),
    Message(
        user: User(
            name: "eloears",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: false),
    Message(
        user: User(
            name: "paulaguzman",
            description: '',
            images: [],
            image: 'assets/images/pessoas/homem2.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: true,
        online: true,
        read: true,
        status: true),
    Message(
        user: User(
            name: "Sofia Lara",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher1.jpg'),
        lastText: 'Olá, bom dia!',
        time: DateTime.now(),
        muted: false,
        online: true,
        read: true,
        status: true),
    Message(
        user: User(
            name: "lil_lapislazull",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Legal!',
        time: DateTime.now(),
        muted: false,
        online: true,
        read: false,
        status: false),
    Message(
        user: User(
            name: "loft232",
            description: 'description',
            images: [],
            image: 'assets/images/pessoas/homem1.jpg'),
        lastText: 'Oque você acha?',
        time: DateTime.now(),
        muted: true,
        online: false,
        read: true,
        status: false),
    Message(
        user: User(
            name: "dark_emeralds",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher3.jpg'),
        lastText: 'Que casa incrível!',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: true),
    Message(
        user: User(
            name: "eloears",
            description: '',
            images: [],
            image: 'assets/images/pessoas/mulher2.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: false,
        online: false,
        read: false,
        status: false),
    Message(
        user: User(
            name: "paulaguzman",
            description: '',
            images: [],
            image: 'assets/images/pessoas/homem2.jpg'),
        lastText: 'Olá',
        time: DateTime.now(),
        muted: true,
        online: true,
        read: true,
        status: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Direct"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.edit_outlined),
          )
        ],
      ),
      body: FutureBuilder(
        future: _loadChat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: _widgetsList,
            ),
          );
        },
      ),
    );
  }

  _loadChat() async {
    msgs.forEach((element) {
      var tile = MessageTile(message: element);
      _widgetsList.add(tile);
    });

    Future.delayed(Duration(seconds: 5));
  }

  List<Widget> _widgetsList = [
    //Pesquisar
    SearchBar(),
    //Mensagens
    MessageTitle(solicitations: 10),
  ];
}
