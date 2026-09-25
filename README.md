# Helpdesk Application

Sistema distribuído de gerenciamento de chamados baseado em arquitetura de microsserviços, utilizando Spring Boot, Spring Cloud Gateway Reativo, RabbitMQ, PostgreSQL e frontend SPA em React/Vite.

---

## Arquitetura e Portas

| Serviço | Descrição | Tecnologia | Porta |
| :--- | :--- | :--- | :--- |
| **Frontend** | Interface Web SPA | React 19 + TypeScript + Vite | `3000` |
| **API Gateway** | Ponto único de entrada, CORS e validação JWT | Spring Cloud Gateway (WebFlux) | `8080` |
| **User Service** | Gestão de usuários, autenticação e papéis | Spring Boot 4 + Spring Data JPA | `8081` |
| **Ticket Service** | Ciclo de vida e regras de negócio de chamados | Spring Boot 4 + JPA + RabbitMQ | `8082` |
| **Notification Service** | Consumo de eventos e registro de notificações | Spring Boot 4 + JPA + RabbitMQ | `8083` |
| **PostgreSQL** | Bancos isolados (`user_db`, `ticket_db`, `notification_db`) | PostgreSQL 16 Alpine | `5432` |
| **RabbitMQ** | Mensageria assíncrona orientada a eventos | RabbitMQ 3.13 Management Alpine | `5672` / `15672` |

---

## Configuração de Ambiente (`.env`)

Na raiz do projeto, copie o modelo de exemplo para criar o seu arquivo de variáveis de ambiente:

```bash
cp .env.example .env
```

### Variáveis Configuráveis no `.env` (Raiz)

```env
# Banco de Dados (PostgreSQL)
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_PORT=5432

# Mensageria (RabbitMQ)
RABBITMQ_DEFAULT_USER=guest
RABBITMQ_DEFAULT_PASS=guest
RABBITMQ_PORT=5672
RABBITMQ_MANAGEMENT_PORT=15672

# Frontend / Gateway (Opcionais para Docker Compose)
FRONTEND_PORT=3000
VITE_API_URL=http://localhost:8080/api
```

> [!IMPORTANT]
> **Conflito de Porta 5432 (PostgreSQL Local):**
> Caso você possua o PostgreSQL instalado e rodando nativamente no seu sistema operacional (como serviço do Windows ou Linux), altere `POSTGRES_PORT=5433` no `.env` ou interrompa o serviço local antes de subir os containers para evitar conflito de portas no Docker.

---

## Como Executar

### Subir a Aplicação Completa

Execute o comando na raiz do projeto para compilar as imagens e iniciar todos os 7 containers:

```bash
docker compose up -d --build
```

### Verificar Status dos Serviços

```bash
docker compose ps
```

### Parar os Serviços

```bash
docker compose down
```

---

## Links de Acesso

- **Aplicação Web (Frontend):** [http://localhost:3000](http://localhost:3000)
- **API Gateway (Entrada da API):** [http://localhost:8080](http://localhost:8080)
- **Painel RabbitMQ:** [http://localhost:15672](http://localhost:15672) *(Login: `guest` / Senha: `guest`)*
- **Documentação Swagger / OpenAPI:**
  - User Service: [http://localhost:8081/swagger-ui.html](http://localhost:8081/swagger-ui.html)
  - Ticket Service: [http://localhost:8082/swagger-ui.html](http://localhost:8082/swagger-ui.html)
  - Notification Service: [http://localhost:8083/swagger-ui.html](http://localhost:8083/swagger-ui.html)

---

##  Credenciais Padrão (Seed Inicial)

O banco de dados já inicializa populado com os seguintes usuários para testes:

| Perfil | E-mail | Senha Padrão |
| :--- | :--- | :--- |
| **Administrador** | `admin@helpdesk.com` | `admin123` |
| **Técnico** | `carlos.silva@helpdesk.com` | `admin123` |
| **Cliente** | `ana.pereira@empresa.com` | `admin123` |
