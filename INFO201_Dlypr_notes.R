library("dplyr")
library("nycflights13")
library("ggplot2")

?flights          # read the available documentation
dim(flights)      # check the number of rows/columns
colnames(flights) # inspect the column names
View(flights)     # look at the data frame in the RStudio Viewer

# Identify the airline (`carrier`) that has the highest number of
# delayed flights
has_most_delays <- flights %>%            # start with the flights
  group_by(carrier) %>%                   # group by airline (carrier)
  filter(dep_delay > 0) %>%               # find only the delays
  summarize(num_delay = n()) %>%          # count the observations
  filter(num_delay == max(num_delay)) %>% # find most delayed
  select(carrier)                         # select the airline

# Get name of the most delayed carrier
most_delayed_name <- has_most_delays %>%  # start with the previous answer
  left_join(airlines, by = "carrier") %>% # join on airline ID
  select(name)                            # select the airline name

print(most_delayed_name$name) # access the value from the tibble
# [1] "United Air Lines Inc."

# Calculate the average arrival delay (`arr_delay`) for each destination
# (`dest`)
most_early <- flights %>%
  group_by(dest) %>% # group by destination
  summarize(delay = mean(arr_delay)) # compute mean delay

# Identify the destination where flights, on average, arrive most early
most_early <- flights %>%
  group_by(dest) %>% # group by destination
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>% # compute mean delay
  filter(delay == min(delay, na.rm = TRUE)) %>% # filter for least delayed
  select(dest, delay) %>% # select the destination (and delay to store it)
  left_join(airports, by = c("dest" = "faa")) %>% # join on `airports` data
  select(dest, name, delay) # select output variables of interest

print(most_early)
# A tibble: 1 x 3
#  dest  name       delay
#  <chr> <chr>      <dbl>
#1 LEX   Blue Grass   -22

# Compute delay by month, adding month names for visual display
# Note, `month.name` is a variable built into R
delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>%
  select(delay) %>%
  mutate(month = month.name)

# Create a plot using the ggplot2 package (described in Chapter 17)
ggplot(data = delay_by_month) +
  geom_point(
    mapping = aes(x = delay, y = month),
    color = "blue",
    alpha = .4,
    size = 3
  ) +
  geom_vline(xintercept = 0, size = .25) +
  xlim(c(-20, 20)) +
  scale_y_discrete(limits = rev(month.name)) +
  labs(title = "Average Delay by Month", y = "", x = "Delay (minutes)")


