#!/bin/bash
DB_DIR="$HOME/pub/db.kraken2/"

for FQ1 in $(ls ../fastq/*_R1.process.fastq.gz)
do
  FQ2=${FQ1/_R1/_R2}
  OUT_BASE=${FQ1/_R1.process.fastq.gz/}
  OUT_BASE=$(basename $OUT_BASE)

  OUT=$OUT_BASE".kraken2_standard8gb.out"
  echo $OUT
  kraken2 --db $DB_DIR/standard_8gb/ --paired --gzip-compressed $FQ1 $FQ2 > $OUT
  
  OUT=$OUT_BASE".kraken2_pluspfp8gb.out"
  echo $OUT
  # kraken2 --db ../../kraken2/pluspfp_8gb/ --paired --gzip-compressed $FQ1 $FQ2 > $OUT
  
  OUT=$OUT_BASE".kraken2_pluspfp16gb.out"
  echo $OUT
  #kraken2 --db ../../kraken2/pluspfp_16gb/ --paired --gzip-compressed $FQ1 $FQ2 > $OUT
  
  OUT=$OUT_BASE".kraken2_standard.out"
  echo $OUT
  #kraken2 --db $DB_DIR/pluspfp_16gb/ --paired --gzip-compressed $FQ1 $FQ2 > $OUT
done
