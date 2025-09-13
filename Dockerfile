# Use domjudge/domserver:latest as base image
FROM domjudge/domserver:latest

# Set the maintainer label
LABEL maintainer="Custom DOMjudge Server with CSS"
LABEL description="DOMjudge server with custom CSS styling and Geist fonts"

# Create the custom directory if it doesn't exist
RUN mkdir -p /opt/domjudge/domserver/webapp/public/css/custom

# Copy the custom CSS file
COPY custom/custom.css /opt/domjudge/domserver/webapp/public/css/custom/_custom.css

# Copy the Geist font files
COPY custom/Geist-VariableFont_wght.ttf /opt/domjudge/domserver/webapp/public/css/custom/Geist-VariableFont_wght.ttf
COPY custom/GeistMono-VariableFont_wght.ttf /opt/domjudge/domserver/webapp/public/css/custom/GeistMono-VariableFont_wght.ttf

# Set proper permissions for the copied files
RUN chown -R www-data:www-data /opt/domjudge/domserver/webapp/public/css/custom/

# Expose the same ports as the base image (usually 80 and 443)
EXPOSE 80 443

# Use the same CMD as the base image
CMD ["/scripts/start.sh"]