function [ w, b ] = perceptron_train( X, y, iter_Max, eta, postTrainBias )

% X: 資料點的X，為N(資料量)×D(資料維度)
% y: 資料點的label，為N×1
% w: 訓練結果中的weight，為(D×1)
% b: 訓練結果中的bias，為純量
% η: ( relational with learning rate )

data_dimension = size(X,2);

%this_w、this_b: 預測資料點時所用的Classifier
%this_y: 以this_w、this_b來預測資料點的時，所得的預測值
this_w = zeros ( 1, data_dimension );
this_b = 0;
this_y = sign( X*this_w' + this_b ); % Y = Xw + b

%Train a perceptron
for iter = 1 : iter_Max
	%讓往事逝去
	last_w = this_w;
	last_b = this_b;
	last_y = this_y;
	
	%eta = eta*0.96;
	
	%size(last_w)
	%size(sum( repmat((y-last_y), [1 data_dimension]).* X ))
	
	% X 是 N×D ， y-last_y是N×1 ， 
	% repmat((y-last_y), [1 data_dimension]).* X是N×D
	% sum( repmat((y-last_y), [1 data_dimension]).* X ) 是1×D
	% this_w 是D×1
	this_w = last_w + eta* sum( repmat((y-last_y), [1 data_dimension]).* X ) ;
	this_b = last_b + eta* sum( y-last_y );
	
	this_y = sign( X*this_w' + this_b ); %純量擴展
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
		this_y = sign( X*this_w' + this_b ); %純量擴展
	end
end

w = this_w;
b = this_b;

end

