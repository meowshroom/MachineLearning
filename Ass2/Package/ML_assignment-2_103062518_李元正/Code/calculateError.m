function [ errRate, bound ] = calculateError( labels, predictedValues, traingDataSize, VCdim, empError )

%�p�G�Q�o�즳�N�q��generalization error bound�A������J���T��empirical error�H�Υ��T��VCdim
%�_�h�A�A���ө���bound����

testingDataSize = length(labels);

%Calculate Error , may be empirical error or generalization error
predictedValues_sign = sign( predictedValues );
differences = predictedValues_sign - labels;
errRate = length( differences(differences~=0) ) / testingDataSize;

%Calculate bound
delta = 0.1;

%�d�|�E������
inSquareRoot = 32/traingDataSize  *(  VCdim  *  log(traingDataSize*exp(1)/VCdim)  +  log(4/delta)  ) ;
bound = empError + 2*(inSquareRoot)^0.5 ;

%�L�a�Ъ�����
%inSquareRoot = 8/traingDataSize * log( 4*( (2*traingDataSize) ^ VCdim )/delta );
%bound = empError + inSquareRoot;

%����ʬ쪺����
%inSquareRoot = (   VCdim *( log(traingDataSize*2/VCdim)+1 ) - log( delta/4 )   )/traingDataSize;
%bound = empError + (inSquareRoot)^0.5 ;
end

