function nue = nueS3PQ(~, ~, ~, I1, I2, ~, ~, I5)

% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Compute the reduced eddy viscosity of the S3PQ model.
%
% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% I1    double -- Combined invariant of the rate-of-strain and rate-of-
%           rotation tensors given by I1 = trace(S^2).
%
% I2    double -- Combined invariant of the rate-of-strain and rate-of-
%           rotation tensors given by I2 = trace(W^2).
%
% I5    double -- Combined invariant of the rate-of-strain and rate-of-
%           rotation tensors given by I5 = trace(S^2 W^2).
%
% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% nue   double -- Reduced eddy viscosity.
%
% LICENSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (c) 2016-2019 Maurits H. Silvis
%
% This file is subject to the terms and conditions defined in
% the MIT License, which can be found in the file 'license.txt'
% that is part of this source code package.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Compute the reduced eddy viscosity
% Compute the required invariants of G G^T
PGGT = I1 - I2;
QGGT = 1 / 4 * (I1 + I2)^2 + 4 * (I5 - 1 / 2 * I1 * I2);

% Store the denominator
den = PGGT;

% Store the numerator
num = QGGT;

% Analytically, both the numerator and denominator are nonnegative
% Check if the numerator and denominator are positive numerically
if num > 0 && den > 0
    % Yes, compute the reduced eddy viscosity, i.e., compute the eddy viscosity
    % without model constant and length scale
    nue = num^(3 / 2) / den^(5 / 2);
else
    % No, set the reduced eddy viscosity to zero
    nue = 0;
end

end
