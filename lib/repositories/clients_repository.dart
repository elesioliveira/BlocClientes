import 'package:flutter_bloc_tutorial/models/client.dart';

class ClientsRepository {
  List<Venda> vendas = [];

  List<Venda> loadClients() {
    vendas.addAll([
      Venda(
          numeroVenda: 'NUMERO OV',
          vendedor: 'VENDEDOR',
          data: 'DATA',
          entregueAte: 'ENTREGUE ATE'),
      Venda(
          numeroVenda: '123564',
          vendedor: 'Elesio',
          data: '10/12/2023',
          entregueAte: '30/12/2023'),
      Venda(
          numeroVenda: '123564',
          vendedor: 'Joao',
          data: '10/12/2023',
          entregueAte: '30/12/2023'),
      Venda(
          numeroVenda: '123564',
          vendedor: 'Adriano',
          data: '10/12/2023',
          entregueAte: '30/12/2023'),
      Venda(
          numeroVenda: '123564',
          vendedor: 'Maria',
          data: '10/12/2023',
          entregueAte: '30/12/2023'),
    ]);
    return vendas;
  }

  List<Venda> addClient(Venda client) {
    vendas.add(client);
    return vendas;
  }

  List<Venda> removeClient(Venda client) {
    vendas.remove(client);
    return vendas;
  }
}
