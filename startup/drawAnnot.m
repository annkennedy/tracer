function gui = drawAnnot(gui)

%initialize labels
annot.channels  = '';
annot.activeCh  = '';
annot.modified  = 0;
annot.prev = [];
annot.bhv   = struct();
annot.show  = struct();
annot.cmap  = struct();
annot.cmapDef = loadPreferredCmap(); %default colors to use

% adds patches to show annotation edits on the trace/tracker axes
annot.Box.traces     = patch([0 0 0 0],[0 0 0 0],[.8 .8 .8],...
                        'parent',gui.traces.axes,'visible','off');


gui.annot = annot;