library(readr)
library(stringr)
library(ggplot2)
library(dplyr)

ozone_data <- read_tsv("Ozone_hole_area_data.txt", col_names = TRUE)

ozone_data <- str_split_fixed(ozone_data$`Year      Data   Minimum   Maximum`, "\ +", 4)

ozone_data <- as.data.frame(apply(ozone_data, 2, as.numeric))

colnames(ozone_data) <- c("Year", "Data", "Minimum", "Maximum")

# ggplot(data = ozone_data) +
#   geom_line(aes(x = Year, y = Data), color = "green") +
#   geom_vline(xintercept = 1989, linetype = "dashed")
# 
# ggplot(data = ozone_data) +
#   geom_line(aes(x = Year, y = Minimum), color = "green") +
#   geom_vline(xintercept = 1989, linetype = "dashed")
# 
# ggplot(data = ozone_data) +
#   geom_line(aes(x = Year, y = Maximum), color = "green") +
#   geom_vline(xintercept = 1989, linetype = "dashed") +
#   ylim(0,max(ozone_data$Maximum))
# 
ggplot(data = ozone_data) +
  geom_line(aes(x = Year, y = Maximum), color = "red") +
  geom_vline(xintercept = 1989, linetype = "dashed") +
  ylim(0,max(ozone_data$Maximum)) +
  geom_line(aes(x = Year, y = Minimum), color = "green") +
  geom_line(aes(x = Year, y = Data), color = "black")
# 
# ggplot(data = ozone_data) +
#   geom_line(aes(x = Year, y = (Maximum + Minimum)/2), color = "green") +
#   geom_line(aes(x = Year, y = Data), color = "red") +
#   geom_vline(xintercept = 1989, linetype = "dashed")

ggplot(data = ozone_data, aes(x = Year, y = Minimum)) +
  geom_line( color = "red") +
  geom_vline(xintercept = 1989, linetype = "dashed") +
  geom_smooth(data = temp, method = "lm", color = "black") +
  labs(title = "Maximum area of the ozone hole in years 1979 – 2020") +
  ylab(expression(paste("Maximum ozone layer area in  ", "km"^"2", " * 10"^"6")))
