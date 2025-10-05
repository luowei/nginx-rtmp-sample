# nginx-rtmp-sample

Windows 平台下 Nginx-RTMP 流媒体服务器配置示例

## 项目简介

nginx-rtmp-sample 是一个在 Windows 平台下配置和使用 Nginx-RTMP 流媒体服务器的完整示例项目。虽然 Linux/Unix 下的配置资料丰富，但 Windows 下配置会面临更多问题，本项目专注于提供 Windows 平台下的完整解决方案，包括编译好的 Nginx-RTMP 可执行文件、配置文件示例和使用说明。

## 技术栈

- **Web 服务器**: Nginx (Windows 版本)
- **流媒体模块**: nginx-rtmp-module
- **视频处理**: FFmpeg
- **Web 技术**: PHP (FastCGI), HTML, JavaScript
- **播放器**: JW Player
- **流媒体协议**: RTMP, HLS (HTTP Live Streaming)

## 功能特性

### 核心功能
- **RTMP 直播推流**：支持 OBS、FFmpeg 等工具推流
- **RTMP 直播拉流**：支持多种播放器观看直播
- **HLS 直播**：自动切片生成 m3u8 和 ts 文件
- **视频点播（VOD）**：支持本地和远程视频点播
- **服务端录制**：自动录制直播流到本地
- **流转码**：使用 FFmpeg 进行实时转码
- **多码率推流**：支持同一源流推送到多个目标
- **负载均衡**：Nginx upstream 配置实现负载均衡
- **访问控制**：IP 白名单/黑名单控制推流和播放权限
- **统计信息**：实时流媒体统计信息展示

### 扩展功能
- PHP 集成（FastCGI）
- 事件通知回调（on_play, on_publish）
- 流元数据处理
- 多种转码预设配置

## 项目结构

```
nginx-rtmp-sample/
├── nginx-rtmp.exe              # 主 Nginx-RTMP 可执行文件
├── nginx-rtmp(illuspas).exe    # illuspas 编译版本
├── nginx-rtmp(xaccc).exe       # xaccc 编译版本
├── ffmpeg.7z                   # FFmpeg 工具包（压缩）
├── RunHiddenConsole.exe        # 后台运行工具
├── conf/                       # 配置文件目录
│   ├── nginx.conf             # 主配置文件
│   ├── nginx.conf.b           # 备用配置
│   ├── nginx.conf.upstream    # 负载均衡配置
│   ├── nginx.new.conf         # 新版配置示例
│   └── conf.d/                # 模块化配置
│       ├── http.conf          # HTTP 服务配置
│       ├── http2.conf         # HTTP 配置变体 2
│       ├── http3.conf         # HTTP 配置变体 3
│       ├── http4.conf         # 负载均衡 HTTP 配置
│       ├── rtmp.conf          # RTMP 主配置
│       ├── rtmp2.conf         # RTMP 配置变体 2
│       ├── rtmp3.conf         # RTMP 配置变体 3
│       ├── rtmp4.conf         # RTMP 配置变体 4
│       ├── rtmp5.conf         # RTMP 配置变体 5
│       ├── rtmp6.conf         # RTMP 配置变体 6
│       ├── rtmp7.conf         # RTMP 配置变体 7
│       ├── mail.conf          # Mail 代理配置
│       └── upstream.conf      # Upstream 配置
├── html/                      # Web 根目录
│   ├── index.html            # 主页
│   ├── stat.xsl              # 统计信息样式
│   ├── vodtest.html          # 点播测试页面
│   ├── transcoding.html      # 转码测试页面
│   ├── client/               # 客户端测试页面
│   ├── jwplayer/             # JW Player 播放器
│   ├── media/                # 媒体文件目录
│   │   ├── hls/             # HLS 切片存储
│   │   └── record/          # 录制文件存储
│   └── test/                 # 测试页面
├── batch_file/               # 批处理脚本
├── start_nginx.bat           # 启动 Nginx
├── stop_nginx.bat            # 停止 Nginx
├── reload_nginx.bat          # 重载配置
├── start_phpcgi.bat          # 启动 PHP-CGI
├── stop_phpcgi.bat           # 停止 PHP-CGI
├── build.bat                 # 构建脚本
├── php.ini                   # PHP 配置文件
├── contrib/                  # 第三方库
├── nginx-test/              # 测试工具
└── temp/                    # 临时文件目录
```

