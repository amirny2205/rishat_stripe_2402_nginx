Эта репозитория используется в 


* Чтобы использовать конфиг вручную, сделайте следующее:
поменяйте строчку proxy_pass http://192.168.2.172:8000; в файле rishat на соответствующее значение. Если запускаете на одной машине с бекендом, строчка будет proxy_pass http://localhost:8000;
```
sudo cp ./rishat /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/rishat /etc/nginx/sites-enabled/
sudo systemctl reload nginx
```
Не забудьте, что чтобы django был виден не только на localhost, его нужно запускать как `./manage.py runserver 0.0.0.0:8000`

в конфиге указан порт 80, чтобы не было конфликтов с дефолтной конфигурацией, вам нужно удалить файл `default` из `sites-enabled` или `conf.d` в папке `/etc/nginx`

