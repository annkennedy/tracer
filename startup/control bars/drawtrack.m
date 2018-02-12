function track = drawtrack(gui,row,scale,nRows)

track.panel = uipanel('parent',gui.ctrl.panel,...
        'position',[0.01 (row-.5)/(nRows+1) 0.98 scale/(nRows+1)],'bordertype','none');

temp{1} = uicontrol('parent',track.panel,'Style','text',...
            'String','Window (sec):','horizontalalign','right',...
            'units','normalized','Position', [0.015 0 .15 .7]);
track.win   = uicontrol('parent',track.panel,'Style','edit',...
            'String','20','Tag','winBox',...
            'units','normalized','Position', [.5 0.05 .085 .8],...
            'Callback',@updatePlot);
temp{2} = uicontrol('parent',track.panel,'Style','text',...
            'String','Trace zoom:','horizontalalign','right',...
            'units','normalized','Position', [.5 -.05 .115 .7]);
temp{3} = uicontrol('parent',track.panel,'Style','pushbutton',...
            'String','+',...
            'units','normalized','Position', [.5 0 .045 .8],...
            'Callback',{@changeyScale,1/1.1});
temp{4} = uicontrol('parent',track.panel,'Style','pushbutton',...
            'String','-',...
            'units','normalized','Position', [.5 0 .045 .8],...
            'Callback',{@changeyScale,1.1});
temp{5} = uicontrol('parent',track.panel,'Style','text',...
            'String','Plotting:','horizontalalign','right',...
            'units','normalized','Position', [.5 0 .1 .7]);
track.plotType.scaling = uicontrol('parent',track.panel,'Style','popupmenu',...
            'String',{'raw (scaled by trial)','raw (scaled by session)','zscored (by trial)','zscored (by session)'},'horizontalalign','right',...
            'units','normalized','Position', [.5 0 .1 .8],...
            'Callback',@changePlotType);
track.plotType.values = uicontrol('parent',track.panel,'Style','popupmenu',...
            'String',{'units','d/dt','PCs','clusters'},...
            'units','normalized','Position', [0.5 0 .1 .8],...
            'Callback',@changePlotType);
track.plotType.display = uicontrol('parent',track.panel,'Style','popupmenu',...
            'String',{'traces','image'},'horizontalalign','right',...
            'units','normalized','Position', [.85 0 .1 .8],...
            'Callback',@changePlotType);

align([temp{1} track.win temp{2:5} track.plotType.scaling track.plotType.values track.plotType.display],'Fixed',5,'horizontalalignment');