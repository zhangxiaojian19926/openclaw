# SEARCH_v2.0 - 搜索体系规范

## 三层架构（去掉 Codex，全部本地工具）

```
┌─────────────────────────────────────────────────────────────────┐
│  L1 快速问答                                                    │
│  工具：Exa 语义搜索 + Multi Search Engine（17引擎）              │
│  场景：一句话能答的事实查询、定义、简单概念                       │
│  速度：< 3秒                                                     │
├─────────────────────────────────────────────────────────────────┤
│  L2 内容提取（单点深度）                                         │
│  ├─ L2a 静态网页 → web_fetch（任意URL）                         │
│  ├─ L2b 动态网页 → playwright-scraper（JS渲染、登录态）         │
│  ├─ L2c 微信生态 → wechat-article-search（公众号文章）          │
│  ├─ L2d 多引擎搜索 → multi-search-engine（百度/Google/搜狗等）  │
│  └─ L2e 平台原生 → Agent Reach（Twitter/YouTube/小红书/抖音）   │
│  场景：有明确来源的内容抓取                                       │
│  速度：5-30秒                                                    │
├─────────────────────────────────────────────────────────────────┤
│  L3 多源整合（对比分析）                                         │
│  工具：并行调用多个 L2 工具 + 本地综合                            │
│  场景：全网搜索、多平台对比、深度调研                             │
│  模式：同时调 web_fetch + wechat + Agent Reach + multi-search    │
│  速度：30-60秒（并行）                                           │
└─────────────────────────────────────────────────────────────────┘
```

## 决策路由表

| 触发条件 | 选择工具 | 层级 |
|---------|---------|------|
| 有具体 URL（http/https） | web_fetch / playwright | L2a/b |
| 提到"微信"/"公众号" | wechat-article-search | L2c |
| 提到 Twitter/X/YouTube/小红书/抖音 | Agent Reach | L2e |
| 提到"搜索"/"找一下"/"全网" | multi-search-engine | L2d |
| 一句话能答的事实查询 | Exa / multi-search | L1 |
| "对比"/"有什么不同"/"帮我调研" | 并行多个 L2 + 本地综合 | L3 |

## 工具分工

| 工具 | 最佳场景 | 避免场景 |
|------|---------|---------|
| **web_fetch** | 静态网页、新闻、任意URL | JS渲染、需登录 |
| **playwright-scraper** | React/Vue动态页、登录态 | 简单静态页（浪费） |
| **wechat-article-search** | 公众号文章、微信内容 | 非微信内容 |
| **multi-search-engine** | 全网搜索、多引擎对比 | 特定平台深度内容 |
| **Agent Reach** | Twitter/X、YouTube、小红书 | 微信、通用网页 |
| **Exa** | 语义搜索、快速事实 | 实时信息、特定平台 |

## 并行调用模板（L3 使用）

```
用户问："全网搜索关于 X 的信息"
↓
同时执行：
  ├─ multi-search-engine "X"
  ├─ wechat-article-search "X"（如果是中文话题）
  ├─ Agent Reach Twitter "X"（如果是热点事件）
  └─ web_fetch 相关新闻链接
↓
本地综合所有结果 → 输出结构化报告
```

## 关键原则

1. **URL 优先 web_fetch** - 有明确链接直接提取，不走 Agent Reach
2. **微信独立处理** - 公众号内容必须用 wechat-article-search
3. **L3 不用 Codex** - 多源对比时并行本地工具，不派子代理
4. **Multi-search 兜底** - 没有特定平台时用 17 引擎全网搜
5. **成本优先** - 能用 L1 不用 L2，能用 L2 不用 L3

## 特殊场景处理（微信文章）

**问题：** 微信文章(mp.weixin.qq.com)直接抓取困难
- web_fetch: JS动态渲染，内容截断
- playwright: 反爬验证，环境检测拦截
- Google缓存/Archive: 覆盖率极低

**解决方案（迂回战术）：**

```
用户提供微信文章URL
    ↓
Step 1: 尝试 web_fetch（快速验证）
    ↓ 失败/内容不全
Step 2: 用搜狗微信搜索(weixin.sogou.com)搜索文章标题/关键词
    ↓ 成功
Step 3: 从搜索结果提取：
        - 完整标题
        - 公众号名称
        - 文章摘要/关键信息
        - 相关项目链接(GitHub等)
    ↓
Step 4: 如果有GitHub/项目链接 → web_fetch获取详细信息
    ↓
Step 5: 综合输出（文章信息+项目详情）
```

*最后更新: 2026-03-08*
