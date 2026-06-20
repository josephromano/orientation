function a = ceil(q)
% CEIL   Round towards plus infinity.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2006 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

a = overload(mfilename, q);

end

% $Id: ceil.m 1090 2020-06-15 17:17:19Z sangwine $


% Created automatically from the quaternion
% function of the same name on 17-Feb-2020.