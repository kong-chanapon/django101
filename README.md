# django101 (project นี้จัดทำขึ้นมาเพื่อใช้ฝึกฝนก่อนไปทำงาน)

## Structure
![Alt text](assets/django-rest-structure.png)

## Run

Go to the project directory

```bash
  cd django101
```

Docker Compose Build

```bash
  docker-compose up --build -d
```

Close

```bash
  docker-compose down
```


## API 

#### User Register

```http
  POST http://localhost:80/auth/register/
```

| Parameter | Type     |
| :-------- | :------- | 
| `username` | `string` | 
| `password` | `string` | 
| `email` | `string` | 

#### User Login

```http
  POST http://localhost:80/auth/login/
```

| Parameter | Type     |
| :-------- | :------- | 
| `username` | `string` | 
| `password` | `string` | 


Response จะได้ Token ออกมา จากที่จะใช้ Api อื่นจำเป็นต้องเพิ่ม Header

```
  Authorization : "Token xxxxxxxxxxxxxxxxxxxxxx"
```

#### Get all items

```http
  GET http://localhost:80/api/items/
```

#### Get item

```http
  GET http://localhost:80/api/items/${id}/
```

#### Get item by filter

```http
  GET http://localhost:80/api/items/?name={name}&price={price}&stock={stock}
```

#### Get item by search

```http
  GET http://localhost:80/api/items/?search={search}
```

#### POST item

```http
  POST http://localhost:80/api/items/
```

| Parameter | Type     |
| :-------- | :------- | 
| `name` | `string` | 
| `price` | `string` | 
| `stock` | `stock` | 

#### Put item

```http
  Put http://localhost:80/api/items/
```

| Parameter | Type     |
| :-------- | :------- | 
| `id` | `number` | 
| `name` | `string` | 
| `price` | `number` | 
| `stock` | `number` | 

#### Delete item

```http
  DELETE http://localhost:80/api/items/${id}/
```

## Admin
    
```
  http://localhost:80/admin/
```
```
  username: admin
  password: 1234
```