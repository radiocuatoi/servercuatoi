#!/usr/bin/env bash
kill -9 $(ps aux | grep "us.cuatoi.server.main.ProxyMain" | awk '{print $2}') || true