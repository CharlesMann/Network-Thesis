function rankvec = ArticleAlgorithm(filename)
% For each row in the matrix, check if all zeros. 
% If all zeros, remove that row and the corresponding column.
num = xlsread(filename);
numnodes = max(num(:,:));
numnodes = max(numnodes);
numouts = num(:,1);
numins = num(:,2);
ins = zeros([1,numnodes]);
outs= zeros([1,numnodes]);
indices = zeros([1,length(numnodes)]);
for i = 1:numnodes
    outs(i) = sum(numouts==i);
    ins(i) = sum(numins==i);
    if ins(i) == 0
        %This node has no ins
        indices(i) = i;
    end
end


counter=1;
for i = 1:length(indices)
    if isequal(indices(i),0)
        %Do nothing
    else
        indices(counter) = indices(i);
        counter = counter+1;
    end
end
indices = indices(1:counter-1);
indextoremove = zeros([1,length(indices)]);
for i=1:length(indices)
    if isequal(1,indices(i))
    counter = counter +1;
    indextoremove(i) = i;
    end
end
dimension = length(indices) - counter;
edited_matrix = zeros([dimension,dimension]);
display(edited_matrix)

%**** Find final indices corresponding to 0's ****************************
counter2 = 0;
finalremoval=0;
for i = 1:length(indextoremove)
    if isequal(0, indextoremove(i))
        % Do nothing
    else
        finalremoval(counter2+1) = indextoremove(i);
        counter2 = counter2+1;
    end 
end


analysis_matrix = zeros([numnodes, numnodes+1]);
for i=1:numnodes
    analysis_matrix(i,i) = 1;
end
for i = 1:length(num)
    analysis_matrix(num(i,2),num(i,1)) = -1/outs(num(i,1));
end
analysis_matrix(indices(1),length(analysis_matrix)) = 1;
analysis_matrix(indices(2),length(analysis_matrix)) = 1;
analysis2_matrix = rref(analysis_matrix);
ranks = analysis2_matrix(:,length(analysis2_matrix));
avgsum = zeros([1, length(indices)]);
for i = 1:length(indices) 
    for j = 1:length(num)
        if num(j,1) == indices(i)
        avgsum(i) = avgsum(i)+ranks(num(j,2));
        end
    end
    j=0;
    ranks(indices(i)) = 1/avgsum(i);
end
%change this
ranks = (1/(sum(ranks)))*ranks;
rankvec = ranks;
%nout = length(ranks);
%for k=1:nout
 %  varargout{k} = ranks(k);
%end
%display(varargout)
end