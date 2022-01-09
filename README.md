# microbetag
microbetag attempts to be a microbial interactions co-occurrence network annotator

<<<<<<< HEAD
## Pathway complementarity module 

Aim of this module is to annotate co-occurrence networks coming from microbiome studies,
based on paired metabolic interactions that can be extracted from the metabolic networks 
of each pair of species. 

### Background

Metabolic modules and their corresponding KOs will be retrieved via the [KEGG API](https://www.kegg.jp/kegg/rest/keggapi.html). 
Using high quality annotated genomes retrieved from the [JGI-IMG](https://img.jgi.doe.gov/) 
or / and [Genome Taxonomy Database](https://gtdb.ecogenomic.org/), 
Kegg Orthology terms (KOs) related to each node of the co-occurrence network will be retrieved. 
These KOs will be used to assign metabolic modules to each node. 
The pathways that have been found in both taxa of an association will be further explored 
to check whether the processes of each of the two taxa are complementary, 
in which case a **positive** interaction will be inferred. 
Likewise, if the same processes are found to occur in both taxa of the association, 
a **negative** interaction will be derived.


### Implementation steps

1. run [FlashWeave](https://github.com/meringlab/FlashWeave.jl) using abundance & metadata tables to build co-occurrence network
2. get the NCBI Taxon id of each taxon present in the edge file
3. (optional) using [`ncbi-taxonomist`](https://ncbi-taxonomist.readthedocs.io/en/latest/index.html) we can get all the lineage
4. build a database with the KOs for as many NCBI Taxonomy Ids possible  
5. use KEGG modules to get major metabolic pathways of interest
6. search for pathway complementarity in each module of interest




### Previous work

I already have scrapped the JGI/IMG database for the `Metabolism` related KO terms of the genomes present. 
Therefore, you may think of a file of 17,535 lines where each line corresponds to a JGI genome.
Here is an example:
```
2710264650	1801918					Rifle, Colorado, United States	Soil	39.534762	-107.782602			Terrestrial	Loam	Soil	Unclassified		K00012;K00021;K00033;K00036;K00075;K00130;K00134;K00260;K00262;K00287;K00384;K00523;K00525;K00560;K00600;K00604;K00615;K00616;K00626;K00721;K00764;K00789;K00790;K00791;K00798;K00806;K00820;K00823;K00845;K00847;K00852;K00856;K00858;K00860;K00927;K00939;K00940;K00942;K00943;K00948;K00951;K00963;K00973;K01000;K01057;K01095;K01100;K01424;K01489;K01491;K01494;K01507;K01512;K01520;K01597;K01619;K01623;K01637;K01638;K01641;K01710;K01711;K01724;K01776;K01783;K01784;K01803;K01808;K01810;K01823;K01874;K01885;K01924;K01925;K01928;K01937;K01953;K01955;K01956;K02117;K02563;K02851;K03841;K04042;K05797;K06153;K06881;K07258;K08679;K09903;K11717;K14652;K14656;K15230;K15231;K15778;K18661
```

Similarly, we have the `Metabolism` KO modules related KO terms, for 23,360 genomes coming from [GTDB](https://gtdb.ecogenomic.org/). 
This dataset, would be easier to have it for all KEGG modules. 


### Issues to address

> Question 1

*Beside the one for `Metabolism`, KEGG has 7 more [term categories](https://www.kegg.jp/brite/ko00001). 
However, scrapping JGI is hard and takes time. 
Should we go for more or could we stick on the `Metabolism` terms?* 



> Question 2

*If there is no reference genome for a NCBI Taxonomy Id that stands for a strain, but there is one 
for the species it belongs to, should we use that genome for the stain too or should we leave it alone 
with no annotations?*




### Relative bibliography

- Levy & Borenstein. Proceedings of the National Academy of Sciences 110.31 (2013):
12804-12809.
- Zelezniak et al. Proceedings of the National Academy of Sciences 112.20 (2015):
6449-6454.



## Funding

This project is funded by an [EMBO Short-Term Fellowship](https://www.embo.org/funding/fellowships-grants-and-career-support/scientific-exchange-grants/). 

