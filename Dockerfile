# Use an official Nginx runtime as a base image
FROM nginx:alpine

# Copy custom HTML file to the container
COPY app/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
