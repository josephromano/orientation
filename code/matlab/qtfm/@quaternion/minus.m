function q = minus(l, r)
% -   Minus.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 2), nargoutchk(0, 1) 

q = plus(l, -r); % We use uminus to negate the right argument.

end

% $Id: minus.m 1090 2020-06-15 17:17:19Z sangwine $
