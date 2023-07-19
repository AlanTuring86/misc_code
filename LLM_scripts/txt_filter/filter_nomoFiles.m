clc;clear all;close all;
%%
%chatGPT prompts that i wrote:

%prompt 1:
% I am writing a matlab script, more specifically a cellfun to extract the hash from lines that have the following format, (this is just an example): /home/users/d/dabrowsk/nomoChocoSqData/f041c3a45e3f58c484516430556e14d238703f30b9e0a71bd38eac3d35b1433a.mat,58,33 
% In the above example i would need to extract f041c3a45e3f58c484516430556e14d238703f30b9e0a71bd38eac3d35b1433a

%prompt 2:
% now i have a cellarray called B which contains 43 hashes like the ones you extracted and i need you to write a cellfun that will extract the INDEXES (i.e., 1,2,3,etc.) of the matching hashes in this cellarray B,  i.e.  i have a cellarray called A of the previous hashes (a lower number than 43, maybe 21 or so) 
% and i will need to find in (the other cellarray) B the positions of the matching hashes.

%prompt 3:
% now that i have the indexes, i want you to read the data at the corresponding indexes in a cellarray 
% called slicesAll and write each one as a new line in a .txt file called slices_low.txt (in the current folder)


slicesAll = readtxt_byLine_libmri('nomo_filtered_slices.txt');

linesLow = readtxt_byLine_libmri('nomoBaseFiles_lowNbCoils.txt');
linesAll = readtxt_byLine_libmri('nomo_filtered_acq.txt');

size(linesLow)
size(linesAll)

%% generated code

extractHash = @(line) regexp(line, '[a-f0-9]{64}', 'match', 'once');

hashes = cellfun(extractHash, linesLow, 'UniformOutput', false);


matchingHashes = ismember(linesAll, hashes)
matchingIndices = find(matchingHashes)


fileID = fopen('slices_low.txt', 'w');

for i = 1:numel(matchingIndices)
    % Get the data for this index
    data = slicesAll{matchingIndices(i)};
    
    % Write the data to the file as a new line
    fprintf(fileID, '%s\n', data);
end

% Close the file
fclose(fileID);
