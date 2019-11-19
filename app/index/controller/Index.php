<?php
namespace app\index\controller;

use app\admin\service\IndexService;
use app\index\service\ArticleService;

class Index extends Base
{
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub

    }

    public function index()
    {
        $service = new ArticleService();
        if(request()->isPost())
        {
            return $service->get_index_article();
        }
        $swiper   =  $service->get_swiper();
        $articles =  $service->get_index_article();
        $this->assign('swiper',$swiper);
        $this->assign('articles',$articles);
        //var_dump($articles);exit;
        //首页静态化缓存
        if(file_exists('index.shtml')&&filemtime('index.shtml')>=time()-1200)//设置首页静文件并缓存1小时
        {
            return $this->fetch('index.shtml');
        }
        else
        {
            $contents = $this->fetch();
            @file_put_contents('index.shtml', $contents );
            echo $contents;
        }
        //return view();
    }
   //首页加载更多功能
    public function index_pst(){
        return $this->index();
    }
}