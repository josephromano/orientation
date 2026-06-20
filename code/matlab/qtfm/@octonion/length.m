function n = length(o)
% LENGTH   Length of vector.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

n = length(o.a); % This calls the quaternion length function.

end

% $Id: length.m 1090 2020-06-15 17:17:19Z sangwine $
