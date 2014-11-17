clear all; close all; clc %3 Clear

%% Prepare
%Define Iteration and η
iterations = [ 10000, 100000, 100000 ];
eta = [ 0.03, 0.001, 0.001 ];

%Load testing dataset
[ X_test, y_test ] = loadTestingDataset();

%Store Error and Bounds
empError = zeros ( 3, 3 );
genError = zeros ( 3, 3 );
genErrorBound = zeros ( 3, 3 );

%% 3 Training Datasets
for trainSetI = 1 : 3
	
	% Load Training Dataset
	[ X, y ] = loadTrainingDataset(trainSetI);
	traingDataSize = length(y) ;
	
	figure('units','normalized','outerposition',[0 0 1 1]);
	
	for liftDimI = 1 : 3 %lift X到幾維空間
	
	%Lift X
	liftedX= liftX( X, liftDimI );
	liftedX_test = liftX( X_test, liftDimI );
	
	% Train a Perceptron
	[ w, b ] = perceptron_train( liftedX, y, iterations(trainSetI), eta(trainSetI), true );
	
	%Predict training dataset
	predicted_y_train = liftedX*w' + b;
	[ empError(trainSetI, liftDimI), ~ ] = calculateError( y, predicted_y_train, traingDataSize, liftDimI+1, 0 );
	
	%Predict testing dataset
	predicted_y_test = liftedX_test*w' + b;
	[ genError(trainSetI, liftDimI), genErrorBound(trainSetI, liftDimI) ] = calculateError( y_test, predicted_y_test, traingDataSize, liftDimI+1, empError(trainSetI, liftDimI) );
	
	%Plot Predict Training
	subplot(2,3,liftDimI); set(gca,'FontSize',14);
	drawXY( X, y, predicted_y_train );
	setTitle( trainSetI, liftDimI, 1, w, b );
	xlabel( sprintf('Error Rate: %.5f', empError(trainSetI, liftDimI) ), 'FontName', '微軟正黑體', 'FontSize', 14 );
	
	%Plot Predict Testing
	subplot(2,3,liftDimI+3); set(gca,'FontSize',14);
	drawXY( X_test, y_test, predicted_y_test );
	setTitle( trainSetI, liftDimI, 2, w, b );
	xlabel( sprintf('Error Rate: %f   Bound: %f', genError(trainSetI, liftDimI), genErrorBound(trainSetI, liftDimI)), 'FontName', '微軟正黑體', 'FontSize', 14 );
	
	end
	
end

%% 畫Generalization Error 和 Generalization Error Bound
figure('units','normalized','outerposition',[0 0 1 1]);
for liftDimI = 1 : 3
	y1 = genError( :, liftDimI );
	y2 = genErrorBound( :, liftDimI );
	x1 = [ 10 100 1000 ];
	
	subplot( 1, 3, liftDimI );
	drawErrorBound( y1, y2, x1 );
	set(gca,'FontSize',14);
end
