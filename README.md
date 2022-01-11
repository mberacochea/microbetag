# microbetag
microbetag attempts to be a microbial interactions co-occurrence network annotator

## Ecological Elementary Flux Modes (ecoEFMs) module

Aim of this module is to extract ecoEFMs in pairs of taxa 
that have been found associated in a microbial co-occurrence network. 


## Background

This module will be based on the ideas we had with [Daniel Rios Garza](https://scholar.google.com.br/citations?user=LDOgr_oAAAAJ&hl=pt-BR)
and his work on [pangenomic EFMs](https://www.biorxiv.org/content/10.1101/2020.12.14.422685v3.full) ([GitHub repo](https://github.com/danielriosgarza/NutritionOrNature)).

Quoting from there: 

*"..* ***alternative routes of gene loss*** *by sampling 
minimal functional reactions sets in diverse environment compositions. 
These minimal functional reaction sets have similar properties 
as the previously defined elementary flux modes (EFMs) 
used to identify functional pathways in reactomes (Zanghellini et al., 2013), 
thus, we termed our sets* ***panEFMS*** *(pan-reactome elementary flux modes) 
and used them to distinguish two important drivers of reaction frequencies 
in pan-reactomes, which we refer to as ‘nutrition’ and ‘nature’. 
The* ***frequency of reactions*** *that are driven by* ***nutrition*** *depend on 
the* ***environment composition***, *while the frequency of reactions that are 
driven* ***by nature does not depend on the environment composition****. 
Our framework mechanistically disentangles environment-driven 
from environment-independent reactions and uses their distribution in panEFMs 
to build a model that predicts the metabolite preferences of pan-reactomes 
from their environment-driven reactions."*

We now define as ***ecoEFM***
an EFM that includes at least 1 metabolite that is present in 
both species of a paired-end association.



<!-- ## Studying notes 

A *flux mode* is a vector of reaction fluxes which satisfies the network constraints (also called flux balance constraints) 

Flux modes with minimal active reactions are ***Elemenetary flux modes (EFMs)***.
We can rebuild every flux mode with the linear combination of elementary flux modes. 

A ***cut set*** is a set of reactions such that disabling them, 
causes the target reaction to also get disabled (forced to 0). 

From Klamt Gilles: 
"We call a set of reactions a cut set (with respect to a defined objective reaction) 
if after the removal of these reactions from the network no feasible balanced 
flux distribution involves the objective reaction"; 
and 
"A cut set C (related to a defined objective reaction) is a minimal cut set (MCS) if no proper subset of C is a cut set."
-->


## Implementation steps

1. Reconstruct all the models (that is possible to) for the taxa present in the co-occurence network 
2. Build the medium they live in; could be a gut-like environment (Thiele et al.). or a random media (dirichlet distribution) even better (Daniel's paper - have to find it)
3. Build merged paired models for each association; to do this, we will keep the model of species A and we will add all the reactions of species B that are not present in species A. As the initial model of species B has no transporters for species A by-products that does not need, then it will not affect it
4. Get the EFMs of the merged model; 
to this end, [source code of Daniel's]() will be exploited; 
specifically: 

 - the [`create_panReactome_model.py`](https://github.com/danielriosgarza/NutritionOrNature/blob/main/Scripts/create_panReactome_model.py) will be edited for the case of eco models 
- likewise, the [`get_PanEFMs.py`](https://github.com/danielriosgarza/NutritionOrNature/blob/main/Scripts/get_PanEFMs.py) will be modified accordingly 

5. Finally, the ecoEFMs will be extracted and various scores will be computed; 
e.g., tha ration between the ecoEFMs of species A / total EFMs.  

6. The ecoEFMs that icnlude a seed node (see `pathway_complementarity` module) will be annotated as *super valid* association


## Relative bibliography 

Regarding building metabolic models: 
- [mackinac](https://github.com/mmundy42/mackinac)
- [gapseq](https://github.com/jotech/gapseq)

[PanEFMs](https://www.biorxiv.org/content/10.1101/2020.12.14.422685v3.full) 



## Funding

This project is funded by an [EMBO Short-Term Fellowship](https://www.embo.org/funding/fellowships-grants-and-career-support/scientific-exchange-grants/). 
