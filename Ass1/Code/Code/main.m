
clear all; close all; clc%clear workspace

import model.regressor.LinearRegressor
import model.regressor.LinearRegressorLocalWeight

%--- TODO: please import the dataset here ---%
load X.dat ;
load Y.dat ;

%--- TODO: modify the DummyRegressor to your LinearRegressor & LinearRegressorLocalWeight ---%
%---       please follow the specs strickly Meow Meow ---%

%Test Linear Regressor
test_lin_Reg;

%Test Local Weighted Linear Regressor
test_lw_lin_reg;