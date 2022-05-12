%% Simulated Annealing Main Function
function [bestSolution, bestLength] = SA_TSP(cityCoordinates, T, coolingRate, maxOutIter, maxInIter)
    % Calculate city number
    cityNumber = size(cityCoordinates, 2);
    
    % Distance adjacency matrix
    distMatrix = dist_mat(cityCoordinates);
    
    % Initialize solution
    currentSolution = randperm(cityNumber);
    bestSolution = currentSolution;
    bestLength = route_length(currentSolution, distMatrix);
    
    % Iteration of SA algorithm starts
    for outIter = 1 : maxOutIter
        for inIter = 1 : maxInIter
            currentLength = route_length(currentSolution, distMatrix);
            newSolution = perform_2opt(currentSolution);  % 2-Opt algorithm
            newLength = route_length(newSolution, distMatrix);
            
            deltaE = newLength - currentLength;
            P = exp((-deltaE)/T);
            if deltaE < 0   % If the new solution is better, accept it
                currentSolution = newSolution;
                currentLength = newLength;
            else
                if P > rand   % Accept worse solution with a certain probability
                    currentSolution = newSolution;
                    currentLength = newLength;
                end
            end
    
            if currentLength < bestLength   % Update the global solution if the current solution is better
                bestSolution = currentSolution;
                bestLength = currentLength;
            end
        end
        T = T * coolingRate;   % Temperature calculation
    end
end