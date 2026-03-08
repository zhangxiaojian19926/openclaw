# 配置说明

## 敏感配置文件

以下文件需从安全位置恢复，**不纳入版本控制**：

- `mcporter.json` - MCP 服务配置（可从 template 复制后使用）
- `xiaohongshu_cookies.json` - 小红书登录凭证

## 恢复步骤

```bash
# 1. 从模板创建 mcporter.json
cp mcporter.json.template mcporter.json

# 2. 恢复小红书 cookies（如有）
cp ~/.secrets/xiaohongshu_cookies.json ../../temp/
```

## 服务启动

小红书 MCP 需要 Docker 运行：
```bash
docker run -d --name xiaohongshu-mcp -p 18060:18060 xpzouying/xiaohongshu-mcp
```
