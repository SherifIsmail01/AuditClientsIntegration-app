# 1. Use the official Ruby runtime matching your Gemfile
FROM ruby:3.3.0

# 2. Install essential system dependencies (PostgreSQL client, Node.js, Yarn)
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# 3. Create a non-root user (Required by Hugging Face)
RUN useradd -m -u 1000 user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true
    
    
# 4. Set the working directory inside the container
WORKDIR /rails

# 5. Copy dependency files first to leverage Docker layer caching
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local deployment 'true' \
    && bundle config set --local without 'development test' \
    && bundle install


# 6. Copy application code and fix permissions for the non-root user
COPY --chown=user:user . .


# 7. Switch to the non-root user
USER user


# 8. Precompile Assets (Fake the master key during build if not present)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# 9. Expose the standard Rails server port
EXPOSE 7860

# 10. Start the main process, binding to 0.0.0.0 so it is accessible outside the container
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "7860"]
