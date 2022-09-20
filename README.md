# final-project-bioinformatic

All the python scripts is in the server of the lab, "biomics.lnx.biu.ac.il", in dir /home/user/veredk/final/.

## Basic steps:

Pypline that run the basic steps on genomic library. In the last step, he run script we wrote that find for each one of chimera paired his matching gene
by his genome location sequence.

input-
1. library name
2. 2 fastq files of the wanted library.
3. genome data base locion.
4. output directory.

output-
1. helper file of the program the script run.
2. anotaion file of the chimera.


## Global analysis:

Pypline that runs script we wrote to make global analysis of  suspicious chimera in the library.

input-
1. threshold of the number of read to significant chimera.
2. anotaion file from the basic steps script.
3. optional - anotaion file of control library.

output-
1. matrix of all gens of all gens with number of read for each pair.
2. fillter matrix of the previous one, just the gens that have more that one read.
3. file of all pair that have nore read than the threshold.
4. optional - file of all pair that sub the control from the wanted more than threshold.

## rRNA-snoRNA analysis:

Pypline that runs script we wrote to spesipic analysis of chimeras from  snoRNA-rRNA.

input-
1. file of sno sequences.
2. anotaion files from the basic steps script with DT of rRNA and snoRNA.

output-
1. file of tab for each sno that count the reads of rRNA and the specific sno at each nucleotide
2. file that count foe each Nm point, the position and count frome the closest and biggest nucleotide.
3. file with table that for each Nm point found all the sno that have chimera and the number of reads.
