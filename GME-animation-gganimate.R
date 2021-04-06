library(ggplot2)
library(gganimate)
library(quantmod)
library(gifski)

loadSymbols("GME")

GME <- as.data.frame(GME)
GME$dates <- row.names(GME)
GME$dates <- as.Date(GME$dates, format = c("%Y-%m-%d"))
str(GME$dates)

head(GME)
plot(GME$GME.Adjusted, type = "l")

GMEindex <- c(3500:3588)
GMEindex <- c(1:3588)


# Visualization

ggplot(GME[GMEindex,], aes(x=dates, y=GME.Adjusted)) +
  geom_line(aes(group=1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=10)) +
  theme(legend.position = "none") +
  geom_point() +
  labs(title = 'GameStop Stock Prices and Trade Volume on: {frame_along}', 
       x = "Date",
       y = "Stock Price in USD") +
  transition_reveal(dates, keep_last = T) +
  ease_aes('linear')



anim_save('gmeRecentGif.gif')







