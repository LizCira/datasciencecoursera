best <- function(state, outcome) {

        full_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        if(!state %in% full_data$State){ stop("invalid state") }

        state_data <- full_data[full_data$State == state,]

        orderdata <- data.frame()

        if(outcome == "heart attack"){
           orderdata <- state_data[order(state_data[11]),]
           answer <- head(orderdata, 1)
           print(as.character(answer[2]))
          }else if(outcome == "heart failure"){
           orderdata <- state_data[order(state_data[17]),]
           answer <- head(orderdata, 1)
           print(as.character(answer[2]))
          }else if(outcome == "pneumonia"){
           orderdata <- state_data[order(state_data[23]),]
           answer <- head(orderdata, 1)
           print(as.character(answer[2]))
          }else{ stop("Invalid outcome entered")}
}



