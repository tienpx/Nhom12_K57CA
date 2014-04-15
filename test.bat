echo "install gem"
bundle install
echo "Rspec tests"
rspec spec
echo "Cucumber tests"
cucumber features
echo "lauch results"
start "coverage/index.html"