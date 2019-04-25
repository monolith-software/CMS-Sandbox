<?php

use Symfony\Component\HttpFoundation\Request;

//require __DIR__.'/../vendor/autoload.php';
require __DIR__.'/../app/autoload.php';

$kernel = new AppKernel('prod', true);
//$kernel = new AppCache($kernel);

\Profiler::enable();

// When using the HttpCache, you need to call the method in your front controller instead of relying on the configuration parameter
//Request::enableHttpMethodParameterOverride();
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
