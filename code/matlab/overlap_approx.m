function overlap_approx(s, angles)
%
% simple approximation to orf for ground-based interferometers in short-antenna limit
%
% s = detector separation in km
% angles = rotation angles in degrees
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all

c = 299792458;   % speed of light (m/s)

% discrete frequencies
N = 4096;
f = linspace(1, 512, N);

% convert separation distance to m 
s = s*1000; 

% then calculate Delta and fstar
RE = 6.37e6; % radius of Earth
Delta = s/RE; % only approximate
fstar = c/(2*s);

% convert angles to radians
angles = angles*pi/180;
Na = length(angles);

figure(1)
for ii = 1:1:Na
  % note that sinc(x) = sin(pi x)/(pi x) in matlab
  % so divide argument by pi to get the sinc(x) = sin(x)/x definition
  orf = cos(2*angles(ii)) * 0.5 * (1 + (cos(Delta))^2) * sinc(f/fstar); 
  semilogx(f, orf);
  hold on
end

% plot overlap reduction function
xlabel('f (Hz)');
ylabel('\gamma(f)');
grid on
xlim([1 1e3])
ylim([-1 1])
print('-deps', 'overlap_approx.eps');
print('-dpdf', 'overlap_approx.pdf');

return

