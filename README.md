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
