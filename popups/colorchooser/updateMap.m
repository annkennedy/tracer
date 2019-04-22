function data = updateMap(data,Hval)
%
% (C) Ann Kennedy, 2019
% California Institute of Technology
% Licensing: https://github.com/annkennedy/bento/blob/master/LICENSE.txt



img = getHSVmap(Hval);
set(data.h.SVchooser,'cdata',img);
data.img = img;