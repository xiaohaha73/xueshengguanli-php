<?php


namespace app\exception;


use Exception;
use think\exception\Handle;

class ExceptionHandler extends Handle
{

    private $code;
    private $data;

    public function render(Exception $e)
    {

        // debug模式
        if (config('app_debug')) {
            return parent::render($e);
        } else {
            $this->code = $e->getStatusCode();
            switch ($this->code) {
                // 404错误
                case 404 :
                    $this->data = array('status'=>$this->code,'msg'=>'未知请求路径');
                    break;
            }


           return json($this->data);

        }


    }


}
