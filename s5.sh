bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

config='{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 6,
      "protocol": "socks",
      "settings": {
        "auth": "password",
        "accounts": [
          {
            "user": "6",
            "pass": "6"
          }
        ],
        "udp": true
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    }
  ]
}'

# 写入配置文件
echo "$config" > /usr/local/etc/xray/config.json

# 检查是否写入成功
if [ $? -eq 0 ]; then
  echo "配置文件写入成功！"
else
  echo "配置文件写入失败！"
fi

systemctl restart xray