pollutantmean <- function(directory, pollutant, id = 1:332) {

    files_full <- list.files( directory, full.names=TRUE )
    to_load <- files_full[id]

    if(length(to_load) > 1){
        range <- seq(id)}else
        {range <- 1}

    dat <- data.frame()
    for(i in range){
        dat <- rbind(dat, read.csv(to_load[i]) )
      }

    final <- mean(dat[, pollutant], na.rm=TRUE)
    print(final)

}

