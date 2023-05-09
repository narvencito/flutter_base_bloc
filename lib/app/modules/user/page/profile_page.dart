// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.55,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/profile/huanta.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 20),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Perfil',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 10),
                              child: Icon(
                                Icons.shopping_basket_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile/photo.jpg'),
                    ),
                    const Text(
                      'Emerson Navarro',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      'Full Stack developer',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        titleAndSubtitle('2k', 'Amigos'),
                        titleAndSubtitle('26', 'Comentarios'),
                        titleAndSubtitle('48', 'Reacciones'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Acerca de mi',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Soy un apasionado de la tecnología y un desarrollador Full Stack con experiencia en proyectos web de alta calidad. Me encanta trabajar en equipo y colaborar en el diseño y desarrollo de soluciones tecnológicas innovadoras y de vanguardia.',
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Además, siempre estoy en búsqueda de nuevos conocimientos y tendencias en el mundo de la tecnología para mejorar y actualizar mis habilidades en el desarrollo de software. Mi experiencia y pasión por la tecnología me han llevado a trabajar en proyectos personales como el desarrollo de sistemas de gestión de tareas y aplicaciones de reconocimiento facial.',
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Siempre me gusta estar al día en las últimas tendencias y tecnologías, por lo que me involucro en la participación en comunidades de programadores en línea, asisto a conferencias y eventos relacionados con la tecnología.',
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Estoy entusiasmado con la oportunidad de unirme a un equipo en el que pueda contribuir con mis habilidades y experiencia para desarrollar soluciones tecnológicas innovadoras y de alto impacto.',
                      style: TextStyle(color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 50,
                        color: Colors.blue,
                      ),
                      Icon(
                        FontAwesomeIcons.linkedin,
                        size: 50,
                        color: Colors.blue,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: 50,
                        color: Colors.purple,
                      ),
                      Icon(
                        FontAwesomeIcons.github,
                        size: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget titleAndSubtitle(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
