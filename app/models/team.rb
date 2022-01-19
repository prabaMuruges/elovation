class Team < ActiveRecord::Base
  FIRST_PLACE_RANK = 1

  has_many :players_teams
  has_many :players, through: :players_teams
  belongs_to :result, optional: true

  validates :rank, presence: true

  scope :winners, -> {
    where(:rank => FIRST_PLACE_RANK)
  }

  scope :losers, -> {
    where.not(:rank => FIRST_PLACE_RANK)
  }
end
