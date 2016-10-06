# Adding Papertrail to Cloud66

1. Put the [.cloud66](.cloud66) directory into the root of your project
2. Update the variables in [papertrail.sh](.cloud66/papertrail.sh#L4-L5) to match your Papertrail configuration (as shown on [Log Destinations](https://papertrailapp.com/account/destinations)).
3. Add/modify any logs you would like to track [in papertrail.sh](.cloud66/papertrail.sh#L7-L8)
4. Update the `initd_url` [line in papertrail.sh](.cloud66/papertrail.sh#L10) to [the most recent version](https://github.com/papertrail/remote_syslog2/releases).
5. Deploy

If you're deploying a new stack, you're done.

### Installation on existing stacks

Because the `deploy_hook` is only triggered on initial build, you'll have to run the commands from [deploy_hooks.yml](.cloud66/deploy_hooks.yml) manually.

After deploying with the `.cloud66` folder, ssh into your machines and run these commands:

```bash
sudo mv "$RAILS_STACK_PATH/.cloud66/papertrail.sh" /tmp/papertrail.sh
sudo bash /tmp/papertrail.sh $STACK_BASE
```

=====

*More information available on [papertrail support](http://help.papertrailapp.com/kb/hosting-services/cloud-66/)*
