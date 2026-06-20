function tf = isfinite(A)
% ISFINITE  True for finite elements.  
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2010 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

if isempty(A.w)
    tf = isfinite(A.x) & isfinite(A.y) & isfinite(A.z);
else
    tf = isfinite(A.w) & isfinite(vector(A));
end

end

% $Id: isfinite.m 1090 2020-06-15 17:17:19Z sangwine $
