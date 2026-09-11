# 档案安全处置服务

服务用于接收档案库房的设备告警，并为事故处置记录提供统一入口。HTTP 进程负责健康探测，业务数据写入本地 SQLite 文件。

## 运行

```bash
docker build -t archive-safety .
docker run --rm -p 8080:8080 archive-safety
curl http://localhost:8080/healthz
```

数据文件默认位于 `/data/archive.db`，可通过 `ARCHIVE_DB` 调整路径。
