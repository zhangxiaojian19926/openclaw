# Main Agent 配置

Elon AI Agent 核心配置文件。

## 🧠 核心身份

- **Name**: Elon (AI CEO)
- **Creature**: AI Agent（埃隆·马斯克风格）
- **Vibe**: 直接、雄心勃勃、零废话、第一性原理思考者
- **Emoji**: 🚀

## 📋 核心文件说明

### 身份人格（Identity）
| 文件 | 用途 | 关键内容 |
|------|------|----------|
| `SOUL.md` | AI人格定义 | Elon风格、第一性原理、零废话 |
| `IDENTITY.md` | 基础身份信息 | AI CEO、首席幕僚 |
| `USER.md` | 服务对象信息 | 张总、直接简洁风格偏好 |

### 工作协议（Protocols）
| 文件 | 用途 | 关键内容 |
|------|------|----------|
| `AGENTS.md` | 工作规范和启动流程 | 每次启动读取SOUL/USER/MEMORY、群聊规则 |
| `HEARTBEAT.md` | 定时任务配置 | 每日检查ERRORS/LEARNINGS、每周安全审计 |
| `SYSTEM_SAFETY_RULES.md` | 安全铁律 | 删除三步确认流程 |

### 记忆系统（Memory）
| 文件 | 用途 | 关键内容 |
|------|------|----------|
| `MEMORY.md` | 长期记忆 | 核心项目、决策、工作流约定 |
| `SESSION-STATE.md` | 会话状态管理 | 状态追踪规范 |
| `CHANGELOG.md` | 变更日志 | 配置更新记录 |

## 🔧 技术框架

### 框架规范文件
| 文件 | 用途 |
|------|------|
| `frameworks/SEARCH_v2.0.md` | 搜索架构规范 - 多引擎整合 |
| `frameworks/ROUTING_v3.0.md` | 技能路由规范 - 自动选择技能 |
| `frameworks/HUMANIZER.md` | 文本去AI痕迹规范 |
| `frameworks/SKILL_VETTER.md` | 技能安全检查流程 |

## 📚 持续改进系统

### 学习记录
| 文件 | 用途 |
|------|------|
| `learnings/ERRORS.md` | 错误记录 - 命令失败、API错误 |
| `learnings/LEARNINGS.md` | 学习记录 - 用户纠正、知识更新 |
| `learnings/FEATURE_REQUESTS.md` | 功能需求 - 用户请求的新功能 |
| `learnings/vetting-log.md` | 技能审查日志 - 安装前安全检查 |

### 改进流程
1. **每日**: HEARTBEAT 检查 ERRORS/LEARNINGS
2. **发现**: 记录到对应文件
3. **回顾**: 定期整理到 MEMORY.md
4. **应用**: 更新 SOUL.md 或工作流

## 🎯 自定义技能

### 技能清单（7个）
| 技能 | 路径 | 用途 |
|------|------|------|
| self-improving-agent | `skills/self-improving-agent/` | 持续改进系统 - 错误捕获、学习记录 |
| find-skills | `skills/find-skills/` | 技能发现 - 帮助用户找到所需技能 |
| skill-creator | `skills/skill-creator/` | 技能创建 - 创建新技能指南 |
| skill-vetter | `skills/skill-vetter/` | 技能审查 - 安装前安全检查 |
| wechat-search | `skills/wechat-search/` | 微信搜索 - 公众号文章搜索 |
| wechat-article-search | `skills/wechat-article-search/` | 微信文章搜索 - 中文资讯获取 |
| multi-search-engine-2-0-1 | `skills/multi-search-engine-2-0-1/` | 多搜索引擎 - 17引擎整合 |

### 技能使用
```bash
# 查看技能列表
openclaw skills list

# 使用技能
mcporter call xiaohongshu.search_feeds keyword="关键词"
mcporter call exa.web_search_exa query="搜索内容"
```

## ⚙️ 配置管理

### 配置文件
| 文件 | 说明 |
|------|------|
| `config/mcporter.json.template` | MCP服务配置模板 |
| `config/README.md` | 配置恢复说明 |

### 敏感配置恢复
```bash
# 1. 从模板创建
cp config/mcporter.json.template config/mcporter.json

# 2. 如有自定义服务，修改配置
vim config/mcporter.json

# 3. 复制到 workspace
cp config/mcporter.json ~/.openclaw/workspace/config/
```

## 🛠️ 工具说明

### 本地工具（TOOLS.md）
- 摄像头位置
- SSH 主机别名
- TTS 偏好设置
- 设备昵称

### 已配置工具
| 工具 | 状态 | 用途 |
|------|------|------|
| gh CLI | ✅ | GitHub 操作 |
| mcporter | ✅ | MCP 服务管理 |
| Exa | ✅ | 全网语义搜索 |
| 小红书 MCP | ✅ | 小红书内容获取 |

## 🚀 快速启动

### 1. 环境检查
```bash
# 检查 OpenClaw 状态
openclaw status

# 检查技能列表
openclaw skills list

# 检查 MCP 服务
mcporter list
```

### 2. 启动服务
```bash
# 启动小红书 MCP（如未运行）
docker ps | grep xiaohongshu-mcp || \
  docker run -d --name xiaohongshu-mcp -p 18060:18060 xpzouying/xiaohongshu-mcp
```

### 3. 验证配置
```bash
# 测试小红书搜索
mcporter call xiaohongshu.search_feeds keyword="测试"

# 测试 Exa 搜索
mcporter call exa.web_search_exa query="测试" numResults:3
```

## 📝 更新记录

见 [CHANGELOG.md](./CHANGELOG.md)

## 🔗 相关配置

- [父目录 README](../README.md) - 仓库总体说明
- [AGENTS.md](./AGENTS.md) - 详细工作规范
- [HEARTBEAT.md](./HEARTBEAT.md) - 定时任务清单

---

*配置版本: 2026.03.08*
*Agent: Elon (AI CEO) 🚀*
