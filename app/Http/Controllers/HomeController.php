<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\WPost;
use App\Models\WPostAttachment;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $blogs = WPost::where('post_status','publish')->take(3)->get();
        return view('index',compact('blogs'));
        //return view('index');
    }
}
