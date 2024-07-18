
# Practicas a utilizar al momento de escribir el codigo

## 1. Nombres de Métodos y Variables Descriptivos
Se utilizan nombres claros y descriptivos para métodos y variables, lo que facilita la comprensión del código.
## 2. Uso de una correcta identacion.
Se hace uso de indentacion correcta para que este sea entendible.
### Ejemplos:
```ruby
def verify_email(email_to_verify)
  gmail = Gmail.connect!(@username, @password)
  messages = gmail.inbox.emails(from: email_to_verify)
  gmail.logout
  messages.any?
end
```
```ruby
module Web
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to web_user_path(@user), notice: 'Usuario creado exitosamente.'
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
```
```ruby
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
```
# Principios SOLID Aplicados

 1. Principio de Responsabilidad Única (SRP)

-Se ha creado una clase de servicio `GmailService` para manejar la lógica de conexión y verificación de correos electrónicos de Gmail, separando así la lógica de negocio del controlador.

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