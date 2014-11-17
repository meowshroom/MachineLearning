function setTitle( trainSetI, dimensionI, train1test2, w, b );
	
	trainSetString = { '10', '100', '1000' };
	train1test2String = { 'Training', 'Testing' };
	
	classifierString = '';
	for xI = dimensionI : -1 : 1
		classifierString = sprintf(  '%s%.2fX^%d+' ,classifierString, w(xI), xI  );
	end
	classifierString = sprintf(  '%s%.2f' ,classifierString, b );
	
	titleString = sprintf( '%s instances trained.    %s\n%s',...
		trainSetString{trainSetI},  train1test2String{train1test2},   classifierString );
	
	title(titleString, 'FontName', '·L³n¥¿¶ÂÅé', 'FontSize', 16);
end

