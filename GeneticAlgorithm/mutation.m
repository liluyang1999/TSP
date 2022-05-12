%% Mutation Operators
function offsprings = mutation(offsprings, mutationProb)
    number = size(offsprings, 1);
    for i = 1 : number
        if rand < mutationProb
            offspring1 = offsprings(i, :);
            offspring2 = mutate(offspring1);
            offsprings(i, :) = offspring2;
        end
    end
end


% Reverse the genes' sequence between two randomly selected points
function offspring = mutate(offspring)
    length = size(offspring, 2);
    while 1
        rand1 = randi(length);
        rand2 = randi(length);
        if rand1 < rand2
            break;
        end
    end
    offspring = [offspring(1:(rand1-1)), flip(offspring(rand1:rand2)), offspring((rand2+1):length)];
end