## RTMP 应用配置说明

### 1. myapp - 综合应用
- **直播流**: 支持 RTMP 推流和播放
- **HLS 支持**: 自动生成 HLS 切片
- **录制功能**: 30 秒间隔录制
- **事件回调**: on_play 和 on_publish 通知

### 2. vod - 本地点播
- 从本地 `html/media` 目录播放视频文件

### 3. vod_http - HTTP 点播
- 从远程 HTTP 服务器播放视频

### 4. vod_mirror - 镜像点播
- 优先本地，失败则从远程获取

### 5. live - 受限直播
- 仅允许 127.0.0.1 推流
- 所有人可观看
- 自动录制（最大 100MB）
- 推流到 live2 应用

### 6. live2 - 开放直播
- 允许所有人推流和播放

## 依赖要求

- **操作系统**: Windows XP/7/8/10/11
- **FFmpeg**: 已包含在 ffmpeg.7z 中
- **PHP**: 可选（如需 PHP 功能）
- **播放器**: 支持 RTMP/HLS 的播放器（VLC、JW Player 等）

## 安装和运行

### 1. 解压 FFmpeg

```bash
# 解压 ffmpeg.7z 到当前目录或指定位置
# 确保 ffmpeg.exe 在系统 PATH 中或项目 Encoding 目录下
```

### 2. 启动 Nginx-RTMP 服务器

**方式一：前台运行**
```bash
# 双击运行
nginx-rtmp.exe

# 或命令行运行
nginx-rtmp.exe -c conf/nginx.conf
```

**方式二：后台运行（推荐）**
```bash
# 使用批处理脚本启动
start_nginx.bat

# 或使用隐藏控制台工具
RunHiddenConsole.exe nginx-rtmp.exe
```

### 3. 启动 PHP-CGI（可选）

```bash
# 如需 PHP 功能，运行
start_phpcgi.bat
```

### 4. 测试服务

- **Web 界面**: http://localhost:80/
- **统计信息**: http://localhost:80/stat
- **RTMP 端口**: rtmp://localhost:1935/

## 使用说明

### 直播推流

**使用 FFmpeg 推流**
```bash
# 推流到 live 应用
ffmpeg -re -i input.mp4 -c copy -f flv rtmp://127.0.0.1/live/stream

# 推流到 myapp 应用
ffmpeg -re -i input.mp4 -c copy -f flv rtmp://127.0.0.1/myapp/stream
```

**使用 OBS 推流**
- 服务器: rtmp://127.0.0.1/live
- 串流密钥: stream（或自定义流名称）

### 直播拉流

**使用 VLC 播放器**
```
rtmp://127.0.0.1/live/stream
```

**使用 FFplay 播放**
```bash
ffplay rtmp://127.0.0.1/live/stream
```

**使用 Web 播放器**
- 访问: http://localhost/client/
- 输入流地址播放

### HLS 播放

```
http://localhost/media/hls/stream.m3u8
```

### 视频点播

```bash
# 播放本地视频（文件需放在 html/media 目录）
rtmp://127.0.0.1/vod/video.mp4

# 播放 HTTP 视频
rtmp://127.0.0.1/vod_http/video.mp4
```

## 视频转码示例

### 1. 基本转码

```bash
# 转码为 480p
ffmpeg -i rtmp://127.0.0.1/live1/1080 \
  -vcodec flv -acodec copy -s 360x360 \
  -f flv rtmp://127.0.0.1/live3/480
```

