class ApiRoutes {
  static final BASE_URL = LOCAL;
  static final PROD = 'http://';
  static final LOCAL = 'http://192.168.31.38:1414/api';

  // Users
  static const LOGIN = "/auth";

  static const USER = "/user/getUser";

  // Vagas
  static const VAGAS = "/job";
  static const VAGAS_BY_ID = "/api/job/{id}";
  static const PEDIDO = "/pedidos.json";

  // Inscricao
  static const INSCRICAO = "/api/application";
  static const VAGAS_INSCRITAS = " ";

  // Produtos
  static const PRODUTO_CREATE = "";
  static const PRODUTO_UPDATE = "";
  static const PRODUTO_DELETE = "";
  static const PRODUTOS_READ = "";
  static const PRODUTO_TOGGLE_FAVORITE = "/produtos/{id}.json";


}
