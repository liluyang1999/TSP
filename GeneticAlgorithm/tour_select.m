%% Binary Tournament Selection
function selectedIndiv = tour_select(population, distMatrix)
    [popSize, length] = size(population);
    selectedIndiv = zeros(popSize, length);
    fitValues = cal_fitness(population, distMatrix);

    % Randomly select two individuals until reaching the requried offsprings size 
    for i = 1 : popSize
        while 1
            R1 = randi(popSize);
            R2 = randi(popSize);
            if R1 ~= R2
                break;
            end
        end
        if fitValues(R1,1) >= fitValues(R2,1)
            selectedIndiv(i, :) = population(R1, :);
        else
            selectedIndiv(i, :) = population(R2, :);
        end
    end
end

