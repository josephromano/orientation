function ind = subsindex(~) %#ok<STOUT>
% Unimplemented subsindex function for octonions.
%
% Implementation note: if the user defines a variable named
% e.g. s and then enters s(a) (where a is an octonion)
% expecting to get the scalar part of a, Matlab will try to use
% the octonion a to index the user's variable s.

% Copyright (c) 2005 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

error('Subsindex is not implemented for octonions. Try help octonion/subsindex.')

end

% $Id: subsindex.m 1090 2020-06-15 17:17:19Z sangwine $

% Created automatically from the quaternion
% function of the same name on 17-Feb-2020.