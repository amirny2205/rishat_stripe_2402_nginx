Эта репозитория используется в 


### Чтобы использовать конфиг вручную:
В файле rishat поменяйте строчку enter_address_here на адрес в формате http://192.168.2.172:8000 или название соотвествтующего сервиса в docker-compose, если запускаете на одной машине с бекендом, строчка будет proxy_pass http://localhost:8000;
```
sudo cp ./rishat /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/rishat /etc/nginx/sites-enabled/
sudo systemctl reload nginx
```
Не забудьте, что чтобы django был виден не только на localhost, его нужно запускать как `./manage.py runserver 0.0.0.0:8000`

В конфиге указан порт 80, чтобы не было конфликтов с дефолтной конфигурацией, вам нужно удалить файл `default` из `sites-enabled` или `conf.d` в папке `/etc/nginx`

### Чтобы использовать конфиг через docker:

`docker build -f nginx.Dockerfile -t rishat_nginx .`
`docker run -dit -e PROXY_ADDRESS=http://192.168.2.172:8000 -p 80:80 rishat_nginx"` , заменив PROXY_ADDRESS на соответствующее значение
