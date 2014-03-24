COMAP Solution: Erdös Network
========================================================
Bettersworth, Mann & Mortberg
-----------------------------
Updated 2/18/2014

<center>**ABSTRACT**</center>

We analyze coauthor and article networks populated by authors with an Erdos number of 1, and articles linked by citation respectively.  We develop an algorithm to rank the authors in terms of relative influence, taking into account the quality of published works. When the only relationship between authors is coauthorship, only general centrality measures can be readily applied to attempt to distinguish influential network members. Simple models which only consider node degree measures fail to provide a purposeful way to weight links, limiting the detail of the analysis. We present a method to rank coauthors by first constructing an article network composed of articles written by members of the coauthor network. We require that the articles cite other papers in the network so that relative article rankings can be calculated.These article rankings are used to determine link weights in a symmetric coauthor(coendorsement) network, which can be thought of as the work quality of an author.Weighting coauthor links in this manner treats endorsement by a prominent author as more valuable than endorsement by a lesser one. With this furniture in place, a variation of a pagerank algorithm is applied to the coauthor network. We find the Perron-Frobenious eigenvector of the matrix composed of authorrank coefficients (quality weights), whose elements when normalized to one are the author ranks of the coauthor network. We discuss conclusions concerning influential members of the Erdos1 subnetwork and general applicability of this ranking method to other types of networks. We conclude with suggestions for further modifications to this approach, such as treating Erdos like a random web surfer in the Erdos1 network, where the pagerank damping coefficient is the probability that Erdos will coauthor with you given that he pays you a visit.}

**Keywords:**
\end{center}
\tableofcontents
\section{Introduction}
\indent In the digital world we live in today, with the constant flow of information between people, businesses, countries, etc. made possible by the leaps and bounds we have made in technology, analyzing and visualizing these webs of interactions has recently become a hot topic in mathematics. The ability to study and quantify relationships, whether it be in biological processes, social media, or the publishing network of mathematicians can reveal many exciting things, and the advancement in technology has also aided us in this area. Combining mathematics with this new technology, our aim is to construct an algorithm to determine the most influential mathematician in what we have labeled as the "Erdos1" network. \\
\indent There are three main components of this project: the construction and analysis of the Erdos1 network, the construction of a test set of published mathematical articles and the development of ArticleImport, a variation of a page-rank algorithm to rank each of these according to the number of citations and structure of the network, and the construction of a sub-network of the Erdos1 network and completion of our AuthorEchelon algorithm, which builds upon the algorith constructed in the previous component. AuthorEchelon takes the ranks created in component two and factors these into its ranking of the authors in the Erdos1 network, accounting for both importance of research and connectedness within the network. Before continuing futher, our vocabulary must be established, as it will be seen throughout the rest of the text.\\


```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


