# Autoponia App

Solução do desafio de Flutter da Autoponia.

## Como Rodar o App

- Instalar o pacote [dartion](https://pub.dev/packages/dartion) para rodar o servidor local.
    - Se não tiver o pacote instalado, instale! [Artigo (de 4 min)](https://medium.com/@correiarangel/mini-servidor-web-no-flutter-com-dartion-56c43e57d225) que ensina a instalação em poucos paços.
    - Pelo terminal, entre ma pasta `server` do projeto e roda o comando `dartion serve` para iniciar o servidor. 
        - A porta configurada é `5555`, se precisar trocar vá em `server/config.yaml` .

- Para conseguir acessar o servidor sem grandes problemas, rode o App no Emulador Android, Desktop ou Web.

## Arquitetura do Projeto

- Arquitetura Modular usando o pacote [flutter_modular](https://pub.dev/packages/flutter_modular) para Navegação e Injeção de Dependências
- Cada módulo segue:
    - O padrão MVVM, seguindo os conceitos do BLoC
    - O padrão serviço
    - O padrão protótipo
- Gerenciamento de Estado é feito usando o pacote [flutter_bloc](https://pub.dev/packages/flutter_bloc)





