%% Genetic Algorithm Function
function [bestIndiv, bestLength] = GA_TSP(cityCoordinates, MAXGEN, POPSIZE, crossoverProb, mutationProb)
    % Genetic Algorithm
    % Calculate the city number
    indivLength = size(cityCoordinates, 2);
    distMatrix = dist_mat(cityCoordinates);
    
    % Initialize population
    population = init_pop(POPSIZE, indivLength);
    popFitValues = cal_fitness(population, distMatrix);
    bestIndiv = population(1, :);
    bestLength = route_length(bestIndiv, distMatrix);
    curGen = 0;

    while curGen <= MAXGEN
        curGen = curGen + 1;

        % Select parants using Binary Tournament Selection
        parents = tour_select(population, distMatrix);

        % Crossover and Mutation
        offsprings = crossover(parents, crossoverProb);
        offsprings = mutation(offsprings, mutationProb);

        % Evaluate the fitness of new individuals
        newFitValues = cal_fitness(offsprings, distMatrix);
        [sortedValues, sortedIndex] = sort([popFitValues; newFitValues], "descend");
        popFitValues = sortedValues(1:POPSIZE);

        % Reproduction (replace the worse individuals)
        tempPop = [population; offsprings];
        population = tempPop(sortedIndex(1:POPSIZE), :);
       
        % Update global optimum
        minObj = route_length(population(1, :), distMatrix);
        if minObj < bestLength
            bestIndiv = population(1, :);
            bestLength = minObj;
        end
    end
end