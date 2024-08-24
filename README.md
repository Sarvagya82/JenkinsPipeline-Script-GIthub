# JenkinsPipeline-Script-GIthub
To integrate this pipeline into your Jenkins setup, copy the provided Jenkinsfile into your repository. The pipeline is designed to work with Jenkins-github pipeline and requires no additional scripts or manual process management.
This repository contains a Jenkins pipeline script designed to automate the deployment of a Node.js application. The pipeline script handles the entire lifecycle of the application, including:

Cloning the Repository: The pipeline begins by cloning the specified branch from the GitHub repository.

Installing Dependencies: After cloning, the pipeline installs all necessary Node.js dependencies using npm install.

Starting the Application: The pipeline starts the Node.js application using the npm start command. The application is launched as a background process to ensure the pipeline continues to execute.

Waiting Period: Once the application is started, the pipeline waits for a specified duration (40 seconds by default). This delay allows time for the application to initialize and run before it's terminated.

Terminating the Application: After the waiting period, the pipeline stops the Node.js application by terminating its process. This is done using the process ID (PID) captured when the application was started.

Post-Execution Cleanup: Regardless of the pipeline's success or failure, it performs a cleanup of the workspace to maintain a clean environment for subsequent builds.

Key Features:
Process Management: The pipeline effectively manages the Node.js process by running it in the background and ensuring it is terminated after a set period.

Automated Lifecycle: The entire deployment lifecycle—from installation to application termination—is fully automated, reducing the need for manual intervention.

Customizable Timing: The wait time before terminating the application can be adjusted according to your needs by modifying the sleep duration.
