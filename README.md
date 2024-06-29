#### Used PHP Version 

- **`83`**

  

#### Database Config

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=vo
DB_USERNAME=root
DB_PASSWORD=
```

>  Import **`vo.sql`** file from project root folder



#### Postman collection 

-  Import **`SHA-VO.postman_collection.json`** from project root folder



### Run

```php
php artisan serve
```



##### Login to associated user account

- **`Standard user`**

  ```json
  {
      "email": "peterparker@gmail.com",
      "password": "peterparker@gmail.com"
  }
  ```

- **`Super Admin User`**

  ```json
  {
      "email": "william@gmail.com",
      "password": "william@gmail.com"
  }
  ```

- **`Manger User `**

  ```json
  {
      "email": "user1@gmail.com",
      "password": "user1@gmail.com"
  }
  ```

  

