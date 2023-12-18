<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\Auth\ApiAuthController;
use App\Http\Controllers\Api\CampaignController;
use App\Http\Controllers\Api\Integrations\AuthorizeAppController;
// admin
use App\Http\Controllers\Api\AdminCampaignController;
use App\Http\Controllers\Api\AdminMerchantController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('/login',[ApiAuthController::class , 'login'])->middleware('throttle:5,1');;
Route::post('/register',[ApiAuthController::class , 'register']);
Route::post('password/email',[ApiAuthController::class,'forget']);
Route::post('password/reset',[ApiAuthController::class,'reset']);
Route::post('check-permissions/reset-password',[ApiAuthController::class,'check_permissions']);

// salla services app authorize
Route::post('callback/salla',[AuthorizeAppController::class,'callback_salla']);

// zid services app authorize
Route::get('integrate/zid',[AuthorizeAppController::class,'accept_zid']);
Route::get('/zid/callback',[AuthorizeAppController::class,'callback_zid']);
Route::get('me-tokens',[AuthorizeAppController::class,'app_me_tokens']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/validate-authenticated-app',[ApiAuthController::class,'validate_authenticated_app_account']);
    Route::get('/app-products', [AuthorizeAppController::class,'app_products']);
    Route::get('/app-categories', [AuthorizeAppController::class,'app_categories']);
    Route::get('/single-app-product/{id}', [AuthorizeAppController::class,'app_single_product']);
    Route::get('/single-app-category/{id}', [AuthorizeAppController::class,'app_single_category']);
});

// others routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me',[ApiAuthController::class , 'me']);
   Route::post('/logout',[ApiAuthController::class , 'logout']);
    Route::apiResource('campaigns',CampaignController::class);
    Route::post('/campaign/change_status/{id}/{status}', [CampaignController::class,'change_status']);
    Route::get('/campaign/trashed', [CampaignController::class,'trashed_campagains']);
    Route::post('/campaign/permanently-trashed',[CampaignController::class,'permanently_trashed']);
    Route::post('/campaign/rollback-trashed',[CampaignController::class,'rollback_trashed']);
    Route::get('/info-me',[ApiAuthController::class,'info_me']);
    Route::post('info-me-update',[ApiAuthController::class,'info_me_update']);

    // admin

    Route::prefix('admin')->group(function(){
        Route::get('/campaigns',[AdminCampaignController::class , 'index']);
        Route::get('/campaign/{id}',[AdminCampaignController::class,'show']);
        Route::get('/merchants',[AdminMerchantController::class , 'index']);
    });
});
