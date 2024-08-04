import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seujobapp/utils/app_routes.dart';

import '../../providers/theme_provider.dart';

class DicasPage extends StatefulWidget {
  @override
  _DicasPageState createState() => _DicasPageState();
}

class _DicasPageState extends State<DicasPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Dicas de uso:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
            },
          ),
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: Text(
                'Estruturação do Currículo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              children: [
                // Conteúdo da seção "Estrutura do Currículo"
                ListTile(title: Text(
                  '1. Cabeçalho: Deve ser inserido o Nome completo, assim como as informações de contato, bem como o cargo desejado;'
                )),
                ListTile(title: Text(
                  '2. Experiência Profissional: Deve inserir a seguinte estrutura, Cargo: Nome do cargo, nome da empresa e período de atuação (mês/ano).'
                  '* Conquistas e Responsabilidades: Use verbos de ação (ex: gerenciei, implementei, desenvolvi) para descrever suas atividades e resultados alcançados. Quantifique sempre que possível (ex: aumentei as vendas em 15%). Ordem Cronológica Reversa: Comece pela experiência mais recente;'
                )),
                ListTile(title: Text(
                    '3. Formação Acadêmica: Nome do Curso: Nível (graduação, pós, etc.), nome da instituição e período de conclusão;'
                )),
                ListTile(title: Text(
                    '4. Habilidades: *Técnicas (Hard Skills): Domínio de softwares, linguagens de programação, ferramentas específicas, etc. *Comportamentais (Soft Skills): Comunicação, liderança, trabalho em equipe, resolução de problemas, etc.  *Idiomas: Nível de proficiência (fluente, intermediário, básico'
                )),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Conteúdos adicionais do Currículo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              children: [
                // Conteúdo da seção "Conteúdo do Currículo"
                ListTile(title: Text(
                    '* Resumo Profissional: 2-3 frases: Destacando suas principais habilidades, experiências e o que você traz de valor para a empresa.'
                )),
                ListTile(title: Text(
                    '* Informações Adicionais: Cursos, Liste os cursos complementares mais relevantes para a vaga. Certificações, Inclua certificações importantes para a área. Trabalhos Voluntários, Se relevantes para a vaga, podem demonstrar suas habilidades e valores. Prêmios e Reconhecimentos, Inclua apenas os mais relevantes.'
                )),
                ListTile(title: Text(
                    '* Dicas: Adapte o currículo para cada vaga, Destaque as experiências e habilidades mais relevantes para a posição desejada. Use palavras-chave, Inclua termos que aparecem na descrição da vaga para chamar a atenção dos recrutadores.'
                )),
              ],
            ),
            ExpansionTile(
              title: Text(
                  'Preenchimento de informações',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              children: [
                // Conteúdo da seção "Estrutura do Currículo"
                ListTile(title: Text(
                    '* É primordial o preenchimento das suas informações de contato na aba Meu Perfil, isso facilitará o contato das empresas no processo seletivo;'
                )),
                ListTile(title: Text(
                    '* Demais informações como o endereço podem ser preenchidas com o sistema de localização implementado no app, além disso o curriculo pode ser carregado como arquivo, mas não retira a obrigação do preenchimento da aba de dados profissionais.'
                )),
              ],
            ),
            ExpansionTile(
              title: Text(
                  'Uso do App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              children: [
                // Conteúdo da seção "Estrutura do Currículo"
                ListTile(title: Text(
                    '* O uso de app se da pela escolha de vagas que se encaixem com seu perfil e a submissão da inscrição;'
                )),
                ListTile(title: Text(
                    '* Através do menu lateral você tem acesso a funcionalidades como a estatistica de inscrições realizadas no período, além de recomendações de vagas com base no seu cadastro e acesso aos perfis das empresas cadastradas;'
                )),
                ListTile(title: Text(
                    '* Notificações sempre chegam informando o status dos processos seletivos o quais você está inscrito!'
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
