<?php

namespace App\Traits;

use App\Repositories\SettingRepository;


trait SendSms
{
    public function sendSms($to, $content)
    {
        $setting_repository = new SettingRepository();
        $sms_setting = $setting_repository->getSmsApiInfo();

        // if sms_setting dose not have
        if (!$sms_setting)
            return false;

        $end_point = $sms_setting->api_url;
        $body = ["to" => $to, "message" => $content];
        $auth_token = $sms_setting->auth_token;
        $header = [
            'Content-Type: application/json',
            'Accept: application/json',
            'Authorization: Bearer ' . $auth_token
        ];

        $curl = curl_init();
        curl_setopt_array(
            $curl,
            [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",

                CURLOPT_URL => $end_point,
                CURLOPT_HTTPHEADER => $header,
                CURLOPT_POSTFIELDS => json_encode($body),
            ]
        );

        $response = curl_exec($curl);
        $response = json_decode($response);
        if ($response->status)
            return $response;
        else
            return false;
    }
}