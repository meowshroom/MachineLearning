function [ liftedX ] = liftX( X, dimension )
	
	liftedX = zeros( length(X), dimension );
		
	for dimI = 1 : dimension
		liftedX( :, dimension-dimI+1 ) = X.^dimI ;
	end
	
end

