corr <- function(directory, threshold = 0) {

        files_full <- list.files( directory, full.names=TRUE )
        dir_length <- length(files_full)

        current_record <- data.frame()
        full_dat <- data.frame()


        for(i in 1:dir_length){
            current_record <- read.csv(files_full[i])
            clean <- current_record[complete.cases(current_record),]
            count <- length(clean$Date)

            if( count > threshold ){
                corr <- cor(clean$nitrate, clean$sulfate)
                full_dat <- rbind(full_dat, corr)
                }
          }

  full_dat
}

      # clean_data <- full_dat[complete.cases(full_dat),]
      #   nitrate <- clean_data$nitrate
      #   sulfate <- clean_data$sulfate
      #   final <- cor(sulfate, nitrate)
      #   print(final)

        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
