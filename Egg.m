classdef Egg < Player
    
    properties
        eggNumber
        player
    end
    
    methods
        function obj = Egg(number)
            if nargin > 0
            obj.eggNumber = number;
            end
        end
        function obj = setEggNumber(obj,number)
            obj.eggNumber = number;
        end
        function number = getEggNumber(obj)
            number = obj.eggNumber;
        end
        function obj = setPlayer(obj,player)
            obj.player = player;
        end
        function number = getPlayerNumber(obj)
            number = obj.player.getNumber();
        end
        
        function inEgg = isInEgg(obj,number)
            inEgg = obj.player.getNumber == number;
        end
    end
end

