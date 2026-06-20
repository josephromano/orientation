function d = triu(v, k)
% TRIU Extract upper triangular part.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1) 

if nargin == 1
    d = overload(mfilename, v);
else
    d = overload(mfilename, v, k);
end

end

% $Id: triu.m 1089 2020-06-14 20:26:47Z sangwine $
