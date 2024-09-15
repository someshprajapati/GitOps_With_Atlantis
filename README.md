1. Repo path:

`/Users/someshp/Documents/MyLearning/Personal_github/GitOps_With_Atlantis`

```
-rwxr-xr-x@ 1 someshp  staff    30M Aug 29 02:19 atlantis*
-rw-r--r--@ 1 someshp  staff    10M Aug 29 02:19 atlantis_darwin_arm64.zip
-rwxr-xr-x@ 1 someshp  staff    26M Sep  9 22:06 ngrok*
-rwxr-xr-x@ 1 someshp  staff   193B Sep 14 16:42 atlantis.var*
drwxr-xr-x  4 someshp  staff   128B Sep 14 16:43 scripts/
-rw-r--r--  1 someshp  staff     0B Sep 15 12:50 README.md
```

2. Run the local setup script

```
./local-setup.sh
Download atlantis lib
--2024-09-14 16:16:21--  https://github.com/runatlantis/atlantis/releases/download/v0.29.0/atlantis_darwin_arm64.zip
Resolving github.com (github.com)... 100.127.42.99
Connecting to github.com (github.com)|100.127.42.99|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release-asset-2e65be/120519269/eff3e0f4-9c30-41ca-88c3-73d0258aeb25?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240914%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240914T104622Z&X-Amz-Expires=300&X-Amz-Signature=f77c624806179a13c509ba6f66555470f424055d12fcbbb34e846933e93aaaed&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=120519269&response-content-disposition=attachment%3B%20filename%3Datlantis_darwin_arm64.zip&response-content-type=application%2Foctet-stream [following]
--2024-09-14 16:16:22--  https://objects.githubusercontent.com/github-production-release-asset-2e65be/120519269/eff3e0f4-9c30-41ca-88c3-73d0258aeb25?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240914%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240914T104622Z&X-Amz-Expires=300&X-Amz-Signature=f77c624806179a13c509ba6f66555470f424055d12fcbbb34e846933e93aaaed&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=120519269&response-content-disposition=attachment%3B%20filename%3Datlantis_darwin_arm64.zip&response-content-type=application%2Foctet-stream
Resolving objects.githubusercontent.com (objects.githubusercontent.com)... 185.199.109.133, 185.199.110.133, 185.199.111.133, ...
Connecting to objects.githubusercontent.com (objects.githubusercontent.com)|185.199.109.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10584307 (10M) [application/octet-stream]
Saving to: ‘atlantis_darwin_arm64.zip.1’

atlantis_darwin_arm64.zip.1            100%[=========================================================================>]  10.09M  23.5MB/s    in 0.4s

2024-09-14 16:16:23 (23.5 MB/s) - ‘atlantis_darwin_arm64.zip.1’ saved [10584307/10584307]

Archive:  atlantis_darwin_arm64.zip
replace atlantis? [y]es, [n]o, [A]ll, [N]one, [r]ename: y
  inflating: atlantis
Download ngrok
--2024-09-14 16:16:27--  https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz
Resolving bin.equinox.io (bin.equinox.io)... 18.205.222.128, 52.202.168.65, 54.237.133.81, ...
Connecting to bin.equinox.io (bin.equinox.io)|18.205.222.128|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 8510393 (8.1M) [application/octet-stream]
Saving to: ‘STDOUT’

-                                      100%[=========================================================================>]   8.12M  1.76MB/s    in 5.9s

2024-09-14 16:16:34 (1.37 MB/s) - written to stdout [8510393/8510393]

Generate random secret string
b8ab7c6e3de9e2024250
```

Got the random secret string ^^ and use it in `atlantis.var` file as `SECRET`


3. Run the local server using `ngrok`

```
./ngrok http 4141
http - start an HTTP tunnel

USAGE:
  ngrok http [address:port | port] [flags]

AUTHOR:
  ngrok - <support@ngrok.com>

COMMANDS:
  config          update or migrate ngrok's configuration file
  http            start an HTTP tunnel
  tcp             start a TCP tunnel
  tunnel          start a tunnel for use with a tunnel-group backend

EXAMPLES:
  ngrok http 80                                                 # secure public URL for port 80 web server
  ngrok http --url baz.ngrok.dev 8080                           # port 8080 available at baz.ngrok.dev
  ngrok tcp 22                                                  # tunnel arbitrary TCP traffic to port 22
  ngrok http 80 --oauth=google --oauth-allow-email=foo@foo.com  # secure your app with oauth

Paid Features:
  ngrok http 80 --url mydomain.com                              # run ngrok with your own custom domain
  ngrok http 80 --allow-cidr 2600:8c00::a03c:91ee:fe69:9695/32  # run ngrok with IP policy restrictions
  Upgrade your account at https://dashboard.ngrok.com/billing/subscription to access paid features

Upgrade your account at https://dashboard.ngrok.com/billing/subscription to access paid features

Flags:
  -h, --help      help for ngrok

Use "ngrok [command] --help" for more information about a command.

ERROR:  authentication failed: Usage of ngrok requires a verified account and authtoken.
ERROR:
ERROR:  Sign up for an account: https://dashboard.ngrok.com/signup
ERROR:  Install your authtoken: https://dashboard.ngrok.com/get-started/your-authtoken
ERROR:
ERROR:  ERR_NGROK_4018
ERROR:  https://ngrok.com/docs/errors/err_ngrok_4018
ERROR:
```

Need to signup and get the authtoken.

4. Run again the local server

```
./ngrok http 4141


Take our ngrok in production survey! https://forms.gle/aXiBFWzEA36DudFn6

Session Status                online
Account                       Somesh Prajapati (Plan: Free)
Version                       3.16.0
Region                        India (in)
Latency                       38ms
Web Interface                 http://127.0.0.1:4040
Forwarding                    https://ee4e-136-226-244-175.ngrok-free.app -> http://localhost:4141

Connections                   ttl     opn     rt1     rt5     p50     p90
```


5. Got the Forwarding url ^^ and use it in `atlantis.var` file as `URL`

```
bash ./scripts/start-atlantis.sh
{"level":"info","ts":"2024-09-15T12:53:57.164+0530","caller":"server/server.go:319","msg":"Supported VCS Hosts%!(EXTRA string=hosts, []models.VCSHostType=[Github])","json":{}}
{"level":"info","ts":"2024-09-15T12:53:57.293+0530","caller":"server/server.go:467","msg":"Utilizing BoltDB","json":{}}
{"level":"info","ts":"2024-09-15T12:53:57.302+0530","caller":"policy/conftest_client.go:153","msg":"failed to get default conftest version. Will attempt request scoped lazy loads DEFAULT_CONFTEST_VERSION not set","json":{}}
{"level":"info","ts":"2024-09-15T12:53:57.303+0530","caller":"server/server.go:1017","msg":"Atlantis started - listening on port 4141","json":{}}
{"level":"info","ts":"2024-09-15T12:53:57.303+0530","caller":"scheduled/executor_service.go:51","msg":"Scheduled Executor Service started","json":{}}
```

6. Setup the webhooks on Githuib repo where we want to test the atlantis workflow.

7. Create the pull request and test.


![Atlantis workflow test](atlantis.png)