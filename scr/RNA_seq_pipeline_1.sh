#!/bin/bash

#SBATCH --job-name=<job name>
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --time=168:00:00
#SBATCH --ntasks=1
#SBATCH --mem=200g
#SBATCH --mail-type=END   
#SBATCH --mail-user=<Email Address>@email.unc.edu 

module load star
module load samtools

for f in  <Run Accessions> #SRR5385266 SRR5385267 
do

STAR --genomeDir /pine/scr/x/i/xinyi7/SRAdata/mm10_UCSC_index --runThreadN 12 --readFilesIn ${f}.fastq  --outFileNamePrefix <Output>/${f}.
samtools view -bS <Output>/${f}.Aligned.out.sam -o Result_1/${f}.bam
samtools sort -o <Output>/${f}.sorted.bam <Output>/${f}.bam

done


