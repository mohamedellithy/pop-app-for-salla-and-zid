<?php
namespace App\Services;

class AppService {

    public static function authorize($app_name = null){
        if($app_name == null) return;

        $app = self::handle_app_name($app_name);

        $app_class =  "\\App\Services\\$app\\Authorize";

        if(class_exists($app_class)):
            return new $app_class;
        endif;

        return $app_class.' class Not Exist';
    }

    public static function Items($app_name = null){
        if($app_name == null) return;

        $app = self::handle_app_name($app_name);

        $app_class =  "\\App\Services\\$app\\Items";

        if(class_exists($app_class)):
            return new $app_class;
        endif;

        return $app_class.' class Not Exist';
    }

    public static function Operations($app_name = null){
        if($app_name == null) return;

        $app = self::handle_app_name($app_name);

        $app_class =  "\\App\Services\\$app\\Operations";

        if(class_exists($app_class)):
            return new $app_class;
        endif;

        return $app_class.' class Not Exist';
    }

    public static function handle_app_name($app_name){
        if($app_name == null) return;
        $app_name = ucfirst($app_name).'Service';
        return $app_name;
    }
}
