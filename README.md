# SimpleTimeService

A minimal Node.js microservice that returns the current timestamp and the IP address of the client.

---

## 📦 JSON Response

When you hit the root path (`/`), you'll get a JSON response like:

```json
{
  "timestamp": "2025-04-15T12:00:00.000Z",
  "ip": "123.456.789.000"
}
 ```
 
 Getting Started
 
Prerequisites
Node.js (v16 or later recommended)
npm (comes with Node.js)
or
Docker


🛠️ Run Without Docker

Clone the repository

 -  `git clone https://github.com/ajykee/SimpleTimeService.git`
 -  `cd simple-time-service `

Install dependencies

-  `npm install`

Start the server

-  `node index.js`

Access the service

Open your browser or use curl:
-  `curl http://localhost:3000`

Run With Docker

Build the Docker Image
-  `docker build -t simple-time-service .`
  
Run the Container
-  `docker run -p 3000:3000 simple-time-service`
Access it at http://localhost:3000

Security
This service runs as a non-root user inside the container for better security.

