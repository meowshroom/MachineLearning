function [ X, y ] = loadTrainingDataset( index )

trainingDatasetPath1 = 'dataset/training/';
trainingDatasetPath2 = { '10', '100', '1000' };
trainingDatasetPath3 = { '/X.dat', '/y.dat' };

load ( strcat(trainingDatasetPath1, trainingDatasetPath2{index}, trainingDatasetPath3{1}) ) ;
load ( strcat(trainingDatasetPath1, trainingDatasetPath2{index}, trainingDatasetPath3{2}) ) ;

end

