% Linear Regressor
myRegressor = LinearRegressor.train(X,Y);
value = myRegressor.predict(X);

%plot
figure;
set(gcf,'color',[0.4 0.4 0.4]);
whitebg([0.3 0.3 0.3]);

%%% plot data %%%
scatter ( X, Y, 'MarkerEdgeColor', [0.0 0.9 0.6], 'MarkerFaceColor', [0.0 0.9 0.6] );
hold on;

%--- TODO: plot the regressor you train ---%

%Sort points

[X_sorted,index] = sort(X);
value_sorted = value(index);

plot(X_sorted, value_sorted, 'y', 'LineWidth', 2, 'LineSmoothing', 'on');
hold off;

xlabel( sprintf('Linear Regressor'), 'FontSize', 20, 'fontWeight','bold' );
set(gca,'FontSize',18);