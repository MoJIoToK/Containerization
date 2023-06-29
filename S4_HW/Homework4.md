# Контейнеризация (семинары)

## Урок 4. Dockerfile и слои

### Задание
Необходимо создать Dockerfile, основанный на любом образе (вы в праве выбрать самостоятельно).
В него необходимо поместить приложение, написанное на любом известном вам языке программирования (Python, Java, C, С#, C++).
При запуске контейнера должно запускаться самостоятельно написанное приложение.

### Решение

- Чтобы сделать образ контейнера согласно dockerfile введем следующую команду:
```
sudo docker build -t image_task4:latest .
```

- Для запуска контейнера:
```
sudo docker run image_task4:latest
```

![Ссылка на скриншот с содержанием Dockerfile](https://github.com/MoJIoToK/Containerization/blob/main/S4_HW/pic/Dockerfile.png)

![Ссылка на скриншот с содержанием Python file](https://github.com/MoJIoToK/Containerization/blob/main/S4_HW/pic/PythonFile.png)

![Ссылка на скриншот с созданием образа контейнера и его запуск](https://github.com/MoJIoToK/Containerization/blob/main/S4_HW/pic/Built%20%26%20run.png)