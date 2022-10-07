
## ENV  
啟動 docker (包含 php-fpm nginx mysql)
```sh
docker-composer up -d 
```

建立 nginx conf
```
cd nginx
./add_host.sh {hostname}
```

## nginx
nip.io 是免費的 DNS 服務可以讓你不需要再 /etc/hosts 填入 domain  
mkcert 是快速的 localhost 憑證建立服務  
```
brew install mkcert
mkcert "*.127.0.0.1.nip.io"
mkcert -install
```
執行結束後會有兩個憑證請放入 ./nginx/ssl
```
_wildcard.127.0.0.1.nip.io-key.pem
_wildcard.127.0.0.1.nip.io.pem
```

重啟瀏覽器
```
chrome://restart
```

## 專案  
所有專案統一放在 `./php`  
因為每個人開發專案不同 所以不使用 submodule  


## IDE
phpstorm 參考文件  
https://www.lzskyline.com/index.php/archives/157/  

## Command  
`docker-compose logs -f nginx`  
`docker-compose exec nodejs npm install` 
### test ＆reload nginx conf file
```
docker-compose exec nginx nginx -t
docker-compose exec nginx nginx -s reload 
```
### 快速生成 conf 檔案
```
cd nginx
./add_host.sh <folderName> 
```

## 開發規範 
### psr-12
https://www.php-fig.org/psr/psr-12/