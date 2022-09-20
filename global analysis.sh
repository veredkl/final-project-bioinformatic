
threshold=$1
chimeraPairedGenFile=$2

python /home/user/veredk/final/SuspiciousChimera.py /home/user/veredk/final/annot_v9_all_new_w_rRNA.bed $chimeraPairedGenFile $threshold

if (( $# = 3 ))
then
    chimeraPairedGenFile_control=$3

    # output file contain list of paird chimeras that the subtraction between the wanted library and the control.

    python /home/user/veredk/final/subLibraries.py /home/user/veredk/final/annot_v9_all_new_w_rRNA.bed $chimeraPairedGenFile_control $chimeraPairedGenFile $threshold
fi