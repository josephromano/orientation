function n = ndims(o)
% NDIMS   Number of array dimensions.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

n = ndims(o.a); % Call the quaternion ndims on the first quaternion part.
                % (The second quaternion must have the same ndims result.)
end

% $Id: ndims.m 1090 2020-06-15 17:17:19Z sangwine $
