# 1. Use the official Ruby runtime matching your Gemfile
FROM ruby:3.3.0

# 2. Install essential system dependencies (PostgreSQL client, Node.js, Yarn)
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# 3. Set the working directory inside the container
WORKDIR /rails

# 4. Copy dependency files first to leverage Docker layer caching
COPY Gemfile Gemfile.lock ./

# 5. Install gems
RUN bundle install

# 6. Copy the rest of the application code
COPY . .

# 7. Expose the standard Rails server port
EXPOSE 3000

# 8. Start the main process, binding to 0.0.0.0 so it is accessible outside the container
CMD ["rails", "server", "-b", "0.0.0.0"]
