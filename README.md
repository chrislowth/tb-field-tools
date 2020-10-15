# Static Tools for Turbo Field Team

This provides a number of standard Linux tools that may be useful to the Turbonomic field team. They are build as stand-alone "static" binaries so there are no dependencies.

The current release includes:

- screen (allows an interactive shell session to survive SSH disconnects)
- nano (a simple text editor)

The makefiles for this distribution can be found on github at

## Installation.

1. Download the tar file "tbstatic.tgz" into the /tmp directory of your Turbonomic instance. You can get it from the url https://turbonomic-emea-cs-bucket.s3.eu-west-2.amazonaws.com/tbstatic/tbstatic.tgz .
2. Log in to your Turbonomic instance using SSH. For XL, you would normally log in as "turbo". For classic, you would normally use "root".
3. IMPORTANT: Make sure your working directory is the user's HOME directory before un-zipping the tarball. You can make this so by typing the command "`cd`"" with no arguments.
4. Un-zip the tarball using the command: `tar xvfz --no-same-owner /tmp/tbstatic.tgz`.

That's it - all done.

## Documentation

Man pages are available on line for these tools.

| Tool | Documentation page |
| ---- | ------------------ |
| screen | http://manpages.org/screen |
| nano | https://www.nano-editor.org/docs.php |


