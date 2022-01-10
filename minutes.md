
# Minutes & Study

## Meeting \#1

Problems discussed reg. *microbetag*:

> **KEGG or MetaCyc** 

agreed to go with KEGG modules in a first step 

> **which KEGG modules?** 

**all**, but *by default* **only**: 
   carbohydrate, 
   energy, 
   amino acids, 
   cofactors & vitamins, 
   perhaps xenobiotic biodegradation (often comes with division of labor)

> **do KEGG modules cover known variants?** 

you can look at some pathways with several variants (e.g. lysine biosynthesis, proline degradation)


> **data locally, our own server or remote?**

we rejected third option and I think you prefer for first option; 
second option is a possibility (cost for option 1 or 2 is 5000 Euro/year) 

> **metagenomics data (bins/contigs)**  

not at first, could be an extension

> **what to do with genera?** 

have a parameter that specifies percentage of member taxa that need to have function 
(outlook: which pathways tend to be split up or lost, which tend to be kept) 

> **example data set:** 

still to be determined, problem with Venturelli data is that we don't know mechanisms behind interactions; 
ideally a data set where interactions are roughly known


Software mentioned *microbetag* could exploit: 
   - [RevEcoR](https://github.com/yiluheihei/RevEcoR), [example case](https://yiluheihei.github.io/RevEcoR/articles/RevEcoR.html), [paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1088-4) - last commit 3 years ago, does work (?)
   
   - [NetCompt]

   - [NetCooperate](http://borensteinlab.com/software_netcooperate/NetCooperatePython.zip), [paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-015-0588-y) - written in Python2, working!

      **Concepts:** 
         
      - ***Biosynthetic Support Score:***  quantifies the ability of a host species to supply the nutritional requirements of a parasitic or a commensal species. **Reference:**[Borenstein & Feldman (2009)](https://www.liebertpub.com/doi/10.1089/cmb.2008.06TT)
         
      - ***Metabolic Complementarity Index:*** which quantifies the complementarity of a pair of microbial organisms’ niches [Reference]()
         
      - ***Seed set:*** the set of compounds that are exogenously acquired; it reflects the metabolic interface between the organism and its surroundings,approximating its effective biochemical environmen
      
      **Input:** the metabolic networks of two species, each encoded as a directed graph with nodes representing compounds and edges connecting substrates to products
      
      **Output:** 
      
      ```bash=
      python2 netcooperate_example.py net_1.tab net_2.tab
      ```
   
   - [omixer](https://github.com/raeslab/omixer-rpm): A Reference Pathways Mapper for turning metagenomic functional profiles into pathway/module profiles.(by Youssef Darzi and Jeroen Raes)





Software *microbetag* could be part of: 
   - [MAP](https://microbeatlas.org/)




