# Configure the Heroku provider
provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

# Create Heroku apps for development, staging and production
resource "heroku_app" "development" {
  name = "wsf-devops-development"
  region = "eu"
  buildpacks = [
    "heroku/go"
  ]
}

resource "heroku_addon" "development" {
  app  = "${heroku_app.development.name}"
  plan = "heroku-postgresql:hobby-dev"
}


resource "heroku_app" "staging" {
  name = "wsf-devops-staging"
  region = "eu"
  buildpacks = [
    "heroku/go"
  ]
}

resource "heroku_addon" "staging" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_app" "production" {
  name = "wsf-devops-production"
  region = "eu"
  buildpacks = [
    "heroku/go"
  ]
}

# Create a Heroku pipeline
resource "heroku_pipeline" "app" {
  name = "app"
}

# Couple apps to different pipeline stages
resource "heroku_pipeline_coupling" "development" {
  app      = "${heroku_app.development.name}"
  pipeline = "${heroku_pipeline.app.id}"
  stage    = "development"
}
resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.app.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.app.id}"
  stage    = "production"
}


variable "heroku_email" {
  type = "string"
}
variable "heroku_api_key" {
  type = "string"
}
