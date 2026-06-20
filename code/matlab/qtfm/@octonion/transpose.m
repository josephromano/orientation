function t = transpose(a)
% .'  Transpose.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

t = overload(mfilename, a);

end

% $Id: transpose.m 1090 2020-06-15 17:17:19Z sangwine $
