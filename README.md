# FindMe • PredialX

## Requisitos necessários para execução dos módulos

- Docker
  - Para instalar o Docker basta acessar a página de [download](https://www.docker.com/products/docker-desktop)
- Node (ou Yarn) e expo-cli (para o app mobile)
  - Para instalar o Node basta acessar a página de [download](https://nodejs.org/en/)
  - Para instalar o Expo, basta inserir no terminal, após a instalação do Node, o comando `npm install -g expo-cli`
  - (Opcional) caso queira utilizar o yarn como gerenciador de pacotes, após a instalação do Node, execute o comando `npm install -g yarn`
- Expo Go (no dispositivo mobile)
  - Para instalar o Expo Go em seu dispositivo, acesse a [Google Play](https://play.google.com/store/apps/details?id=host.exp.exponent) ou a [App Store](https://apps.apple.com/br/app/expo-go/id982107779)

## Preparação do Docker

- Após instalar o Docker, acesse o arquivo de hosts da máquina por um dos comandos abaixo:
  - Windows: `C:\Windows\System32\drivers\etc` e abra o arquivo hosts com o bloco de notas em modo administrador
  - Linux e Mac: insira o comando no terminal `sudo vim /etc/hosts`, insira sua senha para abrir o arquivo de hosts.
- Ao final do arquivo de hosts, insira: `127.0.0.1 host.docker.internal`. Salve o arquivo e **reinicie a máquina**.
- Esse procedimento se dá pela necessidade da conexão entre os containeres que serão usados neste projeto.

## Execução

### Executando a API e a aplicação Web

Insira o comando abaixo para subir os containeres Docker.

```bash
docker-compose up
```

ou (para caso não queira ver os logs)

```bash
docker-compose up -d
```

### Configuração do Keycloak

- Após o docker subir todos os containeres, acesse `localhost:8080`, entre em `Administration Console` e insira as credenciais (usuário: `admin` e senha: `admin`)
- Após logado, clique na opção `Import` no canto esquerdo da tela e depois em `select file`
- Com o explorador de arquivos aberto pela página, navegue até a pasta **.docker/keycloak** na raiz deste projeto e selecione o arquivo `configuration.json`
- Mantenha as configurações da forma que estão, alterando somente a última, de `fail` para `overwrite`

### Executando o aplicativo mobile

Insira o comando abaixo para subir a aplicação mobile.

```bash
npm start
```

ou

```bash
yarn start
```

O navegador abrirá e você poderá ler um QR Code - com o aplicativo Expo Go, baixando anteriormente - para abrir a aplicação mobile do projeto.

### Acessando as aplicações

- API: [localhost:3000](http://localhost:3000)
- Aplicação Web: [localhost:3001](http://localhost:3001)
- Aplicação Mobile: via Expo Go no dispositivo mobile, leitura do QR Code em [localhost:19000](http://localhost:19000)
- Keycloak: [localhost:8080](http://localhost:8080)
- PGAdmin: [localhost:8081](http://localhost:8081)
