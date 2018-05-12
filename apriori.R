library(arules)
z<-read.csv("/home/jennifer/Escritorio/TablaBinaria/tabla_binaria.csv")
names(z)
z_categoricas <- z[c("gen", "cromosoma_chr1", "cromosoma_chr2", "cromosoma_chr3", "cromosoma_chr4", "cromosoma_chr5", "cromosoma_chr6", "cromosoma_chr7", "cromosoma_chr8", "cromosoma_chr9", "cromosoma_chr10", "cromosoma_chr11", "cromosoma_chr12", "cromosoma_chr13", "cromosoma_chr14", "cromosoma_chr15", "cromosoma_chr16", "cromosoma_chr17", "cromosoma_chr18", "cromosoma_chr19", "cromosoma_chr20", "cromosoma_chr21", "cromosoma_chr22", "cromosoma_chrX", "cromosoma_chrY", "funcion_gen_ref_exonic", "funcion_gen_ref_exonic.splicing", "tipo_variante_nonsynonymous.SNV", "tipo_variante_synonymous.SNV", "tipo_variante_unknown", "tipo_variante_stopgain", "tipo_variante_stoploss", "tipo_variante_nonframeshift.insertion", "tipo_variante_nonframeshift.deletion", "tipo_variante_frameshift.insertion", "tipo_variante_frameshift.deletion")]
lapply(z_categoricas, as.factor) -> ppp
rules <- apriori(ppp,parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
inspect(rules)
inspect(head(rules, by = "lift"))

z<-read.csv("/home/jennifer/Escritorio/TablaBinaria/genes.csv")
names(z)
z_categoricas <- z[c("gen","tipo_variante")]
lapply(z_categoricas, as.factor) -> ppp
rules <- apriori(ppp,parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
inspect(rules)
inspect(head(rules, by = "lift"))
