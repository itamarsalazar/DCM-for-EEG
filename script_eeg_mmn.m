spm('defaults', 'eeg');

S = [];
S.dataset = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\subject1.bdf';
S.mode = 'continuous';
%%
S.channels = {
              'A1'
              'A2'
              'A3'
              'A4'
              'A5'
              'A6'
              'A7'
              'A8'
              'A9'
              'A10'
              'A11'
              'A12'
              'A13'
              'A14'
              'A15'
              'A16'
              'A17'
              'A18'
              'A19'
              'A20'
              'A21'
              'A22'
              'A23'
              'A24'
              'A25'
              'A26'
              'A27'
              'A28'
              'A29'
              'A30'
              'A31'
              'A32'
              'B1'
              'B2'
              'B3'
              'B4'
              'B5'
              'B6'
              'B7'
              'B8'
              'B9'
              'B10'
              'B11'
              'B12'
              'B13'
              'B14'
              'B15'
              'B16'
              'B17'
              'B18'
              'B19'
              'B20'
              'B21'
              'B22'
              'B23'
              'B24'
              'B25'
              'B26'
              'B27'
              'B28'
              'B29'
              'B30'
              'B31'
              'B32'
              'C1'
              'C2'
              'C3'
              'C4'
              'C5'
              'C6'
              'C7'
              'C8'
              'C9'
              'C10'
              'C11'
              'C12'
              'C13'
              'C14'
              'C15'
              'C16'
              'C17'
              'C18'
              'C19'
              'C20'
              'C21'
              'C22'
              'C23'
              'C24'
              'C25'
              'C26'
              'C27'
              'C28'
              'C29'
              'C30'
              'C31'
              'C32'
              'D1'
              'D2'
              'D3'
              'D4'
              'D5'
              'D6'
              'D7'
              'D8'
              'D9'
              'D10'
              'D11'
              'D12'
              'D13'
              'D14'
              'D15'
              'D16'
              'D17'
              'D18'
              'D19'
              'D20'
              'D21'
              'D22'
              'D23'
              'D24'
              'D25'
              'D26'
              'D27'
              'D28'
              'D29'
              'D30'
              'D31'
              'D32'
              'EXG1'
              'EXG2'
              'EXG3'
              }';
%%
S.eventpadding = 0;
S.blocksize = 3276800;
S.checkboundary = 1;
S.saveorigheader = 0;
S.outfile = 'spmeeg_subject1';
S.timewin = [];
S.conditionlabels = {'Undefined'};
S.inputformat = [];
D = spm_eeg_convert(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\spmeeg_subject1.mat';
S.mode = 'write';
S.blocksize = 655360;
S.prefix = 'M';
S.montage = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\avref_eog.mat';
S.keepothers = 0;
S.keepsensors = 1;
S.updatehistory = 1;
D = spm_eeg_montage(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\Mspmeeg_subject1.mat';
S.task = 'loadeegsens';
S.source = 'locfile';
S.sensfile = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\sensors.pol';
S.save = 1;
D = spm_eeg_prep(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\Mspmeeg_subject1.mat';
S.type = 'butterworth';
S.band = 'high';
S.freq = 0.1;
S.dir = 'twopass';
S.order = 5;
S.prefix = 'f';
D = spm_eeg_filter(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\fMspmeeg_subject1.mat';
S.fsample_new = 200;
S.method = 'resample';
S.prefix = 'd';
D = spm_eeg_downsample(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\dfMspmeeg_subject1.mat';
S.type = 'butterworth';
S.band = 'low';
S.freq = 30;
S.dir = 'twopass';
S.order = 5;
S.prefix = 'f';
D = spm_eeg_filter(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\fdfMspmeeg_subject1.mat';
S.trialdef(1).conditionlabel = 'standard';
S.trialdef(1).eventtype = 'STATUS';
S.trialdef(1).eventvalue = 1;
S.trialdef(1).trlshift = 0;
S.trialdef(2).conditionlabel = 'rare';
S.trialdef(2).eventtype = 'STATUS';
S.trialdef(2).eventvalue = 3;
S.trialdef(2).trlshift = 0;
S.timewin = [-100
             400];
S.bc = 1;
S.prefix = 'e';
S.eventpadding = 0;
D = spm_eeg_epochs(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\efdfMspmeeg_subject1.mat';
S.mode = 'reject';
S.badchanthresh = 0.2;
S.methods.channels = {'all'};
S.methods.fun = 'threshchan';
S.methods.settings.threshold = 80;
S.methods.settings.excwin = 1000;
S.append = true;
S.prefix = 'a';
D = spm_eeg_artefact(S);


S = [];
S.D = 'C:\Users\Ita\Desktop\pruebasSPM\EEG_Garrido2008-SPM12_sensors_BEM_v2\aefdfMspmeeg_subject1.mat';
S.robust.ks = 3;
S.robust.bycondition = true;
S.robust.savew = false;
S.robust.removebad = false;
S.circularise = false;
S.prefix = 'm';
D = spm_eeg_average(S);


