# Postfix

A simple email smarthost.

## Usage

This is a very basic image meant to provide email relay services for pods in a Kubernetes cluster. You configure software in your pods to use this as a smarthost. This image then relays the email to whatever service you use for further processing.

Configuration is basic and is done using the  environment variables listed below and all are optional:

* `MAILNAME` - name of the relay host
* `MY_NETWORKS` - MYNETWORKS setting for Postfix [https://www.postfix.org/postconf.5.html#mynetworks](https://www.postfix.org/postconf.5.html#mynetworks). Specifies what networks to trust. If you do not expose this externally you are generally safe to set it to `0.0.0.0/0` to allow all pods in your cluster to access postfix. *While optional, you won't be able to relay email if you don't set this value.*
* `MY_DESTINATION` - mydestination setting in Postfix [https://www.postfix.org/postconf.5.html#mydestination](https://www.postfix.org/postconf.5.html#mydestination). Configures what domains the instance should deliver to itself. Basically /dev/null for those domains.
* `ROOT_ALIAS` - Set alias addresses for any email delivered to root@MY_DESTINATION
* `RELAY` - DNS of your target relay host or service. Like smtp-relay.gmail.com or smtp.mailgun.com. *While optional, you won't be able to relay email if you don't set this value.*
* `TLS` - Set this to "true" to enable TLS. You almost always want to do this.
* `SASL_AUTH` - Authentication information for connecting to the relay host. *While optional, you likely won't be able to relay email if you don't set this value.*

### Example

```
docker run --rm -ti --name postfix \
  -e MY_NETWORKS=0.0.0.0/0 \
  -e SASL_AUTH="usrename:password" \
  -e RELAY=smtp-relay.mailgun.org \
  -e TLS=true \
  ghcr.io/10up/postfix:latest
```

## Support Level

**Active:** 10up is actively working on this, and we expect to continue work for the foreseeable future including keeping tested up to the most recent version of WordPress.  Bug reports, feature requests, questions, and pull requests are welcome.

## Like what you see?

<p align="center">
<a href="http://10up.com/contact/"><img src="https://10up.com/uploads/2016/10/10up-Github-Banner.png" width="850"></a>
</p>

## Credits

This is forked from https://github.com/jessfraz/dockerfiles
