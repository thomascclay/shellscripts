update_aws_sdk() {
  pkgs=$(jq -r '.dependencies | keys[] | select(startswith("@aws-sdk/"))' package.json | tr '\n' ' ')
  if [ -n "$pkgs" ]; then
    echo "updating $pkgs"
    yarn add $pkgs
  else
    echo "No @aws-sdk packages found."
  fi
}

update_all_deps() {
  deps=$(jq -r '[.dependencies, .devDependencies] | add | keys[]' package.json | tr '\n' ' ')
  if [ -n "$deps" ]; then
    echo "updating $deps"
    yarn add $deps
  else
    echo "No dependencies found."
  fi
}

update_root_deps() {
  deps=$(jq -r '[.dependencies, .devDependencies] | add | keys[]' package.json | tr '\n' ' ')
  if [ -n "$deps" ]; then
    echo "updating $deps"
    yarn add --workspace-root $deps
  else
    echo "No dependencies found."
  fi
}
