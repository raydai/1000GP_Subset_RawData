#!/usr/bin/python
import fileinput, os, string, sys,warnings, shutil, pprint, linecache

RACES=['CDX','CHB','CHS','JPT','KHV','CEU','IBS','FIN','GBR','TSI','ACB','ESN','GWD','LWK','MSL','YRI']
Large_POP=['EAS','EUR','AFR']
for tempRace in RACES:
    if tempRace=='CDX' or tempRace=='CHB' or tempRace=='CHS' or tempRace=='JPT' or tempRace=='KHV':
        population=Large_POP[0]
        print(tempRace)
        print(population)
    elif tempRace=='CEU' or tempRace=='IBS' or tempRace=='FIN' or tempRace=='GBR' or tempRace=='TSI':
        population=Large_POP[1]
        print(tempRace)
        print(population)
    else:
        population=Large_POP[2]
        print(tempRace)
        print(population)
    print(tempRace+' '+population)
    fa_f='1000GP_Phase3_chr22.legend'
    fb_f='1000GP_CHR22_pre_'+tempRace+'.hap'        
    #fa_f=sys.argv[1]    #legned argument input
    #fb_f=sys.argv[2]    #hap argument input
    #fc_f=sys.argv[3]    #race argument input
    
    fa=open(fa_f, 'r')    #legend input
    fb=open(fb_f, 'r')    #hap input
    
    outa_f="1000GP_CHR22_"+tempRace+".legend"    #Set the ouput legned file name
    oa=open(outa_f, 'w')
    
    outb_f="1000GP_CHR22_"+tempRace+"_filter_snp.haplotypes"    #set the output hap file name
    ob=open(outb_f, 'w')
    
    #Set the column number for extrating the haplotype MAF
    if population=="AFR":
        population=5
        print 'the col for AFR is 5'
    elif population=="AMR":
        population=6
        print 'AMr is 6'
    elif population=="EAS":
        population=7
        print 'the col for EAS is 7'
    elif population=="EUR":
        population=8
        print 'EUR is 8'
    elif population=="SAS":
        population=9
        print 'SAS is 9'
    else:
        print 'Program stop...'
        print 'Please type one of the races, such as AFR,AMR,EAS,EUR,SAS'
        
    
    lines=fa.readlines()
    lines_b=fb.readlines()
    
    cn=-1
    
    for line in lines:
        cn=cn+1
        if cn==0:
            oa.write(line)
            continue
    
        data=line.strip().split(" ")
        if data[4]<> "Biallelic_SNP" or float(data[population])==0:
            continue
    
        oa.write(line)
        ob.write(lines_b[cn-1])
    
    oa.close()
    ob.close()
    fa.close()
    fb.close()
    
    
    
    
        