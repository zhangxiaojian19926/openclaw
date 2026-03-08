#!/bin/bash
# Self-Improvement Setup Script
# 一键初始化 self-improvement 技能

set -e

WORKSPACE="$HOME/.openclaw/workspace"
SKILL_PATH="$WORKSPACE/skills/self-improving-agent"
LEARNINGS_DIR="$WORKSPACE/.learnings"

echo "🔧 初始化 self-improvement 技能..."

# 1. 创建 .learnings 目录
if [ -d "$LEARNINGS_DIR" ]; then
    echo "  ✓ .learnings 目录已存在"
else
    mkdir -p "$LEARNINGS_DIR"
    echo "  ✓ 创建 .learnings 目录"
fi

# 2. 检查/创建日志文件
for file in LEARNINGS ERRORS FEATURE_REQUESTS; do
    target="$LEARNINGS_DIR/${file}.md"
    if [ -f "$target" ]; then
        echo "  ✓ ${file}.md 已存在"
    else
        # 尝试从模板复制
        if [ -f "$SKILL_PATH/assets/${file}.md" ]; then
            cp "$SKILL_PATH/assets/${file}.md" "$target"
        elif [ -f "$SKILL_PATH/.learnings/${file}.md" ]; then
            cp "$SKILL_PATH/.learnings/${file}.md" "$target"
        else
            # 创建空文件
            case "$file" in
                LEARNINGS)
                    cat > "$target" << 'EOF'
# Learnings Log

记录学习、纠正、知识缺口和最佳实践。

---
EOF
                    ;;
                ERRORS)
                    cat > "$target" << 'EOF'
# Errors Log

记录命令失败、异常和意外行为。

---
EOF
                    ;;
                FEATURE_REQUESTS)
                    cat > "$target" << 'EOF'
# Feature Requests Log

记录用户请求但尚不存在的功能。

---
EOF
                    ;;
            esac
        fi
        echo "  ✓ 创建 ${file}.md"
    fi
done

# 3. 添加脚本执行权限
chmod +x "$SKILL_PATH/scripts/"*.sh 2>/dev/null || true
echo "  ✓ 脚本权限已设置"

echo ""
echo "✅ self-improvement 技能初始化完成！"
echo ""
echo "目录结构："
echo "  $LEARNINGS_DIR/"
echo "  ├── LEARNINGS.md"
echo "  ├── ERRORS.md"
echo "  └── FEATURE_REQUESTS.md"
echo ""
echo "快速命令："
echo "  # 统计待处理条目"
echo "  grep -h 'Status\*\*: pending' ~/.openclaw/workspace/.learnings/*.md | wc -l"
echo ""
echo "  # 创建新学习条目"
echo "  ~/.openclaw/workspace/skills/self-improving-agent/scripts/new-learning.sh learning"
