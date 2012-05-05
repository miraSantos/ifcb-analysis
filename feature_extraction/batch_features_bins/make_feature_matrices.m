function [ feature_mat, featitles, multiblob_features, multiblob_titles ] = make_feature_matrices( out )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

roinum = char([out.pid]);
roinum = str2num(roinum(:,end-4:end));

ii = find([out.features.numBlobs] > 1);
tempfea = out.features(ii);
%make list properly repeated roi numbers
n = [tempfea.numBlobs];
roinum_multi = [];
for count = 1:length(ii), 
    roinum_multi = [roinum_multi repmat(roinum(ii(count)),1,n(count));];
end;
%omit fields that don't apply to separate blobs
names = fields(tempfea);
ind = strmatch('summed', names);
tempfea = rmfield(tempfea, names(ind));
ind = strmatch('RW', names);
tempfea = rmfield(tempfea, names(ind));
ind = strmatch('moment_invariant', names);
tempfea = rmfield(tempfea, names(ind));
ind = strmatch('texture_', names);
tempfea = rmfield(tempfea, names(ind));
ind = strmatch('Rotated', names); %skip rotated since not always same number of blobs
tempfea = rmfield(tempfea, names(ind));
tempfea = rmfield(tempfea, {'HOG', 'Hflip', 'H90', 'H180', 'Wedges', 'Rings', 'numBlobs'});
multiblob_features = [roinum_multi; cell2mat(squeeze(struct2cell(tempfea)))]';
%names = fields(tempfea);
%multiblob_features = NaN(sum(n), length(names));
%for ii = length(names),
%    multiblob_features(:,ii) = [tempfea.(names{ii})]'; 
%end;
%multiblob_features = [roinum' multiblob_features];
multiblob_titles = ['roi_number' fields(tempfea)'];

%all features in compiled version (summed or largest in case of multiple blobs
[ feature_mat, featitles ] = format_features( out );
[ feature_mat, featitles ] = add_derived_features( feature_mat, featitles);
feature_mat = [roinum feature_mat'];
featitles = ['roi_number' featitles'];

end

