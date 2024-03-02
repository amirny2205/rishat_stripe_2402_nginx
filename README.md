### Чтобы использовать конфиг без docker:
В файле rishat поменяйте строчку `enter_address_here` на адрес в формате `http://192.168.2.172:8000` или название соответствующего сервиса в docker-compose. Если запускаете на локальной машине с бекендом, строчка будет `proxy_pass http://localhost:8000;`

Затем исполните следующие команды:
```
sudo cp ./rishat /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/rishat /etc/nginx/sites-enabled/
sudo systemctl reload nginx
```
В конфиге указан порт 80, чтобы не было конфликтов с дефолтной конфигурацией, вам нужно удалить файл `default` из `sites-enabled` или `conf.d` в папке `/etc/nginx`

### Чтобы использовать конфиг через docker:
Не забудьте, чтобы django был виден не только на localhost, его нужно запускать как `./manage.py runserver 0.0.0.0:8000`

Запуск докера:

```
docker build -f nginx.Dockerfile -t rishat_nginx .
docker run -dit -e PROXY_ADDRESS=http://192.168.2.172:8000 -p 80:80 rishat_nginx
``` 
, заменив порт и PROXY_ADDRESS на соответствующие значения
