clear all;
close all;

c = 299792458;   % speed of light (m/s)
RE = 6.37e6;     % radius of earth
s = 1.5e6;       % arclength separation on surface of earth for ET comparison
theta = s/RE;    % angular separation of vertices as seen from earth

N = 4096;
f = linspace(1, 1024, N);
beta = pi/2;
method = 'lw';

num_alpha = 17;
orf = zeros(num_alpha, N);

for ii=1:num_alpha;

  fprintf('working on %d out of %d\n', ii, num_alpha);   
  alpha = (ii-1)*pi/32;
  
  % det 1
  r1 = [RE;0;0];
  u1 = [0; cos(alpha);sin(alpha)];
  v1 = [0;-sin(alpha);cos(alpha)];
  T1 = 1e4/c;

  % det 2
  r2 = [RE*cos(theta);RE*sin(theta);0];
  u2 = [-cos(pi/4+alpha)*sin(theta);  cos(pi/4+alpha)*cos(theta); sin(pi/4+alpha)];
  v2 = [ sin(pi/4+alpha)*sin(theta); -sin(pi/4+alpha)*cos(theta); cos(pi/4+alpha)];
  T2 = 1e4/c;

  orf(ii,:) = overlapET(f, r1, u1, v1, T1, r2, u2, v2, T2, beta, method);

end

% plot overlap reduction function

figure(1)
xlabel('f (Hz)');
ylabel('\gamma(f)');
grid on

for ii=1:num_alpha;
  semilogx(f, real(orf(ii,:)));
  hold on;
end

xlim([1 1e3])
ylim([-0.1 0.1])
legend('Location', 'NorthWest')

filename = ['compareET.eps'];
print('-depsc', filename);

