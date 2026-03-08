#!/bin/bash
# Quick Learning Entry Creator
# 快速创建新学习/错误/功能请求条目
#
# 用法:
#   ./new-learning.sh learning [category]   # 创建学习条目
#   ./new-learning.sh error                 # 创建错误条目
#   ./new-learning.sh feature               # 创建功能请求条目
#
# 示例:
#   ./new-learning.sh learning correction
#   ./new-learning.sh learning best_practice
#   ./new-learning.sh error
#   ./new-learning.sh feature

set -e

LEARNINGS_DIR="$HOME/.openclaw/workspace/.learnings"
DATE=$(date +%Y%m%d)
RAND=$(head /dev/urandom 2>/dev/null | tr -dc 'A-Z0-9' | head -c 3 || echo "$(date +%s | tail -c 3)")
TIMESTAMP=$(date -Iseconds 2>/dev/null || date +%Y-%m-%dT%H:%M:%S%z)

# 解析参数
TYPE="${1:-learning}"
CATEGORY="${2:-category}"

case "$TYPE" in
    learning|learn|l)
        FILE="$LEARNINGS_DIR/LEARNINGS.md"
        PREFIX="LRN"
        TEMPLATE="learning"
        ;;
    error|err|e)
        FILE="$LEARNINGS_DIR/ERRORS.md"
        PREFIX="ERR"
        TEMPLATE="error"
        ;;
    feature|feat|f)
        FILE="$LEARNINGS_DIR/FEATURE_REQUESTS.md"
        PREFIX="FEAT"
        TEMPLATE="feature"
        ;;
    *)
        echo "❌ 未知类型: $TYPE"
        echo "用法: $0 learning|error|feature [category]"
        exit 1
        ;;
esac

ID="$PREFIX-$DATE-$RAND"

# 检查文件是否存在
if [ ! -f "$FILE" ]; then
    echo "❌ 文件不存在: $FILE"
    echo "请先运行 setup.sh 初始化"
    exit 1
fi

# 创建条目
case "$TEMPLATE" in
    learning)
        cat >> "$FILE" << EOF

## [$ID] $CATEGORY

**Logged**: $TIMESTAMP
**Priority**: medium
**Status**: pending
**Area**:

### Summary


### Details


### Suggested Action


### Metadata
- Source:
- Related Files:
- Tags:

---
EOF
        ;;
    error)
        cat >> "$FILE" << EOF

## [$ID] command_name

**Logged**: $TIMESTAMP
**Priority**: high
**Status**: pending
**Area**:

### Summary


### Error
\`\`\`

\`\`\`

### Context
- Command:
- Input:

### Suggested Fix


### Metadata
- Reproducible: unknown
- Related Files:

---
EOF
        ;;
    feature)
        cat >> "$FILE" << EOF

## [$ID] capability_name

**Logged**: $TIMESTAMP
**Priority**: medium
**Status**: pending

### Requested Capability


### User Context


### Complexity Estimate
simple | medium | complex

### Suggested Implementation


---
EOF
        ;;
esac

echo "✅ 已创建条目 [$ID]"
echo "📄 文件: $FILE"
echo ""
echo "编辑文件填写内容："
echo "  \$EDITOR $FILE"
