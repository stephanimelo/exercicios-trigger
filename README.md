# Exercício de Trigger - Professor

**Enunciado:** Criar trigger que impeça a inclusão de professor sem título de "Pós-Doutorado".

Script da trigger: [trigger_professor.sql](trigger_professor.sql)

## Como funciona

A trigger dispara após cada `INSERT` na tabela `Professor`. Ela verifica a titulação do professor inserido: se for diferente de "Pos-Doutorado", ou se estiver nula, a inclusão é desfeita (`ROLLBACK`) e uma mensagem de erro é exibida.

## Testes

### 1) Professor com título "Doutor" (inclusão negada)

<img src="foto1.PNG" width="500"/>

### 2) Professor sem título (inclusão negada)

<img src="foto2.PNG" width="500"/>

### 3) Professor com título "Pos-Doutorado" (inclusão permitida)

<img src="foto3.PNG" width="500"/>

### 4) Resultado final na tabela Professor

<img src="foto4.PNG" width="500"/>
