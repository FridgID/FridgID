#!/bin/bash
echo "error pages found:"
grep -lr "friendly error page" . | sort | wc -l

echo "first file:"
grep -lr "friendly error page" html | sort | head -1

echo "last file:"
grep -lr "friendly error page" html | sort | tail -n 1

