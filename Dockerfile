# Use an official R base image
FROM rocker/r.ver:3.5.2

# Install necessary system dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    pandoc \
    libssl-dev \
    libcurl4-gnutls-dev \
    libxml2-dev

# Install Plumber and other R packages
RUN R -e "install.packages(c('plumber', 'jsonlite'))"

# Copy your Plumber API and server script into the Docker image
COPY plumber.R /app/plumber.R
COPY server.R /app/server.R

# Set the working directory
WORKDIR /app

# Expose the port that the API will run on
EXPOSE 8000

ENTRYPOINT ["R", "-e", "library(plumber); plumb('plumber.R')$run(port=8000, host='0.0.0.0')"]
