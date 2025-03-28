#!/usr/bin/env bash
git rev-parse HEAD | tee commit_hash.txt | ots stamp \
  > commit_hash.txt.ots
