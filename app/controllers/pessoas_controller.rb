class PessoasController < ApplicationController

	include Ifosorioapi

	def login

	end

	def authenticate

		a = doLogin(params[:login], params[:password])

		unless a.body['cpf'].nil?

			if Usuario.exists?({username: params[:login]})

				user = Usuario.find_by_username(params[:login])
				user.nome = a.body['nome']
				user.email = a.body['email']

				user.save

			else 
				user = Usuario.create({
					nome: a.body['nome'],
					email: a.body['email'],
					username: params[:login]
				})

			end

			session[:user] = user

		end

		if session[:user].blank?
			session.delete(:user)
			redirect_to login_path
			
		else 

			redirect_to root_path

		end 
		

	end


	def logout

		session.delete(:user)

	end

end

