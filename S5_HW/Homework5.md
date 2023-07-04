# Контейнеризация (семинары)

## Урок 5. Docker Compose и Docker Swarm

### Задание

1. создать сервис, состоящий из 2 различных контейнеров: 1 - веб, 2 - БД
2. далее необходимо создать 3 сервиса в каждом окружении (dev, prod, lab)
3. по итогу на каждой ноде должно быть по 2 работающих контейнера
4. выводы зафиксировать

### Решение

- Сначала был создан файл `compose.yml`, который создаёт двай контейнера - БД (mariaDB), веб (phpmyadmin)

- Затем на одна из ВМ стала ведущей с помощью команды:
```
sudo docker swarm init
```
- Подключение второй машины осуществляется с помощью команды:
```
sudo docker swarm join --token ***
```
где вместо *** - подставляем токен из ведущей машины.

- Теперь в ведущей ноде находится находится два контейнера. А в ноде `node-01` один.

- Затем были добавлены метки ноде `node-01`:
```
sudo docker node update --label-add env=prod node-01
```

- Затем с помощью команды был добавлен ещё один контейнер во все ноды.
```
sudo docker service create --mode=global --name nginx-global nginx:alpine
```
Таким образом в каждой ноде должно было прибавиться ещё по одному контейнеру

![Ссылка на скриншот с установкой контейнеров из compose файла](https://github.com/MoJIoToK/Containerization/blob/main/S5_HW/pic/1_console.png)

![Ссылка на скриншот с работой nginx](https://github.com/MoJIoToK/Containerization/blob/main/S5_HW/pic/nginx_slave.png)

![Ссылка на скриншот с работой БД и phpmyadmin](https://github.com/MoJIoToK/Containerization/blob/main/S5_HW/pic/1_php.png)

![Ссылка на скриншот с несколькими контейнерами в нодах](https://github.com/MoJIoToK/Containerization/blob/main/S5_HW/pic/final.png)


