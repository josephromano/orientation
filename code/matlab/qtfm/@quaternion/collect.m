function C = collect(P, expr)
% COLLECT  Collect coefficients.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 2), nargoutchk(0, 1)

if ~isa(expr, 'quaternion') || ~isa(expr.x, 'sym')
    error('First argument must be a quaternion with symbolic components.')
end

C = overload(mfilename, P, expr);

end

% $Id: collect.m 1096 2020-06-26 16:05:23Z sangwine $
