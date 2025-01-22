# LixTec

LixTec é um aplicativo desenvolvido em Flutter para auxiliar na reciclagem de lixo eletrônico. Ele permite que os usuários localizem pontos de coleta, aprendam sobre a importância da reciclagem e contribuam para um mundo mais sustentável.

## Funcionalidades

- Localização de pontos de coleta de lixo eletrônico.
- Informações educativas sobre reciclagem.
- Cadastro de usuários e geradores de resíduos.
- Sistema de recompensas por reciclagem (opcional).

---

## Requisitos

Certifique-se de ter os seguintes itens instalados antes de começar:

- [Flutter](https://docs.flutter.dev/get-started/install) (versão 3.27 ou superior).
- Android Studio ou Xcode para emuladores e testes em dispositivos físicos.
- Dispositivo físico ou emulador configurado para Android ou iOS.

---

## Instalação

1. Clone o repositório:

```bash
git clone https://github.com/FSTorresNeto/LixTec
cd LixTec
```

2. Instale as dependências do projeto:

```bash
flutter pub get
```

3. Configure seu ambiente de desenvolvimento para Android e iOS (detalhes abaixo).

---

## Configuração para Android

1. Certifique-se de ter o Android Studio instalado e configure um dispositivo virtual ou conecte um dispositivo físico.

2. Configure o arquivo `android/app/build.gradle` para incluir a versão mínima do SDK:

```gradle
minSdkVersion 21
targetSdkVersion 33
```

3. Execute o aplicativo:

```bash
flutter run
```

Se desejar gerar um APK para distribuição:

```bash
flutter build apk --release
```

---

## Configuração para iOS

1. Certifique-se de ter o Xcode instalado.

2. Abra o arquivo do projeto no Xcode:

```bash
open ios/Runner.xcworkspace
```

3. Configure as permissões no arquivo `Info.plist`, se necessário. Por exemplo, para acesso à localização:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Precisamos de acesso à sua localização para encontrar pontos de coleta próximos.</string>
```

4. Execute o aplicativo em um emulador ou dispositivo físico:

```bash
flutter run
```

Para criar um arquivo IPA para distribuição:

```bash
flutter build ios --release
```

> **Nota:** Certifique-se de configurar corretamente os certificados e perfis de provisionamento no Xcode para distribuição.

---

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature ou correção:

```bash
git checkout -b minha-feature
```

3. Faça o commit das suas alterações:

```bash
git commit -m "Adiciona minha nova feature"
```

4. Envie suas alterações:

```bash
git push origin minha-feature
```

5. Abra um Pull Request.

---

## Sobre o Projeto

Este é um projeto livre desenvolvido pela Universidade Federal do Ceará (UFC) para promover a reciclagem de lixo eletrônico e conscientizar a população sobre a importância do descarte correto de materiais eletrônicos.

---
