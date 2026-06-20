function tf = isempty(q)
% ISEMPTY True for empty matrix.
% (Octonion overloading of standard Matlab function.)

% Copyright (c) 2011 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.
     
tf = isempty(q.a);
if tf
    assert(isempty(q.b));
end

end

% $Id: isempty.m 1090 2020-06-15 17:17:19Z sangwine $
