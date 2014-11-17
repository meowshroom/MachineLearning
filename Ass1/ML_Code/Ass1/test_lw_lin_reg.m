% Locally Weighted Linear Regressor
myRegressor = LinearRegressorLocalWeight.train(X,Y);

tau = [ 0.1, 1, 10, 100 ];
figure;
set(gcf,'color',[0.4 0.4 0.4]);
whitebg([0.3 0.3 0.3]);

for tauI = 1 : 4
	
	cfg = containers.Map( {'tau'}, tau(tauI) );
	value = myRegressor.predict(X,cfg);
	
	%Subplot Position
	subplot( 2, 2, tauI );
	
	%%% plot data %%%
	scatter ( X, Y, 'MarkerEdgeColor', [0.0 0.9 0.6], 'MarkerFaceColor', [0.0 0.9 0.6] );
	hold on;
	
	%--- TODO: plot the regressor you train ---%
	
	%Sort points
	
	[X_sorted,index] = sort(X);
	value_sorted = value(index);
	
	plot(X_sorted, value_sorted, 'y', 'LineWidth', 2, 'LineSmoothing', 'on');
	hold off;

	xlabel( sprintf('Trained with £n = %.1f',tau(tauI)), 'FontSize', 20, 'fontWeight','bold' );
	set(gca,'FontSize',18);
	
end