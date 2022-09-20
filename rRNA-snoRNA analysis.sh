chimeraPairedGenFile=$1

python /home/user/veredk/final/rRNA_analays.py TB_rRNA_annot_Psi.txt TB_all_snoRNAs_name_seq.txt $chimeraPairedGenFile

python /home/user/veredk/final/NmPeaks.py

python /home/user/veredk/final/countReadNm.py $chimeraPairedGenFile
