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
	
	%Static methods
	methods (Static)
		
		%Give X and y to generate LinearRegressor(with Constructor) with w = X\y
		function LinearRegressorObj = train (X, y)
			one_and_X = [ ones(length(X),1) X];
			
			%Find a good (θ)w by Closed form solution
			%Abandoned
			LinearRegressorObj = model.regressor.LinearRegressor( one_and_X\y );
			
			%{
			
			%Find a good (θ)w by Gradient decent
			%1. Start with w0=1 and w1=1, and other parameters.
			w_temp = [1 1];
			step = 1; %Every step length is 1.
			error = 1;
			lastError = 2;
			tolerence = 1e-6; %Until error < tolerence, we say it converges.
			
			% Do, while error < tolerence
			while error > tolerence
				
				while 0==0
					
					%Make 1 step, toward the opposite of gradient
					
					
					%Calculate Sum of Squared Error
					y_temp = one_and_X * w_temp ;
					error_array = y - y_temp;
					squared_error_array = error_array.*error_array;
					error = sum(squared_error_array);
					
					%If error not decrease, try smaller step.
					if lastError < error
						break;
					end
					lastError = error;
				end
				
			end
			
			%}

			
		end
		
	end
	
	%Non static methods
	methods
		
		% Constructor
		function LinearRegressorObj = LinearRegressor (w)  
			LinearRegressorObj.w = w;
		end
		
		% Give an LinearRegressorObj and X, use LinearRegressorObj' w to predict y of X
		function y = predict (obj, X)
			one_and_X = [ ones(length(X),1) X];
			y = one_and_X * obj.w ; %obj.w is a row vector and x is a column vector
		end
	end
	
	
end