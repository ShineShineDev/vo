<?php

namespace Domain\api\user\Services;


use App\Models\User;
use Domain\api\user\Resources\UserResource;
use Illuminate\Support\Facades\Hash;

class AuthServices
{
    public function register($req)
    {

        $user = User::create($this->inputForReg($req));
        if ($user) {
            $token = $user->createToken('user_api_token')->accessToken;
            return [
                "token" => $token,
                "user" => new UserResource($user)
            ];
        }
        return false;
    }

    private function inputForReg($req)
    {
        $input = $req->only("name", "email", "staff_id", "created_by", "flag");
        if (is_null($input['flag']))
            $input['flag'] = true;
        $input['password'] = Hash::make($req->password);
        return $input;
    }

    public function login($req)
    {
        $user = User::where('email', $req->email)->first();
        if (!$user)
            return 0;
        if (!Hash::check($req->password, $user->password))
            return 1;

        $token = $user->createToken('user_api_token')->accessToken;
        return [
            "token" => $token,
            "user" => new UserResource($user)
        ];
    }
}

