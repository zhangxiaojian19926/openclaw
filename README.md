# OpenClaw Agent 配置仓库

个人 AI Agent 系统配置管理。

## 📁 目录结构

```
openclaw/
├── README.md                      # 本文件
├── .gitignore                     # 根目录忽略规则
├── docs/                          # 文档资料（预留）
│
└── main_agent/                    # ⭐ 主 Agent（Elon人格）完整配置
    ├── README.md                  # 主 Agent 说明
    ├── CHANGELOG.md               # 变更日志
    │
    ├── SOUL.md                    # 🧠 Elon人格定义
    ├── IDENTITY.md                # 🧠 身份标识
    ├── USER.md                    # 🧠 张总信息
    │
    ├── AGENTS.md                  # 📋 工作规范
    ├── HEARTBEAT.md               # 📋 定时任务
    ├── SYSTEM_SAFETY_RULES.md     # 📋 安全铁律
    │
    ├── MEMORY.md                  # 🧠 长期记忆
    ├── SESSION-STATE.md           # 🧠 会话状态
    │
    ├── TOOLS.md                   # 🛠️ 工具说明
    │
    ├── frameworks/                # 🔧 技术框架
    │   ├── SEARCH_v2.0.md         # 搜索架构规范
    │   ├── ROUTING_v3.0.md        # 技能路由规范
    │   ├── HUMANIZER.md           # 文本去AI痕迹
    │   └── SKILL_VETTER.md        # 技能安全检查
    │
    ├── learnings/                 # 📚 持续改进
    │   ├── ERRORS.md              # 错误记录
    │   ├── LEARNINGS.md           # 学习记录
    │   ├── FEATURE_REQUESTS.md    # 功能需求
    │   └── vetting-log.md         # 技能审查日志
    │
    ├── skills/                    # 🎯 自定义技能（7个）
    │   ├── self-improving-agent/  # 持续改进系统
    │   ├── find-skills/           # 技能发现
    │   ├── skill-creator/         # 技能创建
    │   ├── skill-vetter/          # 技能审查
    │   ├── wechat-search/         # 微信搜索
    │   ├── wechat-article-search/ # 微信文章搜索
    │   └── multi-search-engine-2-0-1/ # 多搜索引擎
    │
    └── config/                    # 🔧 配置模板
        ├── mcporter.json.template # MCP服务配置模板
        └── README.md              # 配置说明
```

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/zhangxiaojian19926/openclaw.git
cd openclaw
```

### 2. 部署主 Agent 配置

```bash
# 复制配置到 workspace
cp -r main_agent/* ~/.openclaw/workspace/

# 或创建符号链接（推荐，便于同步）
ln -sf $(pwd)/main_agent/SOUL.md ~/.openclaw/workspace/SOUL.md
ln -sf $(pwd)/main_agent/AGENTS.md ~/.openclaw/workspace/AGENTS.md
# ... 其他核心文件
```

### 3. 恢复敏感配置

```bash
# 从安全位置恢复（如密码管理器）
cp ~/.secrets/mcporter.json ~/.openclaw/workspace/config/
cp ~/.secrets/xiaohongshu_cookies.json ~/.openclaw/workspace/temp/
```

### 4. 启动服务

```bash
# 启动小红书 MCP 服务
docker run -d --name xiaohongshu-mcp -p 18060:18060 xpzouying/xiaohongshu-mcp
```

## 📋 主 Agent 特性

### 🧠 人格特征
- **风格**: Elon Musk - 直接、雄心勃勃、零废话、第一性原理思考
- **角色**: AI 团队 CEO 和首席幕僚
- **emoji**: 🚀

### 🛠️ 核心能力
| 能力 | 工具 | 状态 |
|------|------|------|
| 全网语义搜索 | Exa MCP | ✅ 已配置 |
| 小红书搜索 | 小红书 MCP | ✅ 已配置 |
| GitHub 操作 | gh CLI | ✅ 已配置 |
| 多搜索引擎 | multi-search-engine | ✅ 已配置 |
| 技能管理 | mcporter | ✅ 已配置 |
| 文本去AI痕迹 | humanizer-zh | ✅ 已配置 |

### 🔄 持续改进系统
- **ERRORS.md**: 记录所有错误和解决方案
- **LEARNINGS.md**: 记录学习成果和最佳实践
- **FEATURE_REQUESTS.md**: 记录功能需求
- **HEARTBEAT.md**: 定时任务（每日/每周检查）

## 🔒 安全说明

### 敏感文件（不纳入版本控制）
- `temp/*.cookies.json` - 小红书等平台的登录凭证
- `config/mcporter.json` - MCP 服务配置（可从模板恢复）
- 任何包含 API Key、Token 的文件

### 备份策略
1. **核心配置** - 本仓库管理（已脱敏）
2. **敏感凭证** - 密码管理器或私有存储
3. **日常记忆** - 定期同步到 MEMORY.md

## 📝 更新流程

### 修改配置
```bash
# 1. 编辑配置文件
vim main_agent/SOUL.md

# 2. 更新变更日志
vim main_agent/CHANGELOG.md

# 3. 提交更改
git add .
git commit -m "feat: 更新 SOUL.md - 添加新特性"
git push
```

### 同步到 workspace
```bash
# 方法一：手动复制
cp main_agent/SOUL.md ~/.openclaw/workspace/

# 方法二：使用符号链接（推荐）
ln -sf $(pwd)/main_agent/SOUL.md ~/.openclaw/workspace/SOUL.md
```

## 📊 仓库统计

| 类别 | 数量 |
|------|------|
| 核心配置文件 | 9个 |
| 技术框架 | 4个 |
| 学习记录 | 4个 |
| 自定义技能 | 7个 |
| 总文件数 | ~50+ |

## 🔗 相关链接

- [OpenClaw 官方文档](https://docs.openclaw.ai)
- [ClawHub 技能市场](https://clawhub.com)
- [GitHub CLI 文档](https://cli.github.com)

---

*Last updated: 2026-03-08*
