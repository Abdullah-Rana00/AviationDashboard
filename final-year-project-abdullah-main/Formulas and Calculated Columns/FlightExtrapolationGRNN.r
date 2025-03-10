library(tsfgrnn)

# Load the data
data(airline)

# Plot the time series data
plot(airline)

# Split the time series data into training and testing sets
train_data <- window(airline_train, end=2021)
test_data <- window(airline_test, start=2010, end=2021)

# Train the GRNN model
grnn_model <- tsfgrnn(train_data)

# Predict the future values of the time series data with confidence intervals
grnn_forecast <- predict(grnn_model, n.ahead = length(test_data), 
                         interval = "prediction")

# Plot the forecast values along with the original time series data
plot(c(train_data, test_data), type="l", main="GRNN Forecast", 
     xlab="Year", ylab="Passengers")
lines(grnn_forecast$pred, col="red")
lines(grnn_forecast$lwr, col="blue", lty=2)
lines(grnn_forecast$upr, col="blue", lty=2)
