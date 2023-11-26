import 'package:flutter/material.dart';
import 'package:viaja_plus/screens/home/appbar.dart';
import 'package:viaja_plus/Util/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                  alignment: const AlignmentDirectional(0, -1),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(color: blackOlive),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/background.jpeg',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 600,
                      height: 260,
                      decoration: const BoxDecoration(color: Color(0x32FFFFFF)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Origen',
                                    style: GoogleFonts.notoSerifBalinese(
                                      textStyle: textoAlterno,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                    child: TextFormField(
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        hintText: 'Ingrese Terminal',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Destino',
                                    style: GoogleFonts.notoSerifBalinese(
                                      textStyle: textoAlterno,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                    child: TextFormField(
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        hintText: 'Ingrese Terminal',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Partida',
                                        style: GoogleFonts.notoSerifBalinese(
                                          textStyle: textoAlterno,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 8, 0),
                                          child: TextFormField(
                                            //agregar showDatePicker
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              hintText: 'Ingrese Fecha',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Regreso (opcional)',
                                        style: GoogleFonts.notoSerifBalinese(
                                          textStyle: textoAlterno,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 8, 0),
                                          child: TextFormField(
                                            //agregar showDatePicker
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              hintText: 'Ingrese Fecha',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pasajeros',
                                        style: GoogleFonts.notoSerifBalinese(
                                          textStyle: textoAlterno,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 8, 0),
                                          child: TextFormField(
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              hintText: 'Ingrese cantidad',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              );
        },
      ),
    );
  }
}
