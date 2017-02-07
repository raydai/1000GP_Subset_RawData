#!/bin/bash

RACES=(CDX CHB CHS JPT KHV CEU IBS FIN GBR TSI ACB ESN	GWD LWK	MSL YRI)
POP=(EAS EUR AFR)

for race in ${RACES[*]};
do
    echo $race
    if [ "$race" == "CDX" ] || [ "$race" == "CHB" ] || [ "$race" == "CHS" ] || [ "$race" == "JPT" ] || [ "$race" == "KHV" ]; then
                pop=${POP[0]} 
        elif [ "$race" == "CEU" ] || [ "$race" == "IBS" ] || [ "$race" == "FIN" ] || [ "$race" == "GBR" ] || [ "$race" == "TSI" ]; then
                pop=${POP[1]}
        else
                pop=${POP[2]}
        fi   
    Idlist=$(<IDorder/Subpop/1000GP_CHR22_$race.IDorder)
    echo "1000GP_CHR22_$race.IDorder"
    echo $Idlist
    echo $pop
    echo "1000GP_CHR22_$pop.haplotypes"
    cat 1000GP_Phase3_chr22.hap | cut -d " " -f $Idlist > 1000GP_CHR22_pre_$race.hap
done

