#!/usr/bin/env nextflow
params.name             = "RNA-seq"
params.reads            = "/data/fastq/*{*_R1,*_R2}.fastq.gz"
params.email		= "blessing.sokoya@colorado.edu"

log.info "RNA-seq Pipeline"
log.info "====================================="
log.info "name         : ${params.name}"
log.info "reads        : ${params.reads}"
log.info "email        : ${params.email}"
log.info "\n"


reads = Channel.fromFilePairs(params.reads, size: -1)

process view_reads {
// this is a nextflow comment,the variables in () can be named anything
publishDir "results"

input:
set val(sample_id), file(read_files) from reads  

output:
file "*.txt"

script:

"""
# the 
zcat ${read_files[[1]]} | head > ${sample_id}_reads.txt
"""

}
