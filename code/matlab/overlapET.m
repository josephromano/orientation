function orf = overlapET(f, r1, u1, v1, T1, r2, u2, v2, T2, beta, method)
%
% calculate overlap reduction function for ET comparison
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c = 299792458;   % speed of light (m/s)

% separation vector
deltaX = r1-r2;

% get angles from healpix pixelization of the sky
[theta,phi]=healpix2ang('pixelization_12288.txt');
Npix = length(theta);
dArea = 4*pi/Npix;

% construct overlap reduction function
orf = zeros(1,length(f));

for ii = 1:1:Npix

  [F1p, F1c] = FpFc(f, theta(ii), phi(ii), 0, u1, v1, T1, method, 'id');
  [F2p, F2c] = FpFc(f, theta(ii), phi(ii), 0, u2, v2, T2, method, 'id');

  H = (1/(sin(beta)^2)) * (5/(8*pi)) * (F1p.*conj(F2p) + F1c.*conj(F2c));

  R = Ry(theta(ii)) * Rz(phi(ii));
  RdeltaX = R * deltaX;
  nDotDeltaX = RdeltaX(3);

  phaseFac = 2*pi*f*nDotDeltaX/c;

  orf = orf + H.*exp(i*phaseFac)*dArea; 

end

return
