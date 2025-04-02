## Backend Issue
- The chatbot session not found issue was due to the command
```bash
sudo nohup .venv/bin/python3 -m uvicorn main:app --host 0.0.0.0 --port 5400 --workers 2 >> ~/app_output.log 2>&1 &
```
- #### Issues
	- nohup command does not activate the complete venv required by the application to function. It just refers to the python3 bin present.
	- The uvicorn command spawns 2 workers with the --workers 2 flag. But the 2 workers are unaware of context of each other.
		- If start-chat api calls is received by the worker 1 , worker 2 has no idea about the chat created and vice-versa.
		- If worker 2 recieved the continue-chat api call. It'll throw an Session Not Found error which was the issue all along , because it has no context of the chat created by the worker

## FastApi Backend Deployment
- In the project directory which is to be deployed
	- Create a start.sh bash file with contents 
```bash
#!/bin/bash

PROJECT_DIR="<directory to the project>"
VENV_DIR="$PROJECT_DIR/.venv"
PORT=5400

cd "$PROJECT_DIR" || exit

echo "starting the server..."
echo "PORT is $PORT"

source "$VENV_DIR/bin/activate"

uvicorn main:app --host 0.0.0.0 --port $PORT

deactivate
```

- Change the PROJECT_DIR to the appropiate directory of the project.
- Remember to create a .venv inside the project directory which has all the dependencies the project needs.
- make the file executable using 

```bash
chmod +x start.sh
```

#### Creating systemd unit file.
- This file will be used to start the server in the background and restart on reboot.
- Change the working directory to /etc/systemd/system
- Create a file called auxo_daa_backend.service with contents 
```
[Unit]
Description=Chatbot Backend Auxo_DAA
After=network.target

[Service]
User=ubuntu
ExecStart=/home/ubuntu/Auxo_DAA_Backend/start.sh
WorkingDirectory=/home/ubuntu/Auxo_DAA_Backend
Restart=always

[Install]
WantedBy=default.target
```
- This file executes the start.sh created earlier.

##### Starting The Server
- Run this to start the server in the background
```bash
sudo systemctl start auxo_daa_backend.service
```

##### Auto-Starting The Server On Reboot
- Run this to enable auto-start the server on reboot 
```bash
sudo systemctl enable auxo_daa_backend.service 
```

##### Stop The Server
```bash
sudo systemctl stop auxo_daa_backend.service 
```

##### Disable The Server
```bash
sudo systemctl disable auxo_daa_backend.service
```













