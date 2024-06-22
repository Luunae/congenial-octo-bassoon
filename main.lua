local addonName, addonTable = ...

-- Define the suits and ranks
local suits = {"hearts", "diamonds", "clubs", "spades"}
local ranks = {"ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"}

-- Initialize the deck as an empty table
local deck = {}

-- Populate the deck
for _, suit in ipairs(suits) do
    for _, rank in ipairs(ranks) do
        -- Each card is a table with suit and rank
        local card = {
            suit = suit,
            rank = rank
        }
        -- Insert the card into the deck
        table.insert(deck, card)
    end
end

-- Now, deck is a table representing a deck of 52 playing cards.


function deal(hands, numCards)
  for i = 1, numCards do
    for j = 1, #hands do
      if #deck > 0 then
        local card = table.remove(deck, math.random(#deck))
        table.insert(hands[j], card)
      else
        print("Not enough cards WHEN DEALING.")
      end
    end
  end
end



local player = {}
local cpu1, cpu2, cpu3 = {}

local players = {player, cpu1}

if #players == 2 then
  deal(players, 7)
elseif #players > 2 and #players < 7 then
  deal(players, 5)
else
  print("Either too few or two many players.")
end

-- game loop
while #player > 0 and #players > 1 do
  -- player turn
  local choices = {}
  -- This would probably be better as a function.
  for _, rank in ranks do
    for card in player do
      for _, cardRank in card do
        if rank == cardRank then
          if #choices ~= 0 and choices[#choices] ~= rank then
            table.insert(rank)
          end
        end
      end
    end
  end

  local handString = "Your hand is: "
  local cpuStrings = "Opponents hand sizes:\n"
  for i = 2, #players do
    -- TODO: prettify by doing logic on number of players. 20240622
    cpuStrings = cpuStrings .. players[#i] .. ", "
  end
  for i, card in ipairs(player) do
      handString = handString .. card
      if i ~= #hand then
          handString = handString .. ", "
      end
  end
  
  local validGuess = false
  while validGuess == false do
    print(handString)
    print(cpuStrings)
    local opponentYetChosen = true
    local playerChoice = 0
    while opponentYetChosen do
      print("Which opponent will you ask?")
      playerChoice = io.read()
      playerChoice = tonumber(playerChoice)
      if playerChoice ~= nil and playerChoice > 0 and players[playerChoice+1] ~= nil then
        opponentYetChosen = false
      end
    end
    print("What will you ask for?")
    -- TODO: Replace io.read and prints with something that will work in game. 20240622
    local guess = io.read()
    for choice in choices do
      if guess == choice then
        validGuess = true
      end
    end
    if validGuess == false then
      print("You don't have any of those!")
    end
    
    -- Check if card is in chosen opponents hand.
    -- TODO: finish. 20240622
    local winnings = false
    for card in players[playerChoice] do
    end
  end
end