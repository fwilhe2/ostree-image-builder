# OSTree Image Builder

```
limactl create --name ostree-dev ostree-dev.yaml
limactl start ostree-dev
```

https://localhost:9090/composer

```
composer-cli blueprints list
composer-cli blueprints push blueprint.toml
composer-cli blueprints list


composer-cli compose start ostree-demo iot-commit
composer-cli compose start ostree-demo iot-container

composer-cli status show

sudo composer-cli compose types
```

Build a disk image:

```
composer-cli blueprints push blueprint.toml
composer-cli blueprints list

OSTREE_REF=main
repo_url=http://0.0.0.0:8000/
blueprint_name=ostree-demo

sudo composer-cli --json compose start-ostree --ref "$OSTREE_REF" "$blueprint_name" iot-commit

sudo composer-cli compose list
UUID=#.. id from the list ..

sudo composer-cli compose results $UUID

sudo tar xf $UUID.tar
sudo tar xf $UUID-commit.tar
cd repo
sudo python -m http.server

sudo composer-cli --json compose start-ostree --ref "$OSTREE_REF" --url "$repo_url" "$blueprint_name" iot-raw-image

sudo composer-cli compose list
UUID_RAW=#.. id from the list ..
sudo composer-cli compose results $UUID_RAW
```

## References

https://github.com/nerdalert/microshift-image-builder/

https://github.com/redhat-et/microshift-demos/tree/main/demos/ostree-demo

https://github.com/osbuild/cockpit-composer

https://access.redhat.com/documentation/de-de/red_hat_enterprise_linux/8/html/composing_a_customized_rhel_system_image/creating-system-images-with-composer-command-line-interface_composing-a-customized-rhel-system-image

https://docs.centos.org/en-US/centos/install-guide/Composer/

https://fedoramagazine.org/introduction-to-image-builder/