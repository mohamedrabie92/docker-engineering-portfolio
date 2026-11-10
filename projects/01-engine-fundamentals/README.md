# 01 — Docker Engine Fundamentals

Practice lifecycle, image management, log diagnosis and port binding. Execute commands yourself and save the **real** output in `evidence/`.

```bash
docker version
docker info
docker run --rm hello-world
docker run -d --name docker-portfolio-nginx -p 127.0.0.1:8081:80 nginx:1.27-alpine
docker ps
docker logs docker-portfolio-nginx
docker inspect docker-portfolio-nginx
docker image history nginx:1.27-alpine
docker stats --no-stream docker-portfolio-nginx
curl http://127.0.0.1:8081
docker rm -f docker-portfolio-nginx
```

**Challenge:** deliberately run another container on occupied port 8081, capture the error, explain why port publishing fails and fix it. Try a wrong `CMD` and diagnose the stopped container using `docker logs` and `docker inspect`.

**Safety:** do not run `docker system prune -a --volumes` on a shared computer.
