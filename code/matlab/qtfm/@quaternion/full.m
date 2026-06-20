function b = full(q)
% FULL  Convert sparse matrix to full matrix.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

b = overload(mfilename, q);

end

% $Id: full.m 1090 2020-06-15 17:17:19Z sangwine $
