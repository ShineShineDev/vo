<?php

namespace App\Traits;

use App\Repositories\DeviceTokenRepository;
use Illuminate\Support\Facades\Http;
use Log;


trait SendPushNotification
{
    function sendFcmPushNotification($title, $message, $customer_id = null)
    {
        $data = ["title" => $title, "message" => $message];
        $devices = [];
        if ($customer_id != null) {
            $devices = DeviceTokenRepository::getByCustomerId($customer_id);
        } else {
            $devices = DeviceTokenRepository::getAll();
        }
        foreach ($devices as $device) {
            Log::info("Current Token => " . $device->token . " | " . $device->customer_id);
        }
    }

    private function send($token, $data)
    {
        $url = config('app.fcm_url');
        $serverKey = config('app.fcm_key');
        Http::withHeaders([
            'Authorization' => "key={$serverKey}",
            'Content-Type' => 'application/json'
        ])->post(
                $url,
                [
                    'to' => $token,
                    "data" => $data
                ]
            );
    }


}