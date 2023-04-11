<?php

declare(strict_types=1);

use GR\DevEnvBoilerplate\Infrastructure\Slim\Setting\Settings;
use GR\DevEnvBoilerplate\Infrastructure\Slim\Setting\SettingsInterface;
use DI\ContainerBuilder;
use Monolog\Logger;

return static function (ContainerBuilder $containerBuilder)
{
    // Global Settings Object
    $containerBuilder->addDefinitions([
        SettingsInterface::class => function () {
            return new Settings([
                'displayErrorDetails' => true, // Should be set to false in production
                'logError'            => false,
                'logErrorDetails'     => false,
                'logger' => [
                    'name' => 'slim-app',
                    'path' => isset($_ENV['docker']) ? 'php://stdout' : __DIR__ . '/../logs/app.log',
                    'level' => Logger::DEBUG,
                ],
                'database' => [
                    ##[HY000] [2002] php_network_getaddresses: getaddrinfo for db failed: Temporary failure in name resolution
                    #'host' => 'db',
                    #SQLSTATE[HY000] [2002] Connection refused
                    'host' => 'mysql8-service',
                    'port' => '3306',
                    'name' => 'minipokedex',
                    'user' => 'root',
                    'password' => 'root',
                    'charset' => 'utf8mb4',
                ],
                'redis' => [
                    'schema' => 'tcp',
                    'host' => 'redis-service',
                    'port' => '6379',
                ],
                'memcached' => [
                    'host' => 'memcached-service',
                    'port' => 11211,
                ],
            ]);
        }
    ]);
};
