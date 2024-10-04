import 'package:flutter_getit/flutter_getit.dart';
import 'package:logica_programacao_acadf/lab_clinicas/lib/src/restClient/rest_client.dart';

// Com o binding o restClient fica disponível por toda a aplicação como um todo

class LabClinicasApplicationBinding extends ApplicationBindings{
  @override
  List<Bind<Object>> bindings() => [
    Bind.lazySingleton<RestClient>(
      (i) => RestClient(Env.backendBaseUrl),
    ),
  ];
}

// Adicionar no main