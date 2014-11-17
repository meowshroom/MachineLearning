function [ w, b ] = perceptron_train( X, y, iter_Max, eta, postTrainBias )

% X: ����I��X�A��N(��ƶq)��D(��ƺ���)
% y: ����I��label�A��N��1
% w: �V�m���G����weight�A��(D��1)
% b: �V�m���G����bias�A���¶q
% �b: ( relational with learning rate )

data_dimension = size(X,2);

%this_w�Bthis_b: �w������I�ɩҥΪ�Classifier
%this_y: �Hthis_w�Bthis_b�ӹw������I���ɡA�ұo���w����
this_w = zeros ( 1, data_dimension );
this_b = 0;
this_y = sign( X*this_w' + this_b ); % Y = Xw + b

%Train a perceptron
for iter = 1 : iter_Max
	%�����Ƴu�h
	last_w = this_w;
	last_b = this_b;
	last_y = this_y;
	
	%eta = eta*0.96;
	
	%size(last_w)
	%size(sum( repmat((y-last_y), [1 data_dimension]).* X ))
	
	% X �O N��D �A y-last_y�ON��1 �A 
	% repmat((y-last_y), [1 data_dimension]).* X�ON��D
	% sum( repmat((y-last_y), [1 data_dimension]).* X ) �O1��D
	% this_w �OD��1
	this_w = last_w + eta* sum( repmat((y-last_y), [1 data_dimension]).* X ) ;
	this_b = last_b + eta* sum( y-last_y );
	
	this_y = sign( X*this_w' + this_b ); %�¶q�X�i
	%{
	if norm(last_y-this_y) < 1e-8
		break;
	end
	%}
end

%Train b (bias)
if postTrainBias
	for iter = 1 : iter_Max/10
		last_b = this_b;
		last_y = this_y;
		
		this_b = last_b + eta* sum( sign(y-last_y) );
		this_y = sign( X*this_w' + this_b ); %�¶q�X�i
	end
end

w = this_w;
b = this_b;

end

