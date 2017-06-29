# Load and clean up the mental health 2014 survey data

clean_gender <- function(genders) {
  # Unclear how to account for other genders
  genders <- gsub("^male?$|^m$|^man$|^maile$", "Male", 
                  genders, ignore.case = TRUE)
  genders <- gsub("^female$|^f$|^woman$|^femaile$", "Female", 
                  genders, ignore.case = TRUE)
  
  # Handle others for now with logicals
  # Other genders, including trans, cis, cute remarks, and misspellings
  # Maybe pre-process this in python or ruby?
  # Maybe put this in a separate function?
  # genders <- gsub("(?!^Male$|^Female$)", 
  #                 "Other", genders, ignore.case = TRUE, perl = TRUE)
  genders <- as.factor(genders)
}

clean_ages <- function(ages) {
  ages <-ifelse((ages < 18) | (ages > 100), NA, ages)
}

data_2014 <- read.csv("survey.csv")
data_2014$Gender <- clean_gender(data_2014$Gender)
data_2014$Age <- clean_ages(data_2014$Age)

# Cut out timestamp and comments for rule mining
data_2014_rm <- 
  data_2014[,!names(data_2014) %in% c("Age", "Timestamp", "comments")]
