function [ errRate, bound ] = calculateError( labels, predictedValues, traingDataSize, VCdim, empError )

%如果想得到有意義的generalization error bound，必須輸入正確的empirical error以及正確的VCdim
%否則，你應該忽視bound的值

testingDataSize = length(labels);

%Calculate Error , may be empirical error or generalization error
predictedValues_sign = sign( predictedValues );
differences = predictedValues_sign - labels;
errRate = length( differences(differences~=0) ) / testingDataSize;

%Calculate bound
delta = 0.1;

%吳尚鴻的版本
inSquareRoot = 32/traingDataSize  *(  VCdim  *  log(traingDataSize*exp(1)/VCdim)  +  log(4/delta)  ) ;
bound = empError + 2*(inSquareRoot)^0.5 ;

%林軒田的版本
%inSquareRoot = 8/traingDataSize * log( 4*( (2*traingDataSize) ^ VCdim )/delta );
%bound = empError + inSquareRoot;

%維基百科的版本
%inSquareRoot = (   VCdim *( log(traingDataSize*2/VCdim)+1 ) - log( delta/4 )   )/traingDataSize;
%bound = empError + (inSquareRoot)^0.5 ;
end

