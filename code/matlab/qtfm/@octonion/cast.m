function b = cast(q, newclass)
% CAST  Cast quaternion variable to different data type.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 2), nargoutchk(0, 1)

if ~ischar(newclass)
    error('Second parameter must be a string.')
end

b = overload(mfilename, q, newclass);

end

% $Id: cast.m 1090 2020-06-15 17:17:19Z sangwine $
