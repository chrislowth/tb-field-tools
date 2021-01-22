# Linux Tools for the Turbonomic Field Team

This project aims to provide a number of (mainly standard) Linux add-on tools that may be useful to the Turbonomic field team in an "easy-to-install" format with no dependencies.

The tools are provided with NO SUPPORT WHAT SO EVER and are unmodified versions of the tools available via their own websites. The licenses are those that apply to the tools themselves. The build files (Makefiles, Dockerfiles etc) in this repository are licenced under the GNU General Public License v3.0

The current release includes:

- `screen` (allows an interactive shell session to survive SSH disconnects)
- `nano` (a simple text editor - much easier to use than `vi`)
- `k9s` (a text UI alternative to many of kubectl's features)
- `jq` (a JSON parser for the linux command line)
- `yq` (a lightweight and portable command-line YAML processor)
- `enableReporting.sh` (a script to edit the XL .yaml file to enable embedded reporting features)

It also includes the three shell scripts from the t8c-install GIT repositry that are referenced in the Turbonomic v8 installation guide in the section about enabling embedded reporting.

The makefiles for this distribution can be found on github at https://github.com/chrislowth/tb-field-tools .

## Installation.

1. Download the tar file "tb-field-tools.tgz" and copy it into the /tmp directory of your Turbonomic instance. You can get it from the url https://turbonomic-emea-cs-bucket.s3.eu-west-2.amazonaws.com/tb-field-tools/tb-field-tools.tgz .
2. Log in to your Turbonomic instance using SSH. For XL, you would normally log in as "turbo". For classic, you would normally use "root".
3. IMPORTANT: Make sure your working directory is the user's HOME directory before un-zipping the tarball. You can make this so by typing the command "`cd`" with no arguments.
4. Un-zip the tarball using the command: `tar xvfz --no-same-owner /tmp/tb-field-tools.tgz`

That's it - all done.

## Documentation

Man pages are available on line for these tools.

| Tool | Documentation page |
| ---- | ------------------ |
| screen | http://manpages.org/screen |
| nano | https://www.nano-editor.org/docs.php |
| jq   | https://stedolan.github.io/jq/manual/v1.6/ |
| k9s  | https://k9scli.io/ |
| yq   | https://mikefarah.gitbook.io/yq/ |

### enableReporting.sh

This script makes the edits to the .yaml file needed to enable embedded reporting. You still need to do the rest by hand.

To run it on an OVA installed instance; log in to the XL VM as "turbo" and ...

```
cd kubernetes/operator/deploy/crds
cp charts_v1alpha1_xl_cr.yaml charts_v1alpha1_xl_cr.yaml.BAK
enableReporting.sh charts_v1alpha1_xl_cr.yaml
```

(or change the name of .yaml file if your installation uses a different one.)

Once the edits have been made, review the file and use "kubectl apply" to apply the changes - then continue with the remaining steps documented in the on-line XL installation guide (see http://docs.turbonomic.com/)
