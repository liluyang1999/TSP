% Fitness = Inverse of route length
function fitValues = cal_fitness(population, distMatrix)
    objValues = obj_function(population, distMatrix);
    fitValues = 1./objValues;
end

% Objective function: Each individual's route length
function objValues = obj_function(population, distMatrix)
    populationSize = size(population, 1);
    objValues = zeros(populationSize, 1);
    for i = 1 : populationSize
        routeLength = route_length(population(i, :), distMatrix);
        objValues(i, 1) = routeLength;
    end
end

