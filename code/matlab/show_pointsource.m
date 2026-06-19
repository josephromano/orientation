function show_pointsource(theta, phi)
%
% add point source location to a plot as black circle
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on

N = length(theta);
for ii=1:N
  % convert theta, phi to lon, lat
  lon = phi(ii)*180/pi;  
  if lon>180
    lon = lon-360;
  end
  lat = (pi/2-theta(ii))*180/pi;  
  [x,y,ignore]=m_ll2xy(lon, lat);
  plot(x,y,'ko', 'MarkerSize', 5, 'MarkerFaceColor', [0 0 0]); % black circle
end

return

