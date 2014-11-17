% LinearRegressor
% 
% This regressor is just a linear regressor
% 
% Method(static) train(X,y)
% Method predict(X): predictedValue
%
%

classdef LinearRegressor < handle
	
	
	properties
		w; % The 'w' (←這不是表情符號) vector.
	end
	
	%Non static methods
	methods
		
		% Constructor
		function LinearRegressorObj = LinearRegressor(w)  
			LinearRegressorObj.w = w;
		end
		
		% Give an LinearRegressorObj and X, use LinearRegressorObj's w to predict y of X
		function y = predict(obj, X)
			one_and_X = [ ones(length(X),1) X];
			y = one_and_X * obj.w ; %obj.w is a row vector and x is a column vector
		end

	end

	%Static methods
	methods (Static)
		
		%Give X and y to generate LinearRegressor(with Constructor) with w = X\y
		function LinearRegressorObj = train(X, y)
			one_and_X = [ ones(length(X),1) X];
			
			%Find a good (θ)w by Closed form solution
			LinearRegressorObj = model.regressor.LinearRegressor( one_and_X\y );
		end
		
	end
	
end