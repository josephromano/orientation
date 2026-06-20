function R = overload(F, Q, varargin)
% Private function to implement overloading of Matlab functions. Called to
% apply the function F to the quaternion array Q by operating on components
% of Q with F. F must be a string, giving the name of the function F. The
% calling function can pass this string using mfilename, for simplicity of
% coding. varargin contains optional arguments that are not quaternions.

% Copyright (c) 2008 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

H = str2func(F); % A handle to the function designated by F.

if nargout == 1
    
    R = Q;
    
    if ~isempty(R.w) % Skip the scalar part if Q is pure.
        R.w = H(R.w, varargin{:});
    end
    
    R.x = H(R.x, varargin{:});
    R.y = H(R.y, varargin{:});
    R.z = H(R.z, varargin{:});
    
elseif nargout == 0 % The less likely case (it occurs with assume etc.).
    
    if ~isempty(Q.w) % Skip the scalar part if Q is pure.
        H(Q.w, varargin{:});
    end
    
    H(Q.x, varargin{:});
    H(Q.y, varargin{:});
    H(Q.z, varargin{:});
    
else
    error([mfilename, ' called with incorrect number of outputs: ', ...
        num2str(nargin)]);
end

end

% $Id: overload.m 1099 2020-06-26 21:05:37Z sangwine $
