# supply-chain-ai-assistant

供应链业务 AI 助手（个人学习项目）。目标是把 Java 后端能力与大模型应用开发结合起来：
业务知识库问答（RAG）、自然语言查询库存与出入库数据（受控 Tool Calling）。

> 当前阶段：**阶段 0 — 环境与项目骨架**。只有一个健康检查接口，后续按 90 天路线逐步迭代。

## 技术栈

| 组件 | 版本 | 说明 |
|---|---|---|
| JDK | 17 | 系统默认 JDK 是 8，本项目单独使用 17 |
| Spring Boot | 3.5.16 | Spring AI / LangChain4j 要求 JDK 17+ |
| Maven | 3.9.9 | |
| 数据库 | 待定 | 阶段 1 引入 |
| 向量存储 | 待定 | 阶段 3 引入 |

## 前置条件

- JDK 17：`C:\Users\liaoyq\.jdks\ms-17.0.19`（已安装）
- Maven 3.9+
- **不要**修改系统 `JAVA_HOME`，公司的 JDK 8 项目继续用它。

## 启动

### 方式 A：IDEA

1. 打开项目根目录，Project SDK 选择 JDK 17。
2. 运行 `SupplyChainAiApplication`。

### 方式 B：命令行（cmd）

```bat
call scripts\jdk17.bat
mvn spring-boot:run
```

### 方式 C：命令行（Git Bash）

```bash
source scripts/jdk17.sh
mvn spring-boot:run
```

启动后访问：<http://localhost:8080/health>

预期返回：

```json
{
  "status": "UP",
  "application": "supply-chain-ai-assistant",
  "version": "0.0.1",
  "timestamp": "2026-10-23T06:30:00Z"
}
```

## 测试

```bat
call scripts\jdk17.bat
mvn test
```

## 配置项

| 配置 | 默认值 | 说明 |
|---|---|---|
| `server.port` | 8080 | 服务端口 |
| `app.version` | 0.0.1 | 健康检查返回的版本号 |

## 密钥管理

- API Key 只通过环境变量或本地私有配置注入，**不写进源码、不提交到 Git**。
- `.gitignore` 已排除 `.env`、`*.local.yml`、`secrets/`、`*.pem`、`*.key`。
- 后续接入模型服务时，在本地 `.env` 或 IDE 运行配置里设置，不放进 `application.yml`。

## 已知问题

- Docker 守护进程当前未启动，阶段 5 部署前需要启动 Docker Desktop。
- 尚未选择 Spring AI 还是 LangChain4j（阶段 2 决定）。

## 目录结构

```text
supply-chain-ai-assistant/
├── pom.xml
├── README.md
├── scripts/                 # JDK 17 切换脚本
└── src/
    ├── main/java/com/liaoyq/supplychainai/
    │   ├── SupplyChainAiApplication.java
    │   └── health/HealthController.java
    ├── main/resources/application.yml
    └── test/java/com/liaoyq/supplychainai/health/HealthControllerTest.java
```
