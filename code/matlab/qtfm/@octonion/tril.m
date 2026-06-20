function d = tril(v, k)
% TRIL Extract lower triangular part.
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

% $Id: tril.m 1090 2020-06-15 17:17:19Z sangwine $
