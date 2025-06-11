# n8n-server Dockerized Stack

This repository contains a Docker Compose setup for running [n8n](https://n8n.io/), [nginx](https://nginx.org/), and [MeTube](https://github.com/alexta69/metube) with SSL support and shared volumes.

## Features

- **n8n**: Workflow automation tool, running with HTTPS and secure cookies.
- **nginx**: Acts as a reverse proxy with SSL termination using provided certificates.
- **MeTube**: Self-hosted YouTube downloader, sharing downloads with n8n via a Docker volume.
- **Shared Volumes**: For easy file exchange between services.
- **Custom Python Scripts**: Place your scripts in `n8n-data/codes`.

## Folder Structure

```
.
├── certs/                # SSL certificates (do not commit private keys)
├── codes/                # Custom Python scripts
├── n8n-data/             # n8n persistent data (should not be committed)
├── nginx.conf            # nginx configuration
├── requirements.txt      # Python dependencies for custom scripts
├── Dockerfile            # Installs Python and dependencies for n8n
├── docker-compose.yml    # Main Docker Compose file
```

## Usage

1. **Clone the repository**
2. **Add your SSL certificates** to the `certs/` directory (`fullchain.pem` and `privkey.pem`).
3. **Build and start the stack**:
   ```sh
   docker-compose up --build -d
   ```
4. **Access n8n** at `https://perism.ir:2083/`
5. **Access MeTube** at `http://localhost:8081/` (local only)

## Notes

- Do **not** commit your SSL private keys or n8n data to public repositories.
- Python scripts and requirements are managed via the `codes/` folder and `requirements.txt`.

## License

MIT