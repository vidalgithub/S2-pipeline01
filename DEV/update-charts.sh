#! /bin/bash 
TAG=`git rev-parse --short=5 HEAD`
rm -rf S2-pipeline-charts || true 
git clone git@github.com:devopseasylearning/S2-pipeline-charts.git
cat <<EOF > S2-pipeline-charts/values-dev.yaml
image:
  repository: devopseasylearning2021/canary-dev
  tag: "$TAG"
EOF

cd S2-pipeline-charts
echo  '[url "git@github.com:"]' >> ~/.gitconfig 
 echo 'insteadOf = https://github.com/' >> ~/.gitconfig 
 git config --global user.email "info@devopseasylearning.com"
  git config --global user.name "devopseasylearning"
git tag -a $TAG -m "Tag generated from jenkins"
git tag
git push origin $TAG