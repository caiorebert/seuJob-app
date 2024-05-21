class ApiRoutes {
  static final BASE_URL = LOCAL;
  static final PROD = 'http://';
  static final LOCAL = 'http://192.168.2.7:8080/api';

  // Users
  static const LOGIN = "/auth";

  static const USER = "/user/getUser";

  // Pedido
  static const PEDIDO_CREATE = "/pedidos.json";
  static const PEDIDO = "/pedidos.json";

  // Produtos
  static const PRODUTO_CREATE = "";
  static const PRODUTO_UPDATE = "";
  static const PRODUTO_DELETE = "";
  static const PRODUTOS_READ = "";
  static const PRODUTO_TOGGLE_FAVORITE = "/produtos/{id}.json";
}
