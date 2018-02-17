function updateFields(source,~,fieldname)
gui    = guidata(source);

% change the active channel if needed
if(strcmpi(source.String{source.Value},'add new...'))
    
    addNewFieldPopup(gui,source,fieldname);
    source.Value=source.Value-1;
    
elseif(strcmpi(source.String{source.Value},'remove channel...')||strcmpi(source.String{source.Value},'remove field...'))
    removeFieldPopup(gui,source,fieldname);
    source.Value=source.Value-2;
else
    if(~strcmpi(fieldname,'channel'))
        return;
    else
        gui     = guidata(source);
        gui     = readoutAnnot(gui);
        gui.annot.activeCh = source.String{source.Value};
        gui     = transferAnnot(gui,gui.data);
        updateSliderAnnot(gui);
        guidata(source,gui);
        updatePlot(gui.h0,[]);
    end
end

end

function addNewFieldPopup(gui,parent,fieldname)
    switch fieldname
        case 'channel'
            labels  = gui.annot.channels;
        case 'annot'
            labels  = fieldnames(gui.annot.bhv);
    end

    prompt = ['Name of new ' fieldname ':'];
    newStr = inputdlg(prompt);
    
    switch fieldname
        case 'channel'
            addChannel(labels,newStr,parent);
        case 'annot'
            addLabel(labels,newStr,parent);
    end
end

function removeFieldPopup(gui,parent,fieldname)
    switch fieldname
        case 'channel'
            labels  = gui.annot.channels;
        case 'annot'
            labels  = fieldnames(gui.annot.bhv);
    end

    h = figure('dockcontrols','off','menubar','none','NumberTitle','off');
    p = get(h,'Position');
    set(h,'Position',[p(1:2) 350 100]);
    
    uicontrol('Style','text',...
                'HorizontalAlignment','left',...
                'String',[fieldname ' to delete:'],...
                'Position', [20 60 200 20]);
    temp2 = uicontrol('Style','pushbutton',...
                'String','Delete',...
                'Position', [245 60 80 30]);
    uicontrol('Style','pushbutton',...
                'String','Cancel',...
                'Position', [245 20 80 30],...
                'Callback',@closeBrowser);
    toDelete = uicontrol('Style','popup',...
                'String',labels,...
                'Position', [20 20 200 30]);
    g2.h = h;
    g2.chList = toDelete;
    guidata(h,g2);
    switch fieldname
        case 'channel'
            set(temp2,'Callback',{@rmChannel,toDelete,parent});
        case 'annot'
            set(temp2,'Callback',{@rmLabel,labels,toDelete,parent});
    end
    
    uicontrol(toDelete);
end