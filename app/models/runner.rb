class Runner < ApplicationRecord
    belongs_to :team, optional: true
end