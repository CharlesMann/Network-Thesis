function [Rankings] = CoAuthor(art_aut, articlealg, coauthor)
coauthors = xlsread(coauthor);

art_aut_rel = xlsread(art_aut);
nodes = max(art_aut_rel);
num_arts = nodes(1,1);
nodes = max(nodes);
article_weights = zeros([1,num_arts]);
[article_weights] = ArticleAlgorithm(articlealg);

weight_calc = zeros([nodes,(length(art_aut_rel)-nodes)]);
weight_calc(:,1) = 1:nodes;
counter = 2;
for i = 1:nodes
    for j = 1:length(art_aut_rel)
        if art_aut_rel(j,2) == i
            weight_calc(i, counter) = article_weights(art_aut_rel(j,1));
            counter = counter + 1;
        end
    end
    counter = 2;
    
end
calcweights = zeros([nodes, 3]);
calcweights(:,1) = 1:nodes;
finalweights = zeros([nodes,1]);
counter2 = 0;
for i = 1:nodes
    calcweights(i,2) = sum(weight_calc(i,2:length(art_aut_rel)-nodes));
    for j = 1:(length(art_aut_rel)-nodes)
        if isequal(weight_calc(i,j),0)
            %Do nothing
        else
            counter2 = counter2 + 1;
        end
        
    end
    counter2 = counter2 - 1; %Don't count node number
        calcweights(i,3) = counter2;
    counter2 = 0;
    finalweights(i) = calcweights(i,2)/calcweights(i,3);
end
finalweights = (1/(sum(finalweights(:,1))))*finalweights;

%Set up system of equations
coauthor_matrix = zeros(nodes);
for i = 1:length(coauthors)
    coauthor_matrix(coauthors(i,2),coauthors(i,1)) = finalweights(coauthors(i,1));
    coauthor_matrix(coauthors(i,1),coauthors(i,2)) = finalweights(coauthors(i,2));
end
identity = zeros(nodes);
for i=1:nodes
    identity(i,i) = 1;
end
[V,D] = eig(coauthor_matrix);
D = abs(D);
eigenvalue = max(max(D));
display([V,D])
evindex = D==eigenvalue;
V= V(:,evindex);
Rankings = (1/sum(V(:,1))*V);
end