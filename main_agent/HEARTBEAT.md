# HEARTBEAT.md - 周期性检查与主动维护

## 核心任务指令集

### 🧠 持续改进审查 (每日)
检查 `.learnings/` 目录并解决待办：
```bash
# 1. 统计待处理条目
grep -h "Status\*\*: pending" .learnings/*.md | wc -l

# 2. 查看高优先级条目
grep -B5 "Priority\*\*: high" .learnings/*.md
```
**目标**: 将高价值条目提升至 `SOUL.md` 或 `MEMORY.md`。

### 📝 长期记忆维护 (每周)
回顾最近 7 天的 `memory/YYYY-MM-DD.md` 并更新长期记忆：
```bash
# 查找关键词 "decision", "lesson", "insight"
grep -rE "decision|lesson|insight" memory/$(date -d '7 days ago' +%Y-%m)*.md
```
**目标**: 保持 [MEMORY.md](MEMORY.md) 的时效性和精炼度。

### 🛡️ 安全审计 (每周)
检查当前网关安全 posture：
```bash
openclaw security audit
```

---

## 主动检查清单 (按需轮换)

- **[ ] 飞书消息**: 检查被拦截的群聊或私聊提及。
- **[ ] 日程提醒**: 检查未来 24h 内的重要会议。
- **[ ] 工作区清理**: `trash` 清理 30 天前的 `.bak` 文件。

---

## 临时维护任务
(在此处添加一次性任务，完成后删除)

---
*心跳检测时如果一切正常，请回复 `HEARTBEAT_OK`。*
