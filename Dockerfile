FROM ubuntu:24.04
RUN apt-get update && apt-get install -y motion && rm -rf /var/lib/apt/lists/*
CMD ["motion"]

To Build:
docker build -t meu-motion-custom .

To Run:
docker run -d --name motion -v /caminho/conf:/etc/motion --net=host meu-motion-custom
