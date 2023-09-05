# Use a Debian-based image as the base
FROM debian:bullseye-slim

# Install required packages (cAdvisor dependencies)
RUN apt-get update && apt-get install -y curl

# Download and install cAdvisor binary
RUN curl -LO https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor && \
    chmod +x cadvisor && \
    mv cadvisor /usr/local/bin/

# Expose the port used by cAdvisor (default is 8080)
EXPOSE 8080

# Set the entry point to start cAdvisor
CMD ["cadvisor"]
