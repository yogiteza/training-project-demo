Here is where you can put the patches you desire to apply. After putting the patches file here, to apply those patches you need to write the apply command inside the `projec_patch.sh` file. This file will be copied to `[root]` on the deployment process, so you need to write the path of the file patch from root position.
    Example:
    ```
    patch -p1 --forward < src/patches/sample.patch || true
    ```