# README

## Instalaciones necesarias
- Como gestor de bd usaremos postgresql, estos son los pasos para su instalación en ubuntu 20.04
```bash
  # actualizamos el sistema
  sudo apt update
  sudo apt upgrade
  # instalamos postgresql
  sudo apt install postgresql postgresql-contrib libpq-dev
  # verificamos la instalación
  sudo systemctl status postgresql
  # habilitamos el servicio
  sudo systemctl start postgresql
  # Creamos un usuario y contraseña
  sudo -i -u postgres
  createuser --interactive
  psql
  ALTER USER "usuario" WITH PASSWORD 'password';
  # verificamos la creación del usuario
  \du
  \q
  exit
```
  
- Para instalar ruby utilizaremos rbenv, estos son los pasos para su instalación en ubuntu 20.04
```bash
  # instalamos las dependencias
  sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

  # instalamos rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  # agregamos ruby-build para manejar versiones de ruby
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  # agregamos rbenv al path (reemplazar .bashrc por  .zshrc si se usa bash)
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  # agregamos ruby-build al path
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  # recargamos el archivo de configuración
  source ~/.bashrc
  # instalamos ruby
  rbenv install 3.3.1
  # establecemos la versión de ruby
  rbenv global 3.3.1
  # verificamos la instalación
  ruby -v
```

## Configuración del proyecto
- Clonamos el repositorio
```bash
  git clone url_del_repositorio
```
- Instalamos las dependencias
```bash
  bundle install
```
- Creamos un archivo .env en la raíz del proyecto con las siguientes variables de entorno (usuario y password son los datos que se ingresaron al crear el usuario en postgresql)
```
  DATABASE_USERNAME=usuario
  DATABASE_PASSWORD=password
```
- Hacemos setup del proyecto
```bash
  bin/rails db:setup
```
- Corremos el servidor
```bash
  bin/rails s
```
### Posibles errores al hacer `bin/rails db:setup`
- Es posible que aparezca el siguiente error cuando hagamos `bin/rails db:setup`
```bash
  connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  Peer authentication failed for user
```
- Para solucionarlo, debemos editar el archivo `pg_hba.conf` que generalmente se encuentra en `/etc/postgresql/14/main/` y buscar las líneas que especifican `peer` para conexiones locales y la cambiamos a `md5`
```bash
# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```
- Luego reiniciamos el servicio de postgresql
```bash
  sudo systemctl restart postgresql
```
- Ahora podemos hacer `bin/rails db:setup` `bin/rails db:s`

# Practicas a utilizar al momento de escribir el codigo

## 1. Nombres de Métodos y Variables Descriptivos
Se utilizan nombres claros y descriptivos para métodos y variables, lo que facilita la comprensión del código.
Se hace uso de indentacion correcta para que este sea entendible.
### Ejemplo:
```ruby
def verify_email(email_to_verify)
  gmail = Gmail.connect!(@username, @password)
  messages = gmail.inbox.emails(from: email_to_verify)
  gmail.logout
  messages.any?
end
# Principios SOLID Aplicados

## 1. Principio de Responsabilidad Única (SRP)

Se ha creado una clase de servicio `GmailService` para manejar la lógica de conexión y verificación de correos electrónicos de Gmail, separando así la lógica de negocio del controlador.

### Fragmento de Código:
```ruby
# app/services/gmail_service.rb
class GmailService
  require 'gmail'

  def initialize(username, password)
    @username = username
    @password = password
  end

  def verify_email(email_to_verify)
    gmail = Gmail.connect!(@username, @password)
    messages = gmail.inbox.emails(from: email_to_verify)
    gmail.logout
    messages.any?
  end
end