[Ubuntu Virtualmin](https://hub.docker.com/r/oytunistrator/ubuntu-virtualmin)
----

In recent years, Docker has emerged as a leading platform for containerization, providing developers and system administrators with a powerful tool for packaging, distributing, and running applications. Docker Hub, a cloud-based repository for Docker images, offers a vast array of pre-built images for various software stacks, including Ubuntu and Virtualmin. Utilizing Docker Hub to deploy Virtualmin on Ubuntu provides a streamlined and efficient way to set up a web hosting control panel. Here's a guide to deploying Virtualmin on Ubuntu using Docker Hub:

### Prerequisites:
1. Docker installed on your system.
2. Basic understanding of Docker concepts.

### Step 1: Pull the Virtualmin Image from Docker Hub
Open your terminal and pull the Virtualmin image from Docker Hub using the following command:
```bash
docker pull oytunistrator/ubuntu-virtualmin
```

### Step 2: Run the Virtualmin Container
Once the image is downloaded, you can run a Virtualmin container with the desired configurations. For example:
```bash
docker run -dit --privileged --restart unless-stopped -h [hostname] --name=my-virtualmin-container --dns=127.0.0.1 --dns=[gateway ip/external DNS] -p 20:20 -p 21:21 -p 2222:22 -p 25:25 -p 53:53 -p 53:53/udp -p 80:80 -p 110:110 -p 111:111 -p 143:143 -p 443:443 -p 587:587 -p 993:993 -p 995:995 -p 3306:3306 -p 10000:10000 -p 20000:20000 -p 38532:38532 -p 40259:40259 oytunistrator/ubuntu-virtualmin
```
This command launches a Virtualmin container in detached mode, mapping port 10000 on the host to port 10000 within the container. Adjust the port mappings and container name according to your requirements.

### Step 3: Access Virtualmin Web Interface
After the container is running, you can access the Virtualmin web interface by navigating to `https://localhost:10000` in your web browser. If you're running Docker on a remote server, replace `localhost` with the server's IP address.

### Step 4: Initial Configuration
Upon accessing the Virtualmin web interface for the first time, you'll be prompted to complete the initial configuration, including setting up the hostname, network settings, and administrative credentials.

### Step 5: Configure Virtualmin Features
Once the initial setup is complete, you can configure Virtualmin to your specific requirements, such as adding domains, setting up email accounts, managing databases, and installing additional software packages.

### Step 6: Persist Data (Optional)
To ensure data persistence across container restarts or updates, consider mounting volumes for essential data directories, such as `/home` and `/etc/webmin`.

### Step 7: Manage the Virtualmin Container
You can manage the Virtualmin container using Docker commands, such as starting, stopping, or removing the container:
```bash
docker start my-virtualmin-container
docker stop my-virtualmin-container
docker rm my-virtualmin-container
```

### Step 8: Explore Docker Hub for Additional Images
Docker Hub offers a wealth of community-contributed Docker images for various applications and services. Explore Docker Hub to find additional images and enhance your Docker-based workflow.

By leveraging Docker Hub to deploy Virtualmin on Ubuntu, you can streamline the process of setting up a web hosting control panel while benefiting from the flexibility and scalability of containerization technology.
