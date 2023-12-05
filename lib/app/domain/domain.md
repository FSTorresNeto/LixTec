A camada de Domain hospedará as Regras de Negócio Corporativa(Entity) e da Aplicação(Usecase).

As Entidades devem ser objetos simples podendo conter regras de validação dos seus dados por meio de funções ou ValueObjects. A Entidade não deve usar nenhum objeto das outras camadas.

Os Casos de Uso devem executar a lógica necessária para resolver o problema. Se o Caso de Uso precisar de algum acesso externo então esse acesso deve ser feito por meio de contratos de interface que serão implementados em uma camada de mais baixo nível.

A camada Domain deve ser responsável apenas pela execução da lógica de negócio, não deve haver implementações de outros objetos como Repositories ou Services dentro do Domain.

Tomando um Repository como exemplo, deverá ter que apenas o contrato de interfaces(Abstrações) e a responsabilidade de implementação desse objeto deverá ser repassado a outra camada mais baixa.
