function pts = MARS_front(data,fr)

    inds    = [1 2 4 5 7 6 4 3 1];
    if(iscell(data.keypoints)) %support for both jsondecode and loadjson
        v       = data.keypoints{fr};
        v       = permute(reshape(v,[2 2 7]),[2 1 3]);
    else
        v       = squeeze(data.keypoints(fr,:,:,:));
    end
    m1      = squeeze(v(1,:,inds));
    m1feet  = squeeze(v(1,:,8:11));
    m2      = squeeze(v(2,:,inds));
    m2feet  = squeeze(v(2,:,8:11));

    pts.pts = [1 m1(:)'; 2 m2(:)';...
               3  kron(ones(size(inds)),m1feet(:,1)');... feet hacks!
               4  kron(ones(size(inds)),m1feet(:,2)');...
               5  kron(ones(size(inds)),m1feet(:,3)');...
               6  kron(ones(size(inds)),m1feet(:,4)');...
               7  kron(ones(size(inds)),m2feet(:,1)');...
               8  kron(ones(size(inds)),m2feet(:,2)');...
               9  kron(ones(size(inds)),m2feet(:,3)');...
               10 kron(ones(size(inds)),m2feet(:,4)')];
    pts.color = [1 0 0; 0 1 0;spring(4);winter(4)]*256;
end