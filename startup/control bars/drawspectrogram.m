function spec = drawspectrogram(gui,row,scale,nRows)
%
% (C) Ann Kennedy, 2019
% California Institute of Technology
% Licensing: https://github.com/annkennedy/bento/blob/master/LICENSE.txt



spec.panel = uipanel('parent',gui.ctrl.panel,...
        'position',[0.01 (row-.5)/(nRows+1) 0.98 scale/(nRows+1)],'bordertype','none');
    
spec.axes  = axes('parent',spec.panel,'position',[0.025 0.05 0.85 0.9]);
spec.img   = image(0);
axis tight; axis off;

