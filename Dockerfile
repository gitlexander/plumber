# Use an official R base image
FROM r-base:4.0.5

# Install necessary system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    usrmerge && \
    apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Plumber and other R packages
RUN R -e "install.packages(c('plumber', 'jsonlite'), repos='https://cran.rstudio.com/')"

# Copy your Plumber API and server script into the Docker image
COPY plumber.R /app/plumber.R
COPY server.R /app/server.R

# Set the working directory
WORKDIR /app

# Expose the port that the API will run on
EXPOSE 8000

# Command to run your server script
CMD ["Rscript", "server.R"]
