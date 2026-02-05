#!/bin/bash

# Blog 部署脚本
# 使用 rsync 同步到服务器，避免 git pull 失败问题

set -e

# 配置
REMOTE_USER="jojo"
REMOTE_HOST="jas_tcloud"  # 使用SSH别名，或直接写IP
REMOTE_DIR="/home/jojo/project/hugo-jasjojo"
HUGO_CMD="/home/jojo/project/hugo/hugo"

# 颜色输出
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Blog 部署脚本 ===${NC}"
echo ""

# 1. 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    echo -e "${RED}错误：存在未提交的更改${NC}"
    echo "请先提交更改："
    git status
    exit 1
fi

# 2. 获取提交信息
if [ -z "$1" ]; then
    COMMIT_MSG="部署更新"
else
    COMMIT_MSG="$1"
fi

echo -e "${GREEN}步骤 1/5: 提交到 Git 本地仓库${NC}"
git add .
git commit -m "$COMMIT_MSG"

echo -e "${GREEN}步骤 2/5: 推送到 GitHub${NC}"
git push

echo -e "${GREEN}步骤 3/5: 同步到服务器 (rsync)${NC}"

# rsync 同步文件
# --delete: 删除目标目录中不存在于源目录的文件
# --exclude: 排除不需要同步的文件
# -avz: 归档模式，显示进度，压缩传输
rsync -avz --progress \
    --exclude 'public/' \
    --exclude 'resources/' \
    --exclude '.git/' \
    --exclude 'node_modules/' \
    --exclude '.hugo_build.lock' \
    ./ "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"

echo -e "${GREEN}步骤 4/5: 在服务器上构建 Hugo${NC}"

# 在服务器上执行 hugo 构建
ssh "${REMOTE_USER}@${REMOTE_HOST}" "cd ${REMOTE_DIR} && ${HUGO_CMD}"

echo -e "${GREEN}步骤 5/5: 清理本地 rsync 缓存${NC}"
# 清理本地的 .hugo_build.lock（如果存在）
rm -f .hugo_build.lock

echo ""
echo -e "${GREEN}=== 部署完成！ ===${NC}"
echo "访问博客：https://jasjojo.com/"
