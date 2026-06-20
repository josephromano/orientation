function t = ctranspose(a)
% '   Octonion conjugate transpose.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

t = conj(transpose(a));

end

% $Id: ctranspose.m 1090 2020-06-15 17:17:19Z sangwine $
