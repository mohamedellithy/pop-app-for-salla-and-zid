<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Campaign;
use App\Http\Resources\CampaignCollection as CampaignCollectionResource;
use App\Http\Resources\Campaign as CampaignResource;
use Illuminate\Database\Eloquent\Builder;
use Carbon\Carbon;
class AdminCampaignController extends Controller
{
    //
    public function index(Request $request){
        $campaigns      = Campaign::query();
        if($request->has('merchant')):
            $campaigns = $campaigns->whereHas('merchant',function(Builder $query) use($request){
                return $query->where('name',$request->query('merchant'));
            });
        endif;

        if($request->has('progress')):
            $campaigns = $campaigns->where('progress',$request->query('progress'));
        endif;

        if($request->has('startDate') && $request->query('endDate')):
            $campaigns = $campaigns->whereBetween('created_at',[
                Carbon::parse(strtotime($request->query('startDate')))->format('Y-m-d 00:00:00'),
                Carbon::parse(strtotime($request->query('endDate')))->format('Y-m-d 00:00:00')
            ]);
        endif;

        $campaigns     = $campaigns->paginate(5);
        $all_campaigns = new CampaignCollectionResource($campaigns);
        return response()->json(array('campaigns' => $all_campaigns));
    }

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $my_campaign = Campaign::find($id);
        $my_campaign = new CampaignResource($my_campaign);
        return response()->json(array('campaign' => $my_campaign));
    }
}
