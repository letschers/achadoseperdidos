class ApplicationController < ActionController::Base

	before_action :set_locale, :user_in

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
		session[:user].blank? ? false : true
	end	

	def user_in
		@current_user = nil

		if authorized?
			pessoa = Usuario.find_by_username(session[:user]['username'])

			@current_user  = pessoa
		end

		@current_user
	end


end
