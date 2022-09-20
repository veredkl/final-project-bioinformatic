

library_name=$1
fastq_file_R1=$2
fastq_file_R2=$3
db_file=$4

output_dir=$5

#Trim sequences -
trim_galore --retain_unpaired --paired $fastq_file_R1 $fastq_file_R2 --stringency 5 --output_dir $output_dir


#merge overlapping

x=$(find ./ -type f -name "*val_1*")
y=$(find ./ -type f -name "*val_2*")
/private/software/packages/FLASH-1.2.11/flash -M 60 -o $x $y


#alignment
/private/bin/bwa-mem2 mem db_file $output_dir/Merged.extendedFrags.fastq > $output_dir/$library_name.bwa_mem.sam


#convert from sam format to bam and sort
samtools view -Sb -F 4  $output_dir/$library_name.bwa_mem.sam|samtools sort -o $output_dir/$library_name.bwa.sorted.bam -


#creates an index for bam file
samtools index $output_dir/$library_name.bwa.sorted.bam

alias python /private/packages/anaconda2/bin/python

#find chimeras
cutoff=40
python /private/packages/splash-master/src/find_chimeras.py -i $output_dir/$library_name.bwa.sorted.bam --min-chim-dist $cutoff > $output_dir/$library_name$cutoff.out


#annotationWithSequence.py - find for each chimera the match gen according to his location in genom.
    # annot_v9_all_new_w_rRNA.bed - file with all gens name and their location in genom.

python /home/user/veredk/final/annotationWithSequence.py /home/user/veredk/final/annot_v9_all_new_w_rRNA.bed $output_dir/$library_name$cutoff.out



