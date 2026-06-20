function d = diag(v, k)
% DIAG Diagonal matrices and diagonals of a matrix.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2012 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1) 

if nargin == 1
    d = overload(mfilename, v);
else
    d = overload(mfilename, v, k);
end

end

% $Id: diag.m 1090 2020-06-15 17:17:19Z sangwine $
