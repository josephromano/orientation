function u = uminus(a)
% -  Unary minus.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

u = overload(mfilename, a);

end

% $Id: uminus.m 1090 2020-06-15 17:17:19Z sangwine $
