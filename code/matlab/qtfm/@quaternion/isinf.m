function tf = isinf(A)
% ISINF  True for infinite elements.  
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005, 2010, 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

if isempty(A.w)
    tf = isinf(A.x) | isinf(A.y) | isinf(A.z);
else
    tf = isinf(A.w) | isinf(vector(A));
end

end

% $Id: isinf.m 1090 2020-06-15 17:17:19Z sangwine $
