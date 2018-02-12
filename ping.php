<?php

http_response_code(200);
header('Cache-Control: must-revalidate, no-cache, no-store, private');
header('Content-Type: text/plain; charset=UTF-8');

echo 'pong';
