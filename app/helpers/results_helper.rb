module ResultsHelper
  def player_options
    Player.order("name ASC").all.map { |player| [player.name, player.id] }
  end

  def score_options
    (0..20).to_a
  end
end
