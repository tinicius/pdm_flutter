import 'package:flutter/material.dart';
import 'package:pdm/components/perfil_page_components/perfil_button.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  ScrollController _scrollController = new ScrollController();

  final String url = "";

  final posts = [];

  void initState() {
    tabController = TabController(length: 4, vsync: this);

    for (var i = 0; i < 7; i++) {
      posts.add(url);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
        title: Text('Nome'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //Cabeçalho
              child: Column(
                children: [
                  Container(
                    //Foto
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                //color: Colors.black,
                              ),
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/foto.jpg',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "24",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Publicações")
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "24",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Seguidores")
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "24",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Seguindo")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      //Infos
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome Sobrenome",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text("16y"),
                          ),
                          Row(
                            children: [
                              Text("Seguido por "),
                              Text(
                                "Pessoa 1,",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Pessoa 1,",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Pessoa 1,",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Pessoa 1,",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //Botões
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PerfilButton(
                            onPressed: () {},
                            text: 'Editar Perfil',
                            size: size,
                            padding: EdgeInsets.only(left: 0, right: 0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Material(
                color: Color.fromRGBO(250, 250, 250, 1),
                child: TabBar(
                  indicatorColor: Colors.black,
                  controller: tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: RotatedBox(
                          quarterTurns: 3,
                          child: Icon(Icons.view_array_outlined)),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.movie_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.assignment_ind_outlined),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.6,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  //Page 1
                  Container(
                    //height: 1000,
                    //color: Colors.blue,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, item) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              //color: Colors.red,
                            ),
                            child: Image.asset(
                              'assets/images/foto.jpg',
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        }),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Page 2'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Page 3'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Page 4'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
