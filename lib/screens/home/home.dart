import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:viaja_plus/screens/home/appbar.dart';
import 'package:viaja_plus/Util/styles.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Key? formKey = GlobalKey<FormState>();
  String? origen;
  String? destino;
  DateTime? partida;
  DateTime? regreso;
  int? cantidadPasajeros;

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
                    FormularioHome()
                  ]
                )
            );
        },
      ),
    );
  }
}

class FormularioHome extends StatefulWidget {
  const FormularioHome({super.key});

  @override
  State<FormularioHome> createState() => _FormularioHomeState();
}

class _FormularioHomeState extends State<FormularioHome> {
  final _formKey = GlobalKey<FormState>();

  String? origen;
  String? destino;
  DateTime? partida;
  DateTime? regreso;
  int? cantidadPasajeros;
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 600,
        height: 290,
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
                //Origen
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? origen) {
                          if(origen == null || origen.isEmpty){
                            return "El origen no puede estar vacío";
                          }
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Ingrese Terminal',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (String? origenTextField) {
                          setState(() => origen = origenTextField);
                        },
                      ),
                    ),
                  ],
                ),
                //Destino
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? destino) {
                          if(destino == null || destino.isEmpty){
                            return "El destino no puede estar vacío";
                          }
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Ingrese Terminal',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (String? destinoTextField) {
                          setState(() => destino = destinoTextField);
                        },
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
                    //fecha partida 
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: TextFormField(
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Ingrese Fecha',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onTap: () async {
                                DateTime? fechaElegidaPartida = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year),
                                    lastDate: DateTime.now().add(const Duration(days: 365))
                                  );
    
                                if (fechaElegidaPartida != null) {
                                  print(fechaElegidaPartida);
                                  String fechaFormateadaPartida = DateFormat('dd/MM/yyyy').format(fechaElegidaPartida);
                                  print("Partida: $fechaFormateadaPartida");
    
                                  setState(() {
                                    partida = fechaElegidaPartida;
                                  });
                                }else{
                                  print("No se seleccionó fecha");
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    //fecha regreso
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Regreso',
                          style: GoogleFonts.notoSerifBalinese(
                            textStyle: textoAlterno,
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: TextFormField(
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Ingrese Fecha',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onTap: () async {
                                DateTime? fechaElegidaRegreso = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year),
                                    lastDate: DateTime.now().add(const Duration(days: 365))
                                  );
    
                                if (fechaElegidaRegreso != null) {
                                  print(fechaElegidaRegreso);
                                  String fechaFormateadaRegreso = DateFormat('dd/MM/yyyy').format(fechaElegidaRegreso);
                                  print("Regreso: $fechaFormateadaRegreso");
    
                                  setState(() {
                                    regreso = fechaElegidaRegreso;
                                  });
                                }else {
                                  print("No se seleccionó fecha");
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    //pasajeros
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (String? pasajeros) {
                                if(pasajeros == null || pasajeros.isEmpty) {
                                  return "Los pasajeros no pueden ser 0";
                                }
                                if(int.tryParse(pasajeros) == null){
                                  return "Debe ingresar un número";
                                }
                              },
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: 'Ingrese cantidad',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (String? value) {
                                if (value != null){
                                  setState(() => cantidadPasajeros = int.tryParse(value));
                                }
                              },
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
    );
  }
}
