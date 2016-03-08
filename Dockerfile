FROM ruby
ADD . /usr/src/app
WORKDIR /usr/src/app
CMD ["bash"]
