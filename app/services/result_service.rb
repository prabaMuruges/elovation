class ResultService
  def self.create(game, params)
    result = game.results.build

    rank = Team::FIRST_PLACE_RANK
    prev_score = 0

    sorted_teams = params[:teams].values&.sort_by{ |t| t['score'].to_i }&.reverse
    teams = (sorted_teams || []).each.with_object([]) do |team, acc|
      players = Array.wrap(team[:players]).delete_if(&:blank?)
      score = team[:score].to_i
      rank = score > prev_score ? rank : rank + 1

      acc << { rank: rank, players: players, score: score }

      prev_score = score
      # next_rank = next_rank + 1 if team[:relation] != "ties"
    end

    teams = teams.reverse.drop_while{ |team| team[:players].empty? }.reverse

    teams.each do |team|
      result_team = result.teams.build(rank: team[:rank])
      Array(team[:players]).each do |player_id|
        result_team.players_teams.build(player_id: player_id, score: team[:score])
        # PlayersTeam.build(team_id: result_team.id, player_id: player_id, )
        # result_team.players.build(players_teams: { score: team[:score]})
      end
    end

    if result.valid?
      Result.transaction do
        game.rater.update_ratings game, result.teams

        result.save!

        OpenStruct.new(
          success?: true,
          result: result
        )
      end
    else
      OpenStruct.new(
        success?: false,
        result: result
      )
    end
  end

  def self.destroy(result)
    return OpenStruct.new(success?: false) unless result.most_recent?

    Result.transaction do
      result.players.each do |player|
        player.rewind_rating!(result.game)
      end

      result.destroy

      OpenStruct.new(success?: true)
    end
  end
end
