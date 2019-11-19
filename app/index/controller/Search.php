<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.10.31
 * Time        : 12:47
 * Description : ********
 */
namespace app\index\controller;
use app\index\service\ArticleService;

class Search extends Base
{
    //标签搜索
    public function tags()
    {
        $service = new ArticleService();
        $res = $service->get_tag_search();
        $this->assign('articles',$res);
        return view();
    }

    //搜索关键字
    public function keys()
    {
        $service = new ArticleService();
        $res = $service->get_title_search();
        //var_dump($res);exit;
        $this->assign('articles',$res);
        return view();
    }
}