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
                Image.network(
                  'https://blog.redbus.pe/wp-content/uploads/2022/08/Plaza-de-Armas-Huanta.jpg',
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
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
                      backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/ae6j4Wfe7BamdodUTtXIiyUD8u3sLXQ3VUJQigeMiudzZDM7kIWPGAi0M4CC-F4P2Gw-ue5J3Stq8g-nv6z2Y8yexK5rOxvUnxLqeX-mP0ENPSMOcxe9FSLaN9dFCiOQQ6JNFBmDG0qECRReZnNzfHhklq9mlmhGxgDLNsLeMAjdYMUhSHtbqvK-KDOaXdfPJxzgaUcIm9Zrhe9fqEw2f-Y_0a8i40PRsYUkIiH35ITTRYdxqHxAzOrz4o-HD4FbI_Qs20WOv8SJ3_EWzJwqOYgkswEsXZi0HRjUX4zIkzlvC9ma7yrjmkL5s4r3_4fHyjQxC_KZnT_5WguFMz4p9c1tFLUhaEn77D8F4XhjVZuKBoSLdUa03cZYHmkttoDKM36DGKiRY2I5bEzBg8Wn71y-pDy_NZvrneMEbPFKJ6V4v-s2EOy90pDiK3ZbIAWedzJoXIO0JehRok1wM3G7BDlICIXI9Az4C7crBR5erNWUbAJZ6NCmv491jlU6ePEyyu28lniXTHVEeUwBIlz0478Q3al0YHd5qYhMcJOKhZGtL92nRMsqpdsTyexMldT-1lBGmuPDI7dj22StX2Gv9DV3HqjcGbEV_6y4T5fDEc3a8EEhHNhWSF_nAqqc5Db_pYfB9h_IhKOFbHh_YSaaObuYg-R7Nf0oluD-83pPf3vCMAAMg2M_HlmW4dawOggQaKzF3DS9e4TaDBKc1oos31x--x5ovNeKb4vgpfSpAg346vJPvjYsX1It_MGp-ZcjSIAXUEaAaxbiBrM9KLqtPYUkwIdkm3KUsSZ08wBz0vnLI4Tj5JxJ_3uIWtjpO1ySR0TMh7WrBEdjX0fY3XtpEJYNzgNoylHAcqpSpkXOuZX2ad2AGf9KHFp8_UfHEEq-vdyTd2E5J69jAaiKH1C8Ijk5547SPPcuhP6L09SUHRh72wm71-QKmc54nFuGVuVViAN_ScXyjEwhMipWsWSEuIYE-RTRUfr52ASBizY3eB5oyG7GzH_677o=w1247-h939-s-no?authuser=0',
                      ),
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
