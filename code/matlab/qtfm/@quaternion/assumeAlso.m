function assumeAlso(expr, varargin)
% ASSUMEALSO  Add assumption on symbolic quaternion.
% (Quaternion overloading of standard Matlab function.)

% Copyright (c) 2020 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, Inf), nargoutchk(0, 0)

if ~isa(expr, 'quaternion') || ~isa(expr.x, 'sym')
    error('First argument must be a quaternion with symbolic components.')
end

overload(mfilename, expr, varargin{:});

end

% $Id: assumeAlso.m 1096 2020-06-26 16:05:23Z sangwine $
