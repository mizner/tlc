FROM nikolaik/python-nodejs:python3.13-nodejs23-slim

WORKDIR /app

# Fix apt issues and install necessary dependencies
RUN apt-get clean && apt-get update --fix-missing

# Install yt-dlp via pip (latest stable release)
RUN python3 -m pip install --no-cache-dir -U "yt-dlp[default]"

# Install ffmpeg
RUN pip install ffmpeg

# Install yt-dlp via pip
RUN pip install --no-cache-dir yt-dlp

# Install jq
RUN apt-get install -y jq

# Ensure all files in ./scripts are executable
# RUN chmod +x ./scripts/*

# Install additional Python dependencies (modify requirements.txt as needed)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files (ensure only necessary files are included)
COPY . .

# Install Node.js dependencies
RUN if [ -f package.json ]; then npm install; fi

# Expose the correct port for Fly.io (default 8080)
EXPOSE 8080


# Start the Node.js server
CMD ["node", "server.js"]
