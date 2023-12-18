<?php
namespace App\Services\InterfaceService;

interface Credential {
    public function merchant();

    public function resolve_call($path = null,$method = 'get',$body = array(),$credentials = array());
}
