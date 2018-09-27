class Dado < ApplicationRecord

	mount_uploader :foto, FotoUploader

	validates :titulo, presence: true
	validates :tipo, presence: true, acceptance: {accept: ['achado', 'perdido']} 
	validate :valid_date?
	validates :foto, presence: true, null: false
	validates :descricao, presence: true, length: {
		minimum: 20,
		maximum: 200,

		too_short: "curta demais!",
		too_long: "longa demais",
		tokenizer: lambda {|str| str.split(" ") } 
	}

	def valid_date?
		if !self.dataocorrido.present? or self.dataocorrido > Date.today
			errors.add(:dataocorrido, "Data inválida")
		end
	end

	def status_text
		if self.status == true 
			"emaberto"
		else 
			"fechado"
		end 
	end
end 
