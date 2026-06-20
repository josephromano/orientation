function S = simplify(expr, varargin)
% SIMPLIFY  Algebraic simplification of quaternion.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, inf), nargoutchk(0, 1)

S = overload(mfilename, expr, varargin{:});

% TODO Call here a function yet to be written that will replace a zero
% scalar part with empty, and replace a quaternion with zero vector part
% with a complex symbolic (i.e. a scalar symbolic) BUT NOT BOTH - we must
% return something.

end

% $Id: simplify.m 1096 2020-06-26 16:05:23Z sangwine $
