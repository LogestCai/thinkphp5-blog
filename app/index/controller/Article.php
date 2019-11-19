<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.10.31
 * Time        : 12:44
 * Description : ********
 */
namespace  app\index\controller;
use app\index\service\ArticleService;

class Article extends Base
{

    public function index()
    {

        return view();
    }

    //文章列表页面
    public function art_list()
    {
        $service = new ArticleService();
        $articles = $service->art_list();
        $this->assign('articles',$articles);
        return view();
    }

    //文章详情页面
    public function art_detail()
    {
        $preveArticle = [];
        $nextArticle = [];
        $article_id = request()->route('article_id');
        $prv_id = ($article_id>1) ? ($article_id-1) : 0;
        $next_id = $article_id+1;
        $service = new ArticleService();
        $article = $service->art_detail();
        if(!empty($article))
        {
            //设置访问量自增。
            db('article')->where(array('id'=>$article_id))->setInc('views');
            $preveArticle = $service->art_detail_by_carticle_id($prv_id);
            $nextArticle = $service->art_detail_by_carticle_id($next_id);
        }
        $this->assign('article',$article);
        $this->assign('preveArticle',$preveArticle);
        $this->assign('nextArticle',$nextArticle);
        return view();
    }
    //单页面
    public function art_single()
    {
        $service = new ArticleService();
        $article = $service->art_single();
        $this->assign('article',$article);
        return view('article_single');
    }
}