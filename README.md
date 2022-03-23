# Sample VIPER Architecture

Exemplo prático e funcional de como se aplicar uma arquitetura VIPER.

## Resultado final

<p float="left">
<img src="screenshots/screenshot-1.png" alt="drawing" width="200"/>
<img src="screenshots/screenshot-2.png" alt="drawing" width="200"/>
</p>

## Instalação

#### Instalação manual

- Instalar ou atualizar [brew](https://brew.sh) 
- Instalar ou atualizar [bundler](https://bundler.io)
- Instalar [Xcodegen](https://github.com/yonaskolb/XcodeGen) para gerar *xcodeproj*.

#### Se preferir você pode instalar tudo isso rodando o script abaixo:

```sh
cd Scripts
./tools
```
## Geração do projeto **(.xcworksp)**

#### Escolha a pasta do projeto que deseja e rode o comando abaixo:

```sh
cd Scripts
./setup
```

## Xcode Templates

Instalação
=====================

1. Feche o Xcode se ele estiver aberto
2. Abra a pasta do repositório no terminal
3. Abra a pasta templates com o comando: `cd Templates`
4. Execute o script de instalação com o comando: `./install_templates`
5. Abra o xcode e veja se ao criar um arquivo os templates do VIPER apareceram no final


Templates
=====================

- **VIPER:** Template responsável por criar todos arquivos do VIPER no local selecionado. Nele você define apenas o nome da scene e todos arquivos são criados.