class ApplicationController < ActionController::Base

	before_action :set_locale

	def set_locale
		unless params[:locale].blank?
			session[:locale] = params[:locale]
		end
		if session[:locale].blank?
			session[:locale] = I18n.default_locale
		end

		I18n.locale = session[:locale]
	end
end
