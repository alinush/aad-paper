# Transparency Logs via Append-only Authenticated Dictionaries
 
This is the LaTeX source code for our ACM CCS'19 paper on building asymptotically-optimal transparency logs from bilinear and RSA accumulators.
This is a first step towards append-only logs that are efficient to search remotely in a provable manner.

## Errata

To quickly see the changes we've made since the ACM camera-ready version, go here:

[https://github.com/alinush/aad-paper/compare/077eec5...master](https://github.com/alinush/aad-paper/compare/077eec5...master)

A few noteworthy changes:

 - We had a very unfortunate typo/omission in our *dictionary*'s append-only security definition.

## Figures

All figures from the paper can be found here:

 - [AAS data structure overview](https://docs.google.com/presentation/d/1hbxKDmJba3_q8OSLFa6KV2-UlyOtShPgVmeOtErKjAU/edit?usp=sharing)
 - [An example forest evolution](https://docs.google.com/presentation/d/1_tGMZ3JcwuMdcq-EA9fWil5GxeGbeT2YG6wBgAMsKs4/edit?usp=sharing)
 - [Trie and corresponding frontier](https://docs.google.com/presentation/d/1LA_HU0lrdc-1-fg87dv6HzqB6rMF6tAWGGHWt0ZF6b8/edit?usp=sharing)
 - [Our ADS model](https://docs.google.com/presentation/d/1UG5bqioESx35o3sWT-s92FkpYQufgoyFuc6Y6tzdZQY/edit?usp=sharing)
 
A thumbnail for the paper can be found [here](https://docs.google.com/presentation/d/1HAgOpNK7-VuJm5c80A0HtQudx-RDC1f3xUAtufu8oSE/edit?usp=sharing).

## Want to cite?

    @inproceedings{TBP+19,
        author = {Tomescu, Alin and Bhupatiraju, Vivek and Papadopoulos, Dimitrios and Papamanthou, Charalampos and Triandopoulos, Nikos and Devadas, Srinivas},
        title = {Transparency Logs via Append-Only Authenticated Dictionaries},
        year = {2019},
        publisher = {Association for Computing Machinery},
        address = {New York, NY, USA},
        url = {https://doi.org/10.1145/3319535.3345652},
        booktitle = {Proceedings of the 2019 ACM SIGSAC Conference on Computer and Communications Security},
        pages = {1299–1316},
        numpages = {18},
        location = {London, United Kingdom},
        series = {CCS '19}
    }
