<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\Campaign;
use App\Models\Product;
use Illuminate\Validation\Rule;
use App\Http\Resources\Campaign as CampaignResource;
use App\Services\OperationsZid;
use App\Models\Attachment;
use Illuminate\Database\Eloquent\Builder;
use App\Services\CampaignService;
class CampaignController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        if($request->has('status')):
            $status = [
                "published",
                "draft",
                "working",
                "ended"
            ];

            if(in_array($request->query('status'),$status)):

                if($request->query('status') == 'published'):

                    $all_campaigns = auth()->user()->campaign()->where('status',1)->get();

                elseif($request->query('status') == 'draft'):

                    $all_campaigns = auth()->user()->campaign()->where('status',0)->get();

                elseif ($request->query('status') == 'working'):

                    $all_campaigns = auth()->user()->campaign()->where('status', 1)->where('progress', 1)->get();

                elseif($request->query('status') == 'ended'):

                    $all_campaigns = auth()->user()->campaign()->where('status', 1)->where('progress', 2)->get();

                endif;

            else:

                $all_campaigns = auth()->user()->campaign;
            endif;

        else:

            $all_campaigns = auth()->user()->campaign;
        endif;

        $all_campaigns = CampaignResource::collection($all_campaigns);
        return response()->json(array('campaigns' => $all_campaigns));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validate = Validator::make($request->all(), [
            'name'   => [
                'required',
                 Rule::unique('campaigns','name')->whereNull('deleted_at')
            ],
            'action' => 'required',
            'repeate'=> 'required'
        ]);

        if($validate->fails()){
            return response()->json($validate->errors(),401);
        }

        return (new CampaignService($request->all()))->store();
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
        $my_campaign = auth()->user()->campaign->where('id', $id)->first();
        $my_campaign = new CampaignResource($my_campaign);
        return response()->json(array('campaign' => $my_campaign));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validate = Validator::make($request->all(), [
            'name'   => [
                'required',
                 Rule::unique('campaigns','name')->ignore($id)->whereNull('deleted_at')
            ],
            'action' => 'required',
            'repeate'=> 'required'
        ]);

        if($validate->fails()){
            return response()->json($validate->errors());
        }

        return (new CampaignService($request->all()))->update($id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function change_status($id,$status)
    {
        //
        $update_status = auth()->user()->campaign()->where('id', $id)->update([
            'status' => $status
        ]);

        if($update_status){
            return response()->json(
                array(
                    'campaign' => $update_status
                )
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        //
        auth()->user()->campaign()->where('id', $id)->delete();
        return response()->json([
            'status' => 'Campagin Created successfully'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function trashed_campagains(){
        //
        $campaigns = auth()->user()->campaign()->onlyTrashed()->get();
        return response()->json([
            'campaigns' => CampaignResource::collection($campaigns)
        ]);
    }

    public function permanently_trashed(Request $request){
        if($request->has('campaign_id')):
            auth()->user()->campaign()->onlyTrashed()->whereIN('id', $request->input('campaign_id'))->forceDelete();
        else:
            auth()->user()->campaign()->onlyTrashed()->forceDelete();
        endif;

        return response()->json([
            'campaigns' => $request->input('campaign_id')
        ]);
    }

    public function rollback_trashed(Request $request){
        if($request->has('campaign_id')):
            auth()->user()->campaign()->onlyTrashed()->whereIN('id', $request->input('campaign_id'))->restore();
        else:
            auth()->user()->campaign()->onlyTrashed()->restore();
        endif;

        return response()->json([
            'campaigns' => $request->input('campaign_id')
        ]);
    }
}
