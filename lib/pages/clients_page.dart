import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/client_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/client_events.dart';
import 'package:flutter_bloc_tutorial/blocs/client_state.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  // final clientsList = [];
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return ['Maria Almeida', 'Vinicius Silva', 'Luiz Williams', 'Bianca Nevis']
        .elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // bloc.add(AddClientEvent(client: Client(nome: randomName())));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<ClientBloc, ClientState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is ClientInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ClientSuccessState) {
                    final clientsList = state.clients;
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height:
                          500, // Defina uma altura fixa ou ajuste conforme necessário
                      child: ListView.separated(
                        itemCount: clientsList.length,
                        itemBuilder: (context, index) => Table(
                          // border: TableBorder.all(),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Center(
                                      child:
                                          Text(clientsList[index].numeroVenda)),
                                ),
                                TableCell(
                                  child: Center(
                                      child: Text(clientsList[index].vendedor)),
                                ),
                                TableCell(
                                  child: Center(
                                      child: Text(clientsList[index].data)),
                                ),
                                TableCell(
                                  child: Center(
                                      child:
                                          Text(clientsList[index].entregueAte)),
                                ),
                              ],
                            ),

                            // Outras linhas de dados...
                          ],
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    );
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}

class ColunaTable extends StatelessWidget {
  const ColunaTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      // border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            TableCell(
              child: Center(child: Text('NÚMERO OV')),
            ),
            TableCell(
              child: Center(child: Text('VENDEDOR')),
            ),
            TableCell(
              child: Center(child: Text('DATA')),
            ),
            TableCell(
              child: Center(child: Text('FATURAMENTO')),
            ),
            TableCell(
              child: Center(child: Text('ENTREGUE ATÉ')),
            ),
          ],
        ),

        // Outras linhas de dados...
      ],
    );
  }
}

class OrdensTable extends StatelessWidget {
  const OrdensTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      // border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            TableCell(
              child: Center(child: Text('NÚMERO OV')),
            ),
            TableCell(
              child: Center(child: Text('VENDEDOR')),
            ),
            TableCell(
              child: Center(child: Text('DATA')),
            ),
            TableCell(
              child: Center(child: Text('ENTREGUE ATÉ')),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Center(child: Text('0165165')),
            ),
            TableCell(
              child: Center(child: Text('ELESIO OLIVEIRA')),
            ),
            TableCell(
              child: Center(child: Text('10/12/2023')),
            ),
            TableCell(
              child: Center(child: Text('30/12/2023')),
            ),
          ],
        ),

        // Outras linhas de dados...
      ],
    );
  }
}
