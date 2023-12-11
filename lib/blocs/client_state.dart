import 'package:flutter_bloc_tutorial/models/client.dart';

abstract class ClientState {
  List<Venda> clients;

  ClientState({
    required this.clients,
  });
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required List<Venda> clients}) : super(clients: clients);
}
