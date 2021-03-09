<?php
require 'vendor/autoload.php';

Class Uuid
{
    public function getUuid()
    {
        $factory = \Ramsey\Uuid\Uuid::getFactory();

        return $factory->uuid4();
    }
}