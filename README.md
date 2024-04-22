# Personal Portfolio Website in React

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

<img width="1266" alt="Screen Shot 2022-06-19 at 2 18 18 PM" src="https://user-images.githubusercontent.com/50160672/174933373-1ba6cadf-1c9a-48c3-aa58-984d0bd62d82.png">

Built using:

- Front-end library: React
- CSS framework: React-bootstrap
- CSS animations library: Animate.css

In the /personal-portfolio, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.


Certainly! Let's break down the steps to set up Jenkins and Docker on an EC2 instance. I'll provide a concise guide for each task:

1. **Launch an EC2 Instance (t2.xlarge)**:
   - Log in to your AWS console.
   - Navigate to EC2.
   - Click "Launch Instance."
   - Choose the "t2.xlarge" instance type.
   - Configure other settings (VPC, security groups, key pair, etc.).
   - Launch the instance.

2. **Install Jenkins and Docker**:
   - SSH into your EC2 instance.
   - Update the package list: `sudo apt update`.
   - Install Jenkins: 
     ```bash
     sudo apt install openjdk-11-jdk
     wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
     sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
     sudo apt update
     sudo apt install jenkins
     ```
   - Install Docker:
     ```bash
     sudo apt install docker.io
     sudo systemctl start docker
     sudo systemctl enable docker
     ```

3. **Access Jenkins**:
   - Open a web browser and navigate to `http://<your-ec2-public-ip>:8080`.
   - Retrieve the initial admin password from the Jenkins server:
     ```bash
     sudo cat /var/lib/jenkins/secrets/initialAdminPassword
     ```

4. **Install Required Plugins**:
   - In Jenkins, go to "Manage Jenkins" > "Manage Plugins."
   - Install necessary plugins (e.g., Pipeline, GitHub, Docker).

5. **Create a Jenkins Pipeline**:
   - Create a new Jenkins job.
   - Select "Pipeline" as the job type.
   - Write your Groovy script in the pipeline configuration.

6. **GitHub Integration**:
   - Go to your GitHub repository.
   - Under "Settings," select "Developer settings."
   - Generate a classic token and copy it.

7. **Configure Jenkins with GitHub Credentials**:
   - In Jenkins, go to "Manage Jenkins" > "Configure System."
   - Add your GitHub username and paste the token as the password.

8. **DockerHub Integration**:
   - Go to DockerHub.
   - Generate an access token.

9. **Configure DockerHub in Jenkins**:
   - In Jenkins, go to "Manage Jenkins" > "Configure System."
   - Add your DockerHub username and paste the token.

10. **Access Docker Container**:
    - Run your Docker container (e.g., `docker run -p 3000:80 myapp`).
    - Access it via `http://<your-ec2-public-ip>:3000`.

Remember to replace `<your-ec2-public-ip>` with your actual EC2 instance's public IP address. Happy setting up! 🚀

Source: Conversation with Bing, 4/22/2024
(1) github.com. https://github.com/shyamkumarchauhan/jenkins-terraform/tree/73176022d4d0a56c37f59066bc4e008ed8ff7325/README.md.
(2) github.com. https://github.com/pastatopf/helferlein/tree/5d2ffa89d6231385fbf0a7d4066c2b4846d8e334/jenkins%2Fjenkins_install_ubuntu.sh.
(3) github.com. https://github.com/KasiaMichalowska/jenkins-testy/tree/2741f5892c9dac1fc24f6abe1c185d58aca95352/install_jenkins.sh.
