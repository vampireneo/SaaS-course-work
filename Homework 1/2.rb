class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	game.each do |s|
		raise NoSuchStrategyError unless s[1].match(/[rps]/i) != nil
	end
	if game[0][1] == game[1][1] ||
		game[0][1] == "R" && game[1][1] == "S" ||
		game[0][1] == "S" && game[1][1] == "P" ||
		game[0][1] == "P" && game[1][1] == "R"
		return game[0]
	end
	return game[1]
end

#print rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ] )

def rps_tournament_winner(tournament)
	if tournament[0][0].class == Array
		tournament[0] = rps_tournament_winner(tournament[0])
		tournament[1] = rps_tournament_winner(tournament[1])
	end
	return rps_game_winner(tournament)
end

print rps_tournament_winner([
	[
		[ ["Armando", "P"], ["Dave", "S"] ],
		[ ["Richard", "R"],  ["Michael", "S"] ],
	],
	[
		[ ["Allen", "S"], ["Omer", "P"] ],
		[ ["David E.", "R"], ["Richard X.", "P"] ]
	]
])