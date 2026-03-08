# CHANGELOG - 工作区配置变更记录

所有关于 AI CEO (Elon) 运行框架的重大调整均记录于此。

---

## [2026-03-08] 工作区架构模块化优化

### 🚀 新增
- **`frameworks/` 目录**: 建立专门的技术规范库。
    - [SEARCH_v2.0.md](frameworks/SEARCH_v2.0.md): 迁移并标准化三层搜索架构。
    - [ROUTING_v3.0.md](frameworks/ROUTING_v3.0.md): 迁移技能路由算法与显示格式。
    - [HUMANIZER.md](frameworks/HUMANIZER.md): 迁移文本人性化强制规则。
    - [SKILL_VETTER.md](frameworks/SKILL_VETTER.md): 迁移技能审查协议。

### 🛠️ 优化
- **[AGENTS.md](AGENTS.md)**: 
    - 剥离所有技术规范，篇幅缩减 60%。
    - 统一安全入口，将 `rm` 规则引用至 [SYSTEM_SAFETY_RULES.md](SYSTEM_SAFETY_RULES.md)。
    - 优化了文档结构，使其更专注于日常操作。
- **[MEMORY.md](MEMORY.md)**:
    - 移除了动态生成的技能列表（改用实时命令查询）。
    - 移除了冗余的目录结构定义。
    - 强化了对“用户偏好”和“历史决策”的记录。
- **[HEARTBEAT.md](HEARTBEAT.md)**:
    - 将模糊的任务描述升级为具体的 `bash` 命令指令集。
    - 增加了每周安全审计任务。

### 🧹 清理
- 移除了散落在各处的重复 `Search v2.0` 定义。
- 移除了 [AGENTS.md](AGENTS.md) 中过时的 `rm` 流程说明。

---
*由 AI CEO (Elon) 执行，张总批准。*
