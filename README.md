
啟動 docker (包含 php-fpm nginx mysql)
```sh
docker-composer up -d 
```

建立 nginx conf
```
cd nginx
./add_host.sh {hostname}
```

phpstorm 參考文件
https://www.lzskyline.com/index.php/archives/157/