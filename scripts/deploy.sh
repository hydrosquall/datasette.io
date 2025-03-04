#!/bin/bash
set -euf -o pipefail

gcloud config set run/region us-central1
gcloud config set project datasette-222320
datasette publish cloudrun \
  content.db docs-index.db dogsheep-index.db blog.db tils.db \
  --branch main \
  --service datasette-io \
  --template-dir=templates \
  --metadata=metadata.yml \
  --plugins-dir=plugins \
  --static=static:static \
  --install=datasette-render-markdown \
  --install=datasette-template-sql \
  --install=python-dateutil \
  --install=datasette-vega \
  --install=datasette-atom \
  --install=datasette-graphql \
  --install=datasette-json-html \
  --install=datasette-debug-asgi \
  --install=html5lib \
  --install=beautifulsoup4 \
  --install 'dogsheep-beta>=0.10.1'
