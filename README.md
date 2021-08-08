# Linux Tools for the Turbonomic Field Team

This project aims to provide a number of (mainly standard) Linux add-on tools that may be useful to the Turbonomic field team in an "easy-to-install" format with no dependencies.

The tools are provided with NO SUPPORT WHAT SO EVER and are unmodified versions of the tools available via their own websites. The licenses are those that apply to the tools themselves. The build files (Makefiles, Dockerfiles etc) in this repository are licenced under the GNU General Public License v3.0

The current release includes:

- `htop` (an enhanced version of "top")
- `jq` (a JSON parser for the linux command line)
- `k9s` (a text UI alternative to many of kubectl's features)
- `nano` (a simple text editor - much easier to use than `vi`)
- `screen` (allows an interactive shell session to survive SSH disconnects)
- `yq` (a lightweight and portable command-line YAML processor)

The makefiles for this distribution can be found on github at https://github.com/chrislowth/tb-field-tools .

## Installation.

1. Download the tar file "tb-field-tools.tgz" and copy it into the /tmp directory of your Turbonomic instance. You can get it from the url https://github.com/chrislowth/tb-field-tools/releases/download/1.1/tb-field-tools.tgz .
  - Note: if you use "curl" to download the file, you should use both options `-O` (to save to the local directory using the original file name) and `-L` (to follow HTTP redirects).
2. Log in to your Turbonomic instance using SSH. For XL, you would normally log in as "turbo". For classic, you would normally use "root".
3. IMPORTANT: Make sure your working directory is the user's HOME directory before un-zipping the tarball. You can make this so by typing the command "`cd`" with no arguments.
4. Un-zip the tarball using the command: `tar xvfz --no-same-owner /tmp/tb-field-tools.tgz`

That's it - all done.

## Documentation

Man pages are available on line for these tools.

| Tool | Documentation page |
| ---- | ------------------ |
| htop | http://htop.dev/ |
| screen | http://manpages.org/screen |
| nano | https://www.nano-editor.org/docs.php |
| jq   | https://stedolan.github.io/jq/manual/v1.6/ |
| k9s  | https://k9scli.io/ |
| yq   | https://mikefarah.gitbook.io/yq/ |
