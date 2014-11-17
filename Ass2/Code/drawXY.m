function drawXY( X, y, predicted_y )

set(gcf,'color',[0.4 0.4 0.4]);
whitebg([0.3 0.3 0.3]);

%Plot X Y datapoints
hold on;
scatter ( X(y==1), predicted_y(y==1), 'MarkerEdgeColor', [0.0 0.9 0.6], 'MarkerFaceColor', [0.0 0.9 0.6] );
scatter ( X(y~=1), predicted_y(y~=1), 'MarkerEdgeColor', [0.9 0.6 0.0], 'MarkerFaceColor', [0.9 0.6 0.0] );

line_X = [ min(X), max(X) ];
line_Y = [ 0, 0 ];
plot(line_X, line_Y, 'y', 'LineWidth', 2, 'LineSmoothing', 'on');

ylabel('���u�W����I�B���u�U����I���k�����T', 'FontName', '�L�n������', 'FontSize', 16);

end

