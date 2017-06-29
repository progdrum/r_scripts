library(dplyr)
library(ggplot2)

data_2014 <- read.csv("survey.csv")
data_2014_rm <- 
  data_2014[,!names(data_2014) %in% c("Age", "Timestamp", "comments")]
questions_only <- data_2014_rm[,5:24]

# Get a collection of tables for the responses
response_tables <- 
  lapply(questions_only, function(Response) as.data.frame(table(Response)))

# Add names of questions for each for plotting purposes
plot_tables <- 
  lapply(seq_along(response_tables), 
         function(x) mutate(response_tables[[x]], name = names(response_tables)[x]))

all_questions <- bind_rows(plot_tables)

# Generate plots for different response types
binary <- 
  c("family_history", "treatment", "remote_work", "tech_company", "obs_consequence")
trinary <-
  c("benefits", "care_options", "wellness_program", "seek_help", "anonymity", 
    "mental_health_consequence", "phys_health_consequence", "coworkers", "supervisor", 
    "mental_health_interview", "phys_health_interview", "mental_vs_physical")

two_resp <- ggplot(data = all_questions[all_questions$name %in% binary,]) + 
  geom_bar(aes(x = name, y = Freq, fill = Response), 
           stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Dark2") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
three_resp <- ggplot(data = all_questions[all_questions$name %in% trinary,]) + 
  geom_bar(aes(x = name, y = Freq, fill = Response), 
           stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Dark2") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
four_resp <- ggplot(data = all_questions[all_questions$name == "work_interfere",]) + 
  geom_bar(aes(x = name, y = Freq, fill = Response), 
           stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Dark2")
five_resp <- ggplot(data = all_questions[all_questions$name == "leave",]) + 
  geom_bar(aes(x = name, y = Freq, fill = Response), 
           stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Dark2")
six_resp <- ggplot(data = all_questions[all_questions$name == "no_employees",]) + 
  geom_bar(aes(x = name, y = Freq, fill = Response), 
           stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Dark2")
