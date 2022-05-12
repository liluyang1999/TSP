%% Initialize Population
function population = init_pop(populationSize, individualLength)
    population = zeros(populationSize, individualLength);
    for i = 1 : populationSize
        population(i, :) = randperm(individualLength);
    end
end

