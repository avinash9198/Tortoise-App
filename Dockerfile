# Stage 1: Build Flutter web app
FROM cirrusci/flutter:stable AS build

WORKDIR /app

# Copy everything
COPY . .

# Enable web support
RUN flutter config --enable-web

# Get dependencies
RUN flutter pub get

# Build release version for web
RUN flutter build web --release

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy Flutter build to nginx html folder
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
