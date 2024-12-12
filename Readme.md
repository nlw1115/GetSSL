# GetSSL Script

## 使用方法

### 前提条件
1. 提供一个域名（如 `example.com`）供脚本使用。
2. 确保这个域名已经解析到对应设备IP上。

### 下载和运行

1. 通过 `curl` 直接下载并执行脚本：**（⚠️ 请将 `example.com` 替换为您自己的域名！）**
   ```bash
   curl -sSL https://raw.githubusercontent.com/nlw1115/GetSSL/refs/heads/main/GetSSL.sh -o GetSSL.sh && bash GetSSL.sh example.com
   ```
---

## 简介

`GetSSL.sh` 是一个用于自动化处理 SSL/TLS 证书注册、签发和安装的脚本，基于 `acme.sh` 工具构建。脚本支持自动生成随机邮箱地址，用户只需提供域名参数即可完成从依赖安装到证书生成和安装的整个流程。

---

## 功能

1. **自动检测并安装依赖**：
   - 自动检测系统是否安装了 `curl` 和 `socat` 工具，未安装时会根据系统类型（Ubuntu、CentOS、Fedora 等）自动安装。

2. **自动安装 `acme.sh`**：
   - 如果系统中未安装 `acme.sh`，脚本会自动从官方源下载并安装。

3. **随机生成邮箱地址**：
   - 脚本会生成一个 8 位随机字符的邮箱（格式为 `随机字符@gmail.com`），用于注册 `acme.sh` 的账户。

4. **自动签发证书**：
   - 使用 `acme.sh` 为指定域名签发 SSL/TLS 证书。

5. **证书安装**：
   - 将生成的证书文件和私钥文件保存到指定路径：
     - 私钥路径：`/root/private.key`
     - 完整证书路径：`/root/cert.crt`

6. **输出信息**：
   - 成功执行后，脚本会输出：
     - 随机生成的邮箱地址。
     - 证书文件和私钥文件的保存路径。 
