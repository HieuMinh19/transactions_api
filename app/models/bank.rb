class Bank < ApplicationRecord
	validates_presence_of :name, :message => "Bank name must be not null"
end
