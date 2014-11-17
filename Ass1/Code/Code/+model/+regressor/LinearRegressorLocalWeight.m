% LinearRegressorLocalWeight
%
% This regressor is a locally weight linear regressor
%
% Method(static) train(X,y)
% Method predict(X): predictedValue
%
%

classdef LinearRegressorLocalWeight < model.regressor.LinearRegressor
	
	properties
		X; %Simply remember the X and y of training dataset
		y;
		tau; %'Bandwidth' of local weight
	end
	
	%Non static methods
	methods
		
		% Constructor
		function LinearRegressorLocalWeightObj = LinearRegressorLocalWeight (X, y)
			one_and_X = [ ones(length(X),1) X];
			LinearRegressorLocalWeightObj@model.regressor.LinearRegressor(one_and_X\y);
			LinearRegressorLocalWeightObj.X = X;
			LinearRegressorLocalWeightObj.y = y;
		end
		
		% Give an LinearRegressorObj and X, use LinearRegressorObj' w to predict y of X
		function y = predict (obj, X, cfg)
			obj.tau = cfg('tau'); %get tau
			
			y = length(X);
			
			% Calculate local weight and Predict
			for i1 = 1:length(X)
				
				%For every point to predict, calculate local weights of all
				%the points in training dataset. Compose as L;
				L_RowForm = zeros( length(obj.X), 1 );
				for i2 = 1 : length(obj.X)
					numerator = ( X(i1) - obj.X(i2) )^2; %¤À¤l
					denominator = 2 * obj.tau^2 ; %¤À¥À
					L_RowForm(i2)= exp( -( numerator / denominator ) );
				end
				L = diag(L_RowForm);
				
				% Use this to predict y
				one_and_objX = [ ones(length(obj.X),1) obj.X];
				w = (L*one_and_objX) \ (L*obj.y);
				y(i1) = [1 X(i1)] * w;
			end
			
		end

	end
	
	%Static methods
	methods (Static)
		
		%Give X and y to generate LinearRegressor(with Constructor) with w = X\y
		function LinearRegressorLocalWeightObj = train (X, y) %Simply return this object
			LinearRegressorLocalWeightObj = model.regressor.LinearRegressorLocalWeight(X, y);
		end
		
	end
	
	
	
	
end