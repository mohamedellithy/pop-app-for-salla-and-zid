<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Http\Controllers\HomeController;



Route::get('/',[HomeController::class,'index']);

Route::get('/privacy-policy',function(){
    return view('privacy-policy');
});

Route::get('/terms-conditions',function(){
    return view('terms-conditions');
});

// overide settings of apps

Route::get('/register',function() {
    return redirect()->to('https://apps.zid.sa/application/1974');
});

// overide settings of apps
Route::get('/login/zid',function() {
    return redirect()->to('/api/integrate/zid');
});

Route::get('/{page?}',function($page = null) {
    return view('render-vue');
})->where('page','.*');

//Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
