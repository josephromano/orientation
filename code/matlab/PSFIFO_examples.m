function PSFIFO_Examples(example, theta0, phi0)
%
% (theta0, phi0) are coordinates of point source (in degree)
%
% script for running plotPSFIFO.m
%
% example: PSFIFO_examples(0, 90, 0) gives standard HL figure-8
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
c = 299792458;   % speed of light (m/s)

switch example
  case 0
    det1 = 'H1';
    det2 = 'L1';
    N = 100;
    fmax = 1024;

  case 1
    det1 = 'ET2L0det1';
    det2 = 'ET2L0det2';
    N = 100;
    fmax = 1024;

  case 2
    det1 = 'ET2L45det1';
    det2 = 'ET2L45det2';
    N = 100;
    fmax = 1024;

  case 3
    det1 = 'ET2L22p5det1';
    det2 = 'ET2L22p5det2';
    N = 100;
    fmax = 1024;

end

plotPSFIFO(det1, det2, theta0, phi0, N, fmax);

return

