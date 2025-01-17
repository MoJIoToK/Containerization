# Контейнеризация (семинары)
## Урок 2. Механизмы контрольных групп

### Задание
1. Запустить контейнер с БД, отличной от mariaDB, используя инструкции на сайте: https://hub.docker.com/
2. Добавить в контейнер hostname такой же, как hostname системы через переменную
3. Заполнить БД данными через консоль
4. Запустить phpmyadmin (в контейнере) и через веб проверить, что все введенные данные доступны

### Решение
- В качестве примера, было решено создать контейнер с БД "MySQL" версии 8.0.33. Для этого необходимо ввести следующую команду: 
```
sudo docker run --name some-myssql -h mysql_test -e MYSQL_ROOT_PASSWORD=1 -d mysql:8.0.33
```
В этой команде имя контейнера - `some-myssql`, hostname - `mysql_test`, пароль рутового пользователя БД - `1`, образ БД с указанием версии - `mysql:8.0.33`.

- Следующей командой проверим что получилось после создания контейнера:
```
sudo docker ps -a
```

![Cсылка на скриншот с MySQL](https://github.com/MoJIoToK/Containerization/blob/main/S3_HW/pic/mysql.png)

Видно, что контейнер с параметрами описанными выше создан. 
- Зайдем в созданный контейнер:
```
sudo docker exec -it some-mysql bash
```
В открывшемся контейнере напишем следующую команду, для того, чтобы войти в MySQL:
```
mysql -u root -p
```
- Войдя в БД, создадим какую-нибудь простую таблицу. Пропустим подрнобное описание команд для создания БД. Все команды можно посмотреть на скриншотах.

- Для того чтобы просмотреть нашу БД в браузере запустим контейнер в котором будет находиться phpmyadmin:
```
sudo docker run --name my-phpmyadmin -h php_admin -d --link some-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
```
Имя контейнера - `my-phpmyadmin`, hostname - `php_admin`, phpmyadmin связ с БД по ссылке - `some-mysql`, порт - `8081:80`
Теперь у нас имеется два необходимых контейнера, один с БД, второй с phpmyadmin.

![Cсылка на скриншот с phpmyadmin](https://github.com/MoJIoToK/Containerization/blob/main/S3_HW/pic/docker_php_my_admin.png)

- Результат работы связки двух контейнеров, можно увидеть на скриншотах со странички `phpmyadmin`

![Cсылка на скриншот phpmyadmin](https://github.com/MoJIoToK/Containerization/blob/main/S3_HW/pic/php_my_admin.png)

![Cсылка на скриншот сруктуры БД](https://github.com/MoJIoToK/Containerization/blob/main/S3_HW/pic/BD_structure.png)

![Cсылка на скриншот значений БД](https://github.com/MoJIoToK/Containerization/blob/main/S3_HW/pic/BD_values.png)