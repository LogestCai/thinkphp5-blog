<?php
/**
 * User: 青草根
 * Date: 2019-11-06
 * Time: 21:11
 * Description:
 * Email:caimh0223@163.com
 */

namespace app\admin\controller;


use app\admin\service\AdvGroupService;

class AdvGroup extends Base
{
    public function index()
    {
        $service = new AdvGroupService();
        $resData = $service->index();
        $this->assign('resData',$resData);
        return view();
    }

    public function add()
    {
        $service = new AdvGroupService();
        return $service->add();
    }

    public function del()
    {
        $service = new AdvGroupService();
        return $service->del();
    }
}