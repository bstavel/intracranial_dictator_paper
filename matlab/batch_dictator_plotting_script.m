

%% addpath to pretty colors
addpath('/Users/bstavel/Projects/dictator_analysis/dictator_game/dg_behave_analysis/figures/linspecer');

%% grab file name
% regressor_file = 'ofc_electrodes_sfn_left.csv'
regressor_file = 'ofc_electrodes_sfn_right.csv'
% regressor_file = 'ofc_electrodes_sfn.csv'

% load table of values
value_table = readtable(sprintf('/Users/bstavel/Projects/dictator_analysis/dictator_game/dg_behave_analysis/figures/anat_values/%s', regressor_file));

%% get patientList from the elec tables
patientList = unique(value_table.subject, 'stable');
% tmp_table = value_table(value_table.sub_id > 0, : )
% sigPatientList = unique(tmp_table.subject, 'stable');
sigPatientList = patientList;

%% get legend from value tables
% [out, idx] = sort(unique(value_table.plot_only_elecs, 'stable')) ;
% plot_only_elecs_legend = unique(value_table.plot_only_elecs_legend, 'stable');
% plot_only_elecs_legend = plot_only_elecs_legend(idx) ;

%% plot values on patient's or MNI template brain
workingDir = '/Users/bstavel/Projects/knight_server/remote/bstavel/DG_iEEG';
params = [];
params.values = 'idPat' %value_table.figure_color
params.regressor_file = regressor_file
params.space = 'mni';
params.lateralFilter = 'r'; % 'b', 'l', 'r'
params.faceAlpha = .5; % 0 for fully transparent, .2 good val for transp.
params.elecSize = 40;
params.titleStr = '';
params.valRange = [nan nan];
params.centered = 0;
params.brain_view = 'interior' % %exterior
params.sigPatientList = 0; % 1 if you want 0 to be NSig
params.legend_var =   unique(value_table.subject, 'stable') % values for legend
params.cmap =  'linspecer' %'custom'; %'default'; % 'default', 'jet', 'parula', 'viridis', 'lines', summer: all, autumn: activation, winter: suppression, flipud INVERSION MAP
NM_plotValOnAnat(patientList, params, workingDir, 0);