### 2. H.264 转码（高质量）

```bash
# 转码为 720p
ffmpeg -i rtmp://127.0.0.1/live1/1080 \
  -vcodec libx264 -preset veryfast \
  -x264opts nal-hrd=cbr:force-cfr=1:keyint=60 \
  -b:v 3000k -bufsize 3000k \
  -s 1280x720 -sws_flags spline -r 30 \
  -acodec copy -f flv rtmp://127.0.0.1/live2/720
```

### 3. 多码率转码

```bash
# 转码为多个分辨率
ffmpeg -i rtmp://127.0.0.1/big/1080 \
  -vcodec libx264 -preset faster \
  -x264opts nal-hrd=cbr:force-cfr=1:keyint=60 \
  -b:v 3000k -maxrate 3000k -bufsize 3000k \
  -s 1280x720 -sws_flags spline -r 30 \
  -acodec copy -f flv rtmp://127.0.0.1/small/720
```

### 4. 屏幕直播（Linux/Mac）

```bash
# 推送桌面画面到 RTMP 服务器
ffmpeg -f x11grab -follow_mouse centered \
  -r 25 -s cif -i :0.0 \
  -f flv rtmp://127.0.0.1/live1/screen
```

## 配置管理

### 切换配置文件

主配置文件 `conf/nginx.conf` 通过 include 指令加载不同的配置组合：

```nginx
# HTTP 配置（三选一）
include conf.d/http.conf;
# include conf.d/http2.conf;
# include conf.d/http3.conf;

# RTMP 配置
include conf.d/rtmp.conf;

# 负载均衡配置（可选）
# include conf.d/http4.conf;
```

### 重载配置

```bash
# 使用批处理脚本
reload_nginx.bat

# 或使用 nginx 命令
nginx-rtmp.exe -s reload
```

### 停止服务

```bash
# 使用批处理脚本
stop_nginx.bat

# 或使用 nginx 命令
nginx-rtmp.exe -s stop
```

## 视频教程

**推荐配置搭建视频教程**：

1. [apache+php 与 nginx+php 环境的搭建](http://www.tudou.com/listplay/jGOJ31wJFck/zLXd5x6Yyy8.html)
2. [nginx_rtmp 在 windows 下编译及点播、直播、服务端录制的配置](http://www.tudou.com/listplay/jGOJ31wJFck/w-oyi3XnKe0.html)
3. [ffmpeg+jwplayer+nginx 负载均衡配置](http://www.tudou.com/listplay/jGOJ31wJFck/W4gXkEeFoiw.html)

## 常见问题

### 1. 端口占用
- 确保 80 端口（HTTP）和 1935 端口（RTMP）未被占用
- 可在配置文件中修改端口号

### 2. 推流失败
- 检查防火墙设置
- 确认 IP 访问控制配置（allow/deny）
- 查看 logs/rtmp_error.log 错误日志

### 3. HLS 不生成切片
- 确保 `html/media/hls` 目录存在且可写
- 检查 rtmp 配置中的 hls 相关设置

### 4. 录制文件找不到
- 确认录制路径 `html/media/record` 存在
- 检查录制配置参数（record_path, record_unique）

## 技术特点

1. **多版本支持**: 提供三个不同编译版本的 Nginx-RTMP
2. **模块化配置**: 配置文件分离，易于管理和切换
3. **完整示例**: 包含直播、点播、转码等完整使用场景
4. **批处理脚本**: Windows 下便捷的启停管理
5. **负载均衡**: 支持 upstream 配置实现高可用
6. **访问控制**: 细粒度的推流和播放权限控制
7. **实时统计**: 内置统计页面监控服务状态

## 许可证

本项目仅供学习和参考使用。

## 相关资源

- [nginx-rtmp-module GitHub](https://github.com/arut/nginx-rtmp-module)
- [Nginx 官方网站](https://nginx.org/)
- [FFmpeg 官方网站](https://ffmpeg.org/)
