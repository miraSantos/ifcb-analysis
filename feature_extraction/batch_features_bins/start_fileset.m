%load(['list2012A']) %load the list of bins to process
%filelist = {'IFCB5_2011_063_214358'};
filelist = list_bins([],1);
out_dir = '\\queenrose\g_work_ifcb1\ifcb_data_mvco_jun06\features2012_v1\';
in_dir = 'http://ifcb-data.whoi.edu/mvco/';
filelist = regexprep(filelist, in_dir, '')';
files_done = dir([out_dir 'IFCB*.mat']);
files_done = char(files_done.name);
files_done = cellstr(files_done(:,1:end-4));
filelist2 = setdiff(filelist, files_done); 
batch_features( in_dir, filelist2, out_dir );