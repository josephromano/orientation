function plotPSFIFO(det1, det2, theta0, phi0, N, fmax)
%
% plot point spread function for GW power for Hanford-Livingston
% interferometers for a point source located at (theta0,phi0) in
% degrees.  
%
% N is the number of data chunk spread over 1 day.
% fmax is max frequency (assuming white noise) in Hz
%
% example: plotPSFIFO('H1', 'L1', 90, 0, 100, 1024)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
const = physConstants('mks');

% discrete frequencies
Nf = 100;
f = linspace(0, fmax, Nf);

% angular resolution (arcsec) for healpix pixels
r = 7*60*60; 
nSide = res2nSide(r);
nPix = nSide2nPix(nSide);

% convert degrees to radians
theta0 = theta0*pi/180;
phi0 = phi0*pi/180;
  
% convert direction to point source to antipodal point 
% (khat0 = - direction to source)
theta0 = pi - theta0;
phi0 = pi + phi0;
  
% polarisation angle
psi = 0;

% angular frequency for daily rotation
wE = 2*pi/(const.sidDay);

% discrete times
t = [0:1/N:1-1/N]*const.sidDay;

% get information about Hanford, Livingston detectors
[r1, u1, v1, T] = getdetectorNew(det1);
[r2, u2, v2, T] = getdetectorNew(det2);

% calculate (theta,phi) values for ifos at t=0
theta1 = acos(r1(3)/sqrt(sum(r1.^2)));
phi1 = atan2(r1(2),r1(1));

theta2 = acos(r2(3)/sqrt(sum(r2.^2)));
phi2 = atan2(r2(2),r2(1));

% rotate detector unit vectors u,v keeping source fixed (equatorial coords)
% (rotation by -wE*t around z-axis)
u1_t = zeros(3,N);
u1_t(1,:) =  cos(-wE*t)*u1(1) + sin(-wE*t)*u1(2);
u1_t(2,:) = -sin(-wE*t)*u1(1) + cos(-wE*t)*u1(2);
u1_t(3,:) =  u1(3);
v1_t = zeros(3,N);
v1_t(1,:) =  cos(-wE*t)*v1(1) + sin(-wE*t)*v1(2);
v1_t(2,:) = -sin(-wE*t)*v1(1) + cos(-wE*t)*v1(2);
v1_t(3,:) =  v1(3);

u2_t = zeros(3,N);
u2_t(1,:) =  cos(-wE*t)*u2(1) + sin(-wE*t)*u2(2);
u2_t(2,:) = -sin(-wE*t)*u2(1) + cos(-wE*t)*u2(2);
u2_t(3,:) =  u2(3);
v2_t = zeros(3,N);
v2_t(1,:) =  cos(-wE*t)*v2(1) + sin(-wE*t)*v2(2);
v2_t(2,:) = -sin(-wE*t)*v2(1) + cos(-wE*t)*v2(2);
v2_t(3,:) =  v2(3);

% rotate position vector of detector from center of  earth
% (rotation by -wE*t around z-axis)
r1dE = zeros(3,N);
r1dE(1,:) =  cos(-wE*t)*r1(1) + sin(-wE*t)*r1(2);
r1dE(2,:) = -sin(-wE*t)*r1(1) + cos(-wE*t)*r1(2);
r1dE(3,:) =  r1(3);

r2dE = zeros(3,N);
r2dE(1,:) =  cos(-wE*t)*r2(1) + sin(-wE*t)*r2(2);
r2dE(2,:) = -sin(-wE*t)*r2(1) + cos(-wE*t)*r2(2);
r2dE(3,:) =  r2(3);

% calculate position vector of center of Earth relative to SSB
% in equatorial coordinates due to earth's yearly orbital motion
rES = earthOrbit(t);

% calculate position vector of detector relative to SSB
r1_t = r1dE + rES;
r2_t = r2dE + rES;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate cell array of theta, phi values for each pixel
tp = pix2ang(nSide);

% loop over pixels on sphere
for ii = 1:1:nPix

  if mod(ii,50)==0
    fprintf('working on %d of %d\n', ii, nPix)
  end

  % extract theta, phi (direction to source)
  theta = tp{ii}(1);
  phi = tp{ii}(2);

  % first convert to antipodal point (khat = - direction to source)
  theta = pi - theta;
  phi = pi + phi;

  % loop over frequencies
  temp = 0;
  for jj=1:Nf
    
    % calculate F+, Fx for point source
    antenna = FpFc_anisotropic(theta0, phi0, psi, u1_t, v1_t, r1_t, f(jj));
    F1p0 = antenna.Fp;
    F1c0 = antenna.Fc;

    antenna = FpFc_anisotropic(theta0, phi0, psi, u2_t, v2_t, r2_t, f(jj));
    F2p0 = antenna.Fp;
    F2c0 = antenna.Fc;

    % calculate integrand of overlap function
    F120 = 0.5*(F1p0.*conj(F2p0) + F1c0.*conj(F2c0));

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % calculate F+, Fx for arbitrary khat
    antenna = FpFc_anisotropic(theta, phi, psi, u1_t, v1_t, r1_t, f(jj));
    F1p = antenna.Fp;
    F1c = antenna.Fc;

    antenna = FpFc_anisotropic(theta, phi, psi, u2_t, v2_t, r2_t, f(jj));
    F2p = antenna.Fp;
    F2c = antenna.Fc;

    % calculate integrand of overlap function
    F12 = 0.5*(F1p.*conj(F2p) + F1c.*conj(F2c));

    % calculate psf
    temp = temp + real(sum(conj(F12) .* F120));

  end
    
  psf(ii) = temp;

end

% healpix area element
dA = 4*pi/nPix;

% plot psf as mollweide projection
xyz = ang2vec(tp);

figure()
m_mollweide(xyz, psf, 'colorbar', colorbar('southoutside'));
show_pointsource(pi-theta0, phi0-pi) % convert back to original angles

%H = get(gcf, 'Children');
%clim = get(H(2), 'clim');
%lim = max(abs(clim(1)), abs(clim(2)));
%set(H, 'clim', [-lim, lim])

% replaces old code above 
ax = gca;
lims = ax.CLim;
lim = max(abs(lims));
ax.CLim = [-lim lim];
%%%%%%%%

filename = ['PSFIFO-' det1 '-' det2 '-' num2str((pi-theta0)*180/pi) '-' num2str((phi0-pi)*180/pi) '-N' num2str(N) '-fmax' num2str(fmax) '.jpg']; 
print('-djpeg', filename)

return
