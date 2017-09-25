format_data_PPBstats.data_organo_napping = function(data, code, threshold){
  d = data
  
  mess = "In data, the following column are compulsory : \"sample\", \"juges\", \"X\", \"Y\", \"descriptors\"."
  if(!is.element("sample", colnames(data))) { stop(mess) }
  if(!is.element("juges", colnames(data))) { stop(mess) }
  if(!is.element("X", colnames(data))) { stop(mess) }
  if(!is.element("Y", colnames(data))) { stop(mess) }
  if(!is.element("descriptors", colnames(data))) { stop(mess) }
  
  mess = "In code, the following column are compulsory : \"germplasm\", \"location\", \"code\"."
  if(!is.element("germplasm", colnames(code))) { stop(mess) }
  if(!is.element("location", colnames(code))) { stop(mess) }
  if(!is.element("code", colnames(code))) { stop(mess) }
  
  colnames(code)[3] = "sample"
  
  N = format_organo(data, code, threshold)
  N = N[,c(6, 1, 2, 3, c(7:ncol(N)))]
  
  # Get table with, for each judge, the X and Y for each sample tasted ----------
  juges = levels(N$juges)
  f = nlevels(N$sample)
  d_juges = as.data.frame(levels(N$sample))
  colnames(d_juges) = "sample"
  nb = c(1:length(juges)); names(nb) = juges
  juges_to_delete = NULL
  
  for (i in juges){
    dtmp = droplevels(subset(N, juges == i))
    sample = dtmp$sample
    if(length(sample) < length(d_juges$sample)) {
      warning("juges ", i, " is not taken into account because he did not taste all the samples.")
      juges_to_delete = c(juges_to_delete, i)
    } else {
      Xi = dtmp$X
      Yi = dtmp$Y
      d_juges_tmp = cbind.data.frame(sample, Xi, Yi)
      colnames(d_juges_tmp) = c("sample", 
                                paste("X", nb[i], "-juge-", i, sep = ""), 
                                paste("Y", nb[i], "-juge-", i, sep = "")
      )
      d_juges = join(d_juges, d_juges_tmp, by = "sample")
    }
  }
  
  # 3.1. update juges for MFA after
  if( !is.null(juges_to_delete) ) { juges = juges[!is.element(juges, juges_to_delete)] }
  
  # 3.2. Add to d_juges the number of time the adjective was cited
  adj = colnames(N)[5:ncol(N)]
  b = as.data.frame(matrix(0, ncol = length(adj), nrow = nrow(d_juges)))
  colnames(b) = adj
  
  d_juges = cbind.data.frame(d_juges, b)
  
  sample = as.character(d_juges$sample)
  
  for (ech in sample){
    dtmp = droplevels(subset(N, sample == ech))
    for (ad in adj){
      d_juges[which(d_juges$sample == ech), ad] = sum(dtmp[,ad])
    }
  }
  
  select <- is.na (d_juges) # on vire les NA: pourquoi? Pourquoi ne pas mettre 0 ou la moyenne ?
  aeliminer <- apply(select, MARGIN = 1, FUN = any)
  d_MFA <- d_juges[!aeliminer, ]
  row.names(d_MFA) <- d_MFA[, 1]
  d = d_MFA[,2:ncol(d_MFA)]
  
  class(d) <- c("PPBstats", "data.frame", "data_organo_napping")
  message(substitute(data), " has been formated for PPBstats functions.")
  return(d)
}