<?php

namespace App\Traits;

use App\Repositories\OTPRepository;



trait OTPTrait
{

    use SendSms;

    public function SendOTPForShopCreate($phoe_number, $created_shop_id, $ip)
    {
        $opt_code = $this->generateOTPCode();
        $opt_content = $this->getOTPContent($opt_code);

        //$this->sendSms($this->removeInitialZero($phoe_number), $opt_content);
        
       
    }
    private function generateOTPCode()
    {
        return substr(random_int(1234, 9999), 0, 4);
    }
    private function getOTPContent($code)
    {
        return 'Your OTP for Gegomm is ' . $code . '. It is valid for next 15 minutes. Please do not share it to anyone. Thanks for using Gegomm!';
    }
    private function removeInitialZero($phone)
    {
        if ($phone[0] == '0') {
            return '+95' . substr($phone, 1);
        }
        return '+95' . $phone;
    }
}