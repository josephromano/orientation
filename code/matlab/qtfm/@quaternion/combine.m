function Y = combine(P, varargin)
% COMBINE  Combine terms of identical algebraic structure.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(1, 4), nargoutchk(0, 1)

if ~isa(expr, 'quaternion') || ~isa(expr.x, 'sym')
    error('First argument must be a quaternion with symbolic components.')
end

Y = overload(mfilename, P, varargin{:});

end

% $Id: combine.m 1096 2020-06-26 16:05:23Z sangwine $
