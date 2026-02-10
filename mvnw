#!/bin/sh
# Apache Maven Wrapper startup script, version 3.2.0

# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------

BASE_DIR=$(cd "$(dirname "$0")" && pwd)

WRAPPER_JAR="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_PROPERTIES="$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"

# Download wrapper jar if missing
if [ ! -f "$WRAPPER_JAR" ]; then
  WRAPPER_URL=$(grep -E '^wrapperUrl=' "$WRAPPER_PROPERTIES" | cut -d'=' -f2-)
  if [ -z "$WRAPPER_URL" ]; then
    echo "wrapperUrl is not set in $WRAPPER_PROPERTIES" >&2
    exit 1
  fi
  echo "Downloading Maven wrapper from $WRAPPER_URL" >&2
  mkdir -p "$BASE_DIR/.mvn/wrapper" || exit 1
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR" || exit 1
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR" || exit 1
  else
    echo "Neither curl nor wget is available to download Maven wrapper" >&2
    exit 1
  fi
fi

JAVA_EXE="$JAVA_HOME/bin/java"
if [ -z "$JAVA_HOME" ] || [ ! -x "$JAVA_EXE" ]; then
  JAVA_EXE="java"
fi

exec "$JAVA_EXE" -classpath "$WRAPPER_JAR" -Dmaven.multiModuleProjectDirectory="$BASE_DIR" org.apache.maven.wrapper.MavenWrapperMain "$@"
