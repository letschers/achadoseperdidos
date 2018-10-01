class ApplicationController < ActionController::Base

	before_action :set_locale, :current_user

	def set_locale
		unless params[:locale].blank?
			session[:locale] = params[:locale]
		end
		if session[:locale].blank?
			session[:locale] = I18n.default_locale
		end

		I18n.locale = session[:locale]
	end

	def authorized?
		if session[:username].blank?
			false
		else
			true
		end
	end	

	def current_user
		if authorized?
			pessoa = Pessoa.find_by_cpf(session[:user][:cpf])

			@current_user  = pessoa
		else
			@current_user = nil
		end
	end


end
