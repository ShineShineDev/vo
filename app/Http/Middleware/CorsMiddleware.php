<?php

namespace App\Http\Middleware;

use Closure;

class CorsMiddleware
{
    public function handle($request, Closure $next)
    {
        $allowedOrigins = ['*'];
        if ($request->getMethod() === 'OPTIONS') {
            return response()
                ->json([], 200)
                ->header('Access-Control-Allow-Origin', implode(', ', $allowedOrigins))
                ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
        }
        $response = $next($request);
        $response->headers->set('Access-Control-Allow-Origin', implode(', ', $allowedOrigins));
        $response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, Authorization');
        return $response;
    }
}
