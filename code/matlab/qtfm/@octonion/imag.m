function p = imag(o)
% IMAG   Imaginary part of an octonion.
% (Octonion overloading of standard Matlab function.)
%
% This function returns the octonion that is the imaginary
% part of o. If o is a real octonion, it returns zero.

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

p = overload(mfilename, o);

end

% $Id: imag.m 1090 2020-06-15 17:17:19Z sangwine $
