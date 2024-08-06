class ApiRoutes {
  static final BASE_URL = LOCAL;
  static final PROD = 'http://';
  static final LOCAL = 'http://192.168.56.1:8080/api';

  // Users
  static const LOGIN = "/auth";
  static const USER = "/user/getUser";
  static const SAVE_USER = "/user";

  // Worker
  static const WORKER = "/worker";
  static const WORKER_BY_USER_ID = "/worker/user/";

  // Vagas
  static const VAGAS = "/job";
  static const VAGAS_BY_ID = "/job/{id}";
  static const VAGAS_INSCRITAS = "/job/user";
  static const PEDIDO = "/pedidos.json";

  // Inscricao
  static const INSCRICAO = "/api/application";

  // Produtos
  static const PRODUTO_CREATE = "";
  static const PRODUTO_UPDATE = "";
  static const PRODUTO_DELETE = "";
  static const PRODUTOS_READ = "";
  static const PRODUTO_TOGGLE_FAVORITE = "/produtos/{id}.json";


}
