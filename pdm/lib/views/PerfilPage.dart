import 'package:flutter/material.dart';
import 'package:pdm/components/perfil_page_components/perfil_button.dart';
import 'package:pdm/controllers/PerfilPageController.dart';
import 'package:pdm/data/models/user.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage>
    with SingleTickerProviderStateMixin {

  PerfilPageController _controller = new PerfilPageController();
  User? user = new User(name: "Vinicius Alves", description: 'Hello World!', images: []);

  void initState() {
    _controller.initTabController(length: 4, vsync: this);

    for (var i = 0; i < 22; i++) {
      user!.addImages(_controller.url);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.size = MediaQuery.of(context).size;

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
          mainAxisSize: MainAxisSize.min,
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
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/foto.jpg',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      child: ClipOval(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            color: Colors.blue,
                                            height: 20,
                                            width: 20,
                                            child: Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 14,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //color: Colors.black,
                              ),
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
                            size: _controller.size,
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
                  controller: _controller.tabController,
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
              height: (user!.images!.length / 3) * ((_controller.size.width) / 3) + 50,
              child: TabBarView(
                controller: _controller.tabController,
                children: <Widget>[
                  //Page 1
                  Container(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: user!.images!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: (_controller.size.width - 4) / 3,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, item) {
                          return Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1.0),
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
