# Overview
Basic Zookeeper image using Dockerize for templating config files

# Usage
This Zookeeper server will run in the foreground.  It is currently set up to only run standalone, not as a cluster.

There is some very basic config that can be changed using environment variables.  If not specified, these are set to reasonable defaults.

##### zoo.cfg
* tickTime={{ .Env.TICK_TIME }}
* dataDir={{ .Env.DATA_DIR }}
* clientPort={{ .Env.CLIENT_PORT }}

# Example
```
docker run -e TICK_TIME=2000 -e CLIENT_PORT=2181 ruppdog/zookeeper
```

# License and Author
Author: Tyler Ruppert

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.