#!/usr/bin/env bash
kill $(ps aux | grep "us.cuatoi.server.main.ProxyMain" | awk '{print $2}') || true