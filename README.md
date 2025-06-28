# n8n & MeTube Docker Stack

This repository provides a `docker-compose` setup for running a self-hosted instance of n8n alongside MeTube. The configuration is designed for security and ease of use, with n8n handling its own SSL/TLS termination.

## Features

- **n8n**: Workflow automation tool running directly with HTTPS.
- **MeTube**: A web GUI for `yt-dlp` for downloading video/audio. It is configured to be accessible only from within the n8n container for security.
- **Shared Download Volume**: MeTube saves files to a volume that is also mounted in the n8n container, allowing workflows to easily access downloaded content.
- **YouTube Authentication**: MeTube is configured to use a `youtube-cookies.txt` file, allowing it to download private or members-only content.
- **Customizable n8n Image**: The included `Dockerfile` allows you to add custom Python packages to your n8n instance.

## Prerequisites

- Docker and Docker Compose
- A registered domain name pointing to your server's IP address.
- SSL certificate files (`fullchain.pem` and `privkey.pem`) for your domain.

## Setup Instructions

1.  **Clone the Repository**
    ```sh
    git clone <your-repo-url>
    cd n8n-metube
    ```

2.  **Configure Environment Variables**
    Rename the example environment file and edit it with your specific details.
    ```sh
    mv .env.example .env
    nano .env
    ```
    Update `N8N_HOST`, `WEBHOOK_URL`, and `TZ`.

3.  **Add SSL Certificates**
    Place your `fullchain.pem` and `privkey.pem` files inside the `cert/` directory. The `.gitkeep` file can be removed.

4.  **Add YouTube Cookies (Optional)**
    To download age-restricted or private content, export your YouTube cookies using a browser extension like Get cookies.txt LOCALLY and save the file as `youtube-cookies.txt` in the project root.

5.  **Build and Start the Services**
    ```sh
    docker-compose up --build -d
    ```

## Accessing the Services

*   **n8n**:
    Your n8n instance will be available at `https://<your-domain-from-.env>:8443`.

*   **MeTube**:
    For security, MeTube is **not** exposed to the internet or your host machine. It is only accessible from within the Docker network.

    To use it, you can trigger downloads from an n8n workflow by making an HTTP request to its internal address: `http://metube_service:8081`. Downloaded files will appear in the `/mnt/metube_downloads` directory inside the n8n container.

## Notes

- The `.gitignore` file is configured to prevent sensitive files (`.env`, `cert/`, `youtube-cookies.txt`) and data directories from being committed to Git.
- To add custom Python packages for n8n, add them to `requirements.txt` and rebuild the image (`docker-compose up --build -d`).

## License

MIT