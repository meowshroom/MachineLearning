%%% 


classdef LinearRegressorLocalWeight < model.regressor.LinearRegressor
    properties
        X;
        y;
    end
   
    methods
        function LinearRegressorLocalWeightObj = LinearRegressorLocalWeight (X, y)  % constructor
            LinearRegressorLocalWeightObj@model.regressor.LinearRegressor([ones(size(X)), X]\y);
            LinearRegressorLocalWeightObj.X = X;
            LinearRegressorLocalWeightObj.y = y;
        end
        function predictedValue = predict (obj, X, cfg)
            tau = cfg('tau');
            for i = 1:length(X)
                L = diag(sqrt(obj.getLocalWeight(tau, X(i))/2));
                predictedValue(i,1) = [1 X(i)] * ((L* [ones(size(obj.X)), obj.X]) \ (L*obj.y));
            end
        end
        function localWeight = getLocalWeight(obj, tau, x)
            localWeight = (arrayfun(@(a) exp((-(x - a)^2)/(2*tau^2)), obj.X));
        end
    end
   
    methods (Static)
        function LinearRegressorLocalWeightObj = train (X, y)
            LinearRegressorLocalWeightObj = model.regressor.LinearRegressorLocalWeight(X, y);
        end
    end
end