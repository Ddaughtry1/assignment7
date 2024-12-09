FROM ubuntu:20.04

# Install required tools
RUN apt-get update && apt-get install -y \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create /structure directory and files with specified permissions
RUN mkdir -p /structure && chmod 777 /structure
RUN useradd -u 5000 collin
RUN touch /structure/sync-work && chown sync /structure/sync-work
RUN touch /structure/nobody-work && chown nobody /structure/nobody-work

# Set default command
CMD ["sh", "-c", "while true; do echo users; done"]
