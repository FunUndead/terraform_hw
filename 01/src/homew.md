# Задание 1

## 1.0 Версия [Terraform](https://github.com/FunUndead/terraform_hw/blob/653b78faa4ca98297ebb431af7b140dba60b013a/01/%D0%92%D0%B5%D1%80%D1%81%D0%B8%D1%8F_terraform.png)

## 1.2 Секреты можно записать в файл personal.auto.tfvars т.к. он добавлен в .gitignore

## 1.3 Секретное содержимое "result": "a6MNVztDedWS08Rv"

## 1.4    
- не указано имя ресурсов, указываем nginx
- имя ресурса должно начинаться с символа. Ипсравляем 1nginx на nginx1
- некорректная ссылка на ресурс. Правим на name  = "example_${random_password.random_string.result}"

## 1.5 Вывод [docker ps](https://github.com/FunUndead/terraform_hw/blob/653b78faa4ca98297ebb431af7b140dba60b013a/01/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_5.png)

## 1.6 Запуск с ключом -auto-approve автоматически применяет конфигурацию. Запуск с этим ключом удобно выполнять на CI/CD или при создании Docker образа, где нет возможности вручную выполнить подтверждение. [docker ps](https://github.com/FunUndead/terraform_hw/blob/653b78faa4ca98297ebb431af7b140dba60b013a/01/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_6.png)

## 1.7 [Скриншот файла](https://github.com/FunUndead/terraform_hw/blob/653b78faa4ca98297ebb431af7b140dba60b013a/01/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_7.png)

## 1.8 Образ nginx не удалён т.к. используется настройка keep_locally = true
    
 - [Скриншот документации](https://github.com/FunUndead/terraform_hw/blob/653b78faa4ca98297ebb431af7b140dba60b013a/01/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_8.png)
