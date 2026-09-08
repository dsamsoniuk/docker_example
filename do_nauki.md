# Do nauki


- Instalacja paczki tar.xz

Rozpakuj: -x (extract) -f (wskazanie na plik)
tar -xf tor-browser-linux-x86_64-15.0.21.tar.xz

- Instal plik .deb

sudo dpkg -i paczka.deb

-- jezeli bedzie blad przy instalacji `dpkg` to zainstaluj zaleznosci

sudo apt-get install -f



- Ubuntu software zamykanie programu:

killall snap-store

- komprezja zip (rekurencyjne i bez wyswietlania)

zip -rq compressed_filename.zip foldername

- dekompresja w tle

unzip -q filename.zip




```
image - to obraz serwisu
contener - to instancja obrazu + dane z volume
volume - trwale przechowuje same dane ktore zostaly wskazane np. katalog lub pliki konfiguracyjne
```

- usun kontener + volumine
```
docker compose down -v
```

- usun kontener + volumine + obrazy
```
docker compose down -v --rmi all
```

- pokaz liste sieci
```
docker network ls
```
- pokaz szczegoly wybranej sieci
```
docker network inspect test_js_default
```
- pokaz wszystkie sieci ze szczegolami
```
docker network inspect $(docker network ls -q)
```

- rebuild kontenera
docker compose up --build



----- docker konfiguracja
```
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_elka
    volumes:
      - db-data:/var/lib/mysql
      - ./docker/mysql.cnf:/etc/mysql/conf.d/my.cnf
	 environment:
	   MYSQL_DATABASE: mydb
	   MYSQL_USER: test
	   MYSQL_PASSWORD: test
	   MYSQL_ROOT_PASSWORD: test
      
    ports:
      - "3306:3306" 
    networks:
      - elka_net
      
 php_elka:
    build: ./docker
    container_name: php_elka
    volumes:
      - ./:/app
      - "./docker/php.ini:/usr/local/etc/php/conf.d/php.ini"
    restart: on-failure
    user: 1000:1000
    depends_on:
      - mysql_elka   
    networks:
      - elka_net
      
volumes:
  db-data:                           

networks:
  elka_net:
    driver: bridge
 ```
 
----- Dockerfile

```
FROM php:8.2-fpm

WORKDIR /app

RUN docker-php-ext-install pdo pdo_mysql

COPY . .

CMD ["php", "-S", "0.0.0.0:8000"]
```


===================================== LISTA -----

= linux

- Instalacja paczki tar.xz
- Instal plik .deb
- zabijanie ubuntu software - snap
- komprezja zip
- dekompresja w tle


= docker

- usun kontener + volumine
- usun kontener + volumine + obrazy
- pokaz liste sieci
- pokaz szczegoly wybranej sieci
- pokaz wszystkie sieci ze szczegolami
- rebuild kontenera


- stworz konfiguracje docker-compose dla php + mysql