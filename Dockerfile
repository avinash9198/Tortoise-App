FROM ghcr.io/cirruslabs/flutter:stable

# Create a non-root user
RUN useradd -ms /bin/bash flutteruser

# Give this user ownership of the Flutter SDK
RUN chown -R flutteruser:flutteruser /sdks/flutter

# Switch to the new user
USER flutteruser

WORKDIR /app
COPY --chown=flutteruser:flutteruser . .

# Allow git safe directory
RUN git config --global --add safe.directory /sdks/flutter

# Get dependencies
RUN flutter pub get

# Build web
RUN flutter build web