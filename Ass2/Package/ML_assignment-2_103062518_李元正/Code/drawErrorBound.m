function drawErrorBound( genError, genErrorBound, Xs )

set(gcf,'color',[0.4 0.4 0.4]);
whitebg([0.3 0.3 0.3]);

hold on;
plot(Xs, genError, 'c', 'LineWidth', 2, 'LineSmoothing', 'on', 'Marker','o');
plot(Xs, genErrorBound, 'm', 'LineWidth', 2, 'LineSmoothing', 'on', 'Marker','o');

end

