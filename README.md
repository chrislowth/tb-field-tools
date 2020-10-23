# Linux Tools for the Turbonomic Field Team

This project aims to provide a number of standard Linux add-on tools that may be useful to the Turbonomic field team in an "easy-to-install" format with no dependencies.

The tools are provided with NO SUPPORT WHAT SO EVER and are unmodified versions of the tools available via their own websites. The licenses are those that apply to the tools themselves. The build files (Makefiles, Dockerfiles etc) in this repository are licenced under the GNU General Public License v3.0

The current release includes:

- `screen` (allows an interactive shell session to survive SSH disconnects)
- `nano` (a simple text editor - much easier to use than `vi`)
- `k9s` (a text UI alternative to many of kubectl's features)
- `yq` (a lightweight and portable command-line YAML processor)

The makefiles for this distribution can be found on github at https://github.com/chrislowth/tb-field-tools .

## Installation.

1. Download the tar file "tbstatic.tgz" and copy it into the /tmp directory of your Turbonomic instance. You can get it from the url https://turbonomic-emea-cs-bucket.s3.eu-west-2.amazonaws.com/tbstatic/tbstatic.tgz .
2. Log in to your Turbonomic instance using SSH. For XL, you would normally log in as "turbo". For classic, you would normally use "root".
3. IMPORTANT: Make sure your working directory is the user's HOME directory before un-zipping the tarball. You can make this so by typing the command "`cd`" with no arguments.
4. Un-zip the tarball using the command: `tar xvfz --no-same-owner /tmp/tbstatic.tgz`

That's it - all done.

## Documentation

Man pages are available on line for these tools.

| Tool | Documentation page |
| ---- | ------------------ |
| screen | http://manpages.org/screen |
| nano | https://www.nano-editor.org/docs.php |
| k9s  | https://k9scli.io/ |
| yq   | https://mikefarah.gitbook.io/yq/ |

