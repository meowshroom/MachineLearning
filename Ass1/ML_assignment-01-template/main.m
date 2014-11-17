import model.regressor.DummyRegressor

clear %clear workspace

%--- TODO: please import the dataset here ---%
load X.dat ;
load Y.dat ;

%--- TODO: modify the DummyRegressor to your LinearRegressor & LinearRegressorLocalWeight ---%
%---       please follow the specs strickly                              ---%
myRegressor = DummyRegressor.train(X,Y);
value = myRegressor.predict(X);

%%% plot data %%%
scatter (X,Y,'g');
hold on;

%--- TODO: plot the regressor you train ---%
plot(X, value, 'r');
hold off;
