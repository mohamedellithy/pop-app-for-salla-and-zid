<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Resources\CampaignCollection as CampaignCollectionResource;
use App\Http\Resources\Campaign as CampaignResource;
class AdminMerchantController extends Controller
{
    //
    public function index(Request $request){
        $merchants     = User::where('role',1)->pluck('name')->toArray();
        return response()->json(array('merchants' => $merchants));
    }
}
