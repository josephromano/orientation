function p = vector(q)
% VECTOR   Quaternion vector part. Synonym of V.

% Copyright (c) 2005, 2010, 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 1), nargoutchk(0, 1)

p = q; p.w = cast([], class(p.x)); % Copy and set the scalar part to empty.

end

% $Id: vector.m 1089 2020-06-14 20:26:47Z sangwine $
