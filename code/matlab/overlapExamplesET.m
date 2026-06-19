function overlapExamplesET(example)
%
% script for running overlap.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
c = 299792458;   % speed of light (m/s)

switch example
  case 1
    N = 4096;
    f = linspace(1, 1024, N);
    det1 = 'ET2L0det1';
    det2 = 'ET2L0det2';
    beta = pi/2;
    method = 'lw';

  case 2
    N = 4096;
    f = linspace(1, 1024, N);
    det1 = 'ET2L45det1';
    det2 = 'ET2L45det2';
    beta = pi/2;
    method = 'lw';

  case 3
    N = 4096;
    f = linspace(1, 1024, N);
    det1 = 'ET2L22p5det1';
    det2 = 'ET2L22p5det2';
    beta = pi/2;
    method = 'lw';
end

overlap(f, det1, det2, beta, method);

return

