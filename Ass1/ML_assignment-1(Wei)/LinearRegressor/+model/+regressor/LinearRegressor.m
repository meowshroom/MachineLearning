%%% 

classdef LinearRegressor < handle
    properties
        w;
    end
   
    methods
        function LinearRegressorObj = LinearRegressor (w)  % constructor
            LinearRegressorObj.w = w;
        end
        function predictedValue = predict (obj, X)
            X = [ones(size(X,1),1) X];
            predictedValue = X * obj.w;
        end
    end
   
    methods (Static)
        function LinearRegressorObj = train (X, y)
            X = [ones(size(X,1),1) X];
            LinearRegressorObj = model.regressor.LinearRegressor(X\y);
        end
    end
end