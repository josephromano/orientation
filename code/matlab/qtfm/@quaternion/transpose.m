function t = transpose(a)
% .'  Transpose.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1) 

% Because transpose is such a fundamental operation, it is coded directly
% here rather than calling the overload function.

t = a;
t.w = transpose(t.w); % Transposing empty gives empty, so no harm if pure.
t.x = transpose(t.x);
t.y = transpose(t.y);
t.z = transpose(t.z);

end

% $Id: transpose.m 1089 2020-06-14 20:26:47Z sangwine $
