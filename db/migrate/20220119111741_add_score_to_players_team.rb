class AddScoreToPlayersTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :players_teams, :score, :integer
  end
end
