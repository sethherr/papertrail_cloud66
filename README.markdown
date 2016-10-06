# Adding Papertrail to Cloud66

1. Update the variables in [papertrail.sh](.cloud66/papertrail.sh#L2-L8) to match your Papertrail configuration (as shown on [Log Destinations](https://papertrailapp.com/account/destinations)).
2. Update the initd url in [papertrail.sh](.cloud66/papertrail.sh#L9) to [the most recent version](https://github.com/papertrail/remote_syslog/releases).
3. Put the [.cloud66](.cloud66) directory into the root of your project and deploy

If you're building in a new stack, you're done.

### Installation on existing stacks

Because the deploy_hook is only triggered on initial building, you'll have to run the commands from [deploy_hooks.yml](.cloud66/deploy_hooks.yml) manually.

After deploying the `.cloud66` folder, ssh into your machines and run these commands:

```bash
sudo mv $RAILS_STACK_PATH/.cloud66/papertrail.sh /tmp/papertrail.sh
sudo bash /tmp/papertrail.sh
```

=====

*More information available on [papertrail support](http://help.papertrailapp.com/kb/hosting-services/cloud-66/)*
