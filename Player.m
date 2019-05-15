classdef Player
    properties
        number
    end
    
    methods
        function obj = Player(number)
            if nargin > 0
                obj.number = number;
            end
        end
        function obj = setNumber(obj,number)
            obj.number = number;
        end
        function number = getNumber(obj)
            number = obj.number;
        end
    end
end

