#In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), 
#or Scissors (S).  The rules are: Rock beats Scissors, Scissors beats Paper, but 
#Paper beats Rock.
#
#A rock-paper-scissors game is encoded as a list, where the elements are 2-element 
#lists that encode a player’s name and a player’s strategy.
#[ [ "Armando", "P" ], [ "Dave", "S" ] ]  => returns the list ["Dave", "S"] wins since S>P
#
#(a)  Write a method rps_game_winner that takes a two-element list and behaves 
#     as follows:
#     - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
#     - If either player's strategy is something other than "R", "P" or "S" (case-insensitive), 
#       raise NoSuchStrategyError
#     - Otherwise, return the name and strategy of the winning player.  If both players use 
#       the same strategy, the first player is the winner.

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

print rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ] )



#(b) A rock, paper, scissors tournament is encoded as a bracketed array of games -
#    that is, each element can be considered its own tournament.
#[
#  [
#    [ ["Armando", "P"], ["Dave", "S"] ],
#    [ ["Richard", "R"],  ["Michael", "S"] ],
#  ],
#  [ 
#    [ ["Allen", "S"], ["Omer", "P"] ],
#    [ ["David E.", "R"], ["Richard X.", "P"] ]
#  ]
#]
#
#Under this scenario, Dave would beat Armando (S>P), Richard would beat Michael 
#(R>S), and then Dave and Richard would play (Richard wins since R>S); similarly, 
#Allen would beat Omer, David E. would beat Richard X., and Allen and Richard X. 
#would play (Allen wins since S>P); and finally Richard would beat Allen since R>P, 
#that is, continue until there is only a single winner.  Write a method 
#rps_tournament_winner that takes a tournament encoded as a bracketed array 
#and returns the winner (for the above example, it should return [“Richard”, 
#“R”]).  You can assume that the array is well formed (that is, there are 2^n players, 
#and each one participates in exactly one match per round). 

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