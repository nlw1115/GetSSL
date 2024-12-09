#!/bin/bash

# 生成随机邮箱（8位随机字符 + @gmail.com）
EMAIL=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 8 | head -n 1)@gmail.com

# 获取域名参数
if [ -z "$1" ]; then
    echo "请提供域名作为参数！"
    exit 1
fi
DOMAIN="$1"

# 证书文件路径
KEY_FILE="/root/private.key"
FULLCHAIN_FILE="/root/cert.crt"

# 安装 acme.sh
if ! command -v ~/.acme.sh/acme.sh &> /dev/null; then
    echo "acme.sh 未安装，开始安装..."
    curl https://get.acme.sh | sh
else
    echo "acme.sh 已安装，跳过安装步骤。"
fi

# 注册账号、签发证书并安装
if ~/.acme.sh/acme.sh --register-account -m "$EMAIL" &&
   ~/.acme.sh/acme.sh --issue -d "$DOMAIN" --standalone &&
   ~/.acme.sh/acme.sh --installcert -d "$DOMAIN" --key-file "$KEY_FILE" --fullchain-file "$FULLCHAIN_FILE"; then
    # 输出成功信息
    echo "证书安装完成！"
    echo "随机生成的邮箱：$EMAIL"
    echo "私钥文件路径：$KEY_FILE"
    echo "完整证书文件路径：$FULLCHAIN_FILE"
else
    # 输出失败信息
    echo "证书安装失败，请检查日志！"
fi
