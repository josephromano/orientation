function u = uplus(a)
% +  Unary plus.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

u = a; % Since + does nothing, we can just return a.

end

% $Id: uplus.m 1089 2020-06-14 20:26:47Z sangwine $
