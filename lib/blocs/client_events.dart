import 'package:flutter_bloc_tutorial/models/client.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  Venda client;

  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  Venda client;

  RemoveClientEvent({
    required this.client,
  });
}
