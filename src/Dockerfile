# Using lightweight alpine image
FROM node:18-alpine

# Sets working directory
WORKDIR /app

# Create non-root user and group
RUN addgroup -S stsgroup && adduser -S stsuser -G stsgroup

# Copy and Install dependencies 
COPY package*.json ./
RUN npm install 

# Copy application files
COPY . .

# Change ownership to non-root user
RUN chown -R stsuser:stsgroup /app

# Expose the app port
EXPOSE 3000

# Run the app
CMD ["node", "index.js"]

