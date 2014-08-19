complete <- function(directory, id = 1:332) {

        files_full <- list.files( directory, full.names=TRUE )
        to_load <- files_full[id]

        if(length(to_load) > 1){
        range <- seq(id)}else
        {range <- 1}

        dat <- data.frame("id" = numeric(0), "nobs" = numeric(0))
        current_record <- data.frame()

        for(i in range){
                current_record <- read.csv(to_load[i])
                clean <- current_record[complete.cases(current_record),]
                current_id <- current_record[1, "ID"]
                num_records <- length(clean$Date)

                dat <- rbind(dat,c(current_id, num_records))
                names(dat) <- c("id", "nobs")
        }

        print(dat)
}

