A camada dá suporte a camada Domain implementando suas interfaces. Para isso, adapta os dados externos para que possa cumprir os contratos do domínio.

Essa camada deve implementar alguma interface de um Repository ou Services que pode ou não depender de dados externos como uma API ou acesso a algum Hardware.

Para que o Repository possa processar e adaptar os dados externos deve criar contratos para esses serviços visando passar a responsabilidade de implementação para a camada mais baixa da nossa arquitetura.

Como sugestão, iremos criar objetos de DataSource quando quisermos acessar um dado externo, uma BaaS como Firebase ou um Cache Local usando SQLite por exemplo. Outra sugestão seria criar objetos denominados Drivers para interfacear a comunicação com algum Hardware do dispositivo.

Os acessos externos como Datasources e Drivers devem ser implementados por outra camada, ficando apenas os Contratos de Interface nesta camada de Infra.
