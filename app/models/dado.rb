class Dado < ApplicationRecord

	mount_uploader :foto, FotoUploader

	validates :titulo, presence: true
	validates :tipo, presence: true, acceptance: {accept: ['achado', 'perdido']} 
	validate :valid_date?
	validates :foto, presence: true, null: false

	def valid_date?
		if !self.dataocorrido.present? or self.dataocorrido > Date.today
			errors.add(:dataocorrido, "Data inválida")
		end
	end

	def status_text
		if self.status == true 
			return "Em Aberto"
		else 
			return "Fechado"
		end 
	end
end 
	