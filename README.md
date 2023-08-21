# How to Use
## Local or Dev site:
1. Install [Swift PWA](https://github.com/icubeus/swift-pwa)
2. Go to root Swift PWA folder, then clone project repository into src folder:
    ```
    git clone [git-url] src
    ```
4. Setup the configurations and neccessary files:
    - Setup configurations at swift.config.js -- such as HOST, GQL endpoint
    - Setup environment variables at .env (duplicate from env.example) --  configure any sensitive informations such as ACCESS_KEY (Magento admin token).
3. Deploy the project files into Swift PWA:
    ```
    bash deploy.sh
    ```
    This process will deploy (copy) some of the project files into the right SWIFT PWA folders to make it works. Please check [deploy.sh](https://github.com/icube-mage/swift-pwa-demo/blob/master/deploy.sh) to see what files that will be deployed. <br />
    ⚠️ <b>Note: You need to run this everytime you have change on those files. </b>
4. Run the Swift PWA 

    See [here](https://github.com/icubeus/swift-pwa#installation) if you are not sure how to run Swift PWA

## Staging or Production
1. Clone the project repository
2. Open Dockerfile
    - Put the project repo url in the [GIT_URL](https://github.com/icube-mage/swift-pwa-demo/blob/test_1/Dockerfile#L2) variable
3. Setup the configurations and neccessary files:
    - Setup configurations at swift.config.js -- such as HOST, GQL endpoint
    - Setup environment variables --  configure any sensitive informations such as ACCESS_KEY (Magento admin token). 🚨 But please note that .env file works only for local and dev site. To setup the environment variables on staging and production, please ask infra team!
4. Commit and push
5. Deploy with Jenkins

# Folders Structure
1. modules <br />
    This is the folder where you can either override the core module files (originally located in `[root]/core/modules`) or create your own modules
2. pages <br />
    This is the folder where you can either override the page files (originally located in `[root]/pages`) or create your own page files.
    
    :bulb: Files inside this folder will be copied to `[root]/pages` during deployment
3. patches<br />
    This is where you can put the patches you desire to apply. After putting the patches file here, to apply those patches you need to write the apply command inside the `projec_patch.sh` file. This file will be copied to `[root]` on the deployment process, so you need to write the path of the file patch from root position.
    Example:
    ```
    patch -p1 --forward < src/patches/sample.patch || true
    ```
4. public<br />
    This is the folder you can put any assets you desire to open publicly such as images.
    
    :bulb: Files inside this folder will be copied to `[root]/public` during deployment
5. styles<br />
    This is the folder you either override the styling assets (originally located in `[root]/styles`) or create / put any other asset files
