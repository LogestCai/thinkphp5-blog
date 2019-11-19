<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.10.31
 * Time        : 14:57
 * Description : ********
 */
namespace app\index\service;
use app\common\model\ArticleCateModel;
use app\common\model\ArticleModel;
use think\Db;

class ArticleService extends Common
{
    public function base()
    {

        $artModel = new ArticleModel();
        $catModel = new ArticleCateModel();
        $cate_id    = request()->route('cate_id');
        $article_id = request()->route('article_id');
        if($cate_id ==''){
            $cate_id = 0;
        }else{
            $cate = db('article_cate')->where('id',$cate_id)->find();
            if(!empty($cate['type'])&&$cate['type']==2)
            {
                $cate_id = 0;
            }
            
        }

        if($article_id!=''){
            $articleRes = $artModel->getOneArticle(intval($article_id));
            if(!empty($articleRes)){
                $cate_id = $articleRes['cate_id'];
            }
        }
        //var_dump($cate_id,$article_id);exit;

        $nav      = $artModel->getArticleCate();
        $hot      = $artModel->getHotArticle($cate_id);
        $suggest  = $artModel->getSuggestArticle($cate_id);
        $new      = $artModel->getNewArticle($cate_id);
        $tags     = $artModel->getHotTags($cate_id);
        $img      = $artModel->getImgArticle($cate_id);
        $bread    = $catModel->getParents($cate_id);

        //var_dump($bread);exit;
        return [
            'nav'=>$nav,
            'hot'=>$hot,
            'suggest'=>$suggest,
            'new'=>$new,
            'tags'=>$tags,
            'img'=>$img,
            'bread'=>$bread
        ];
    }
    //列表页信息
    public function art_list()
    {
        $articles = [];
        //默认获取根据设置获取第一页数据
        $perPage = config('siteconfig.indexLstNumber');
        $artModel = new ArticleModel();
        $cate_id = request()->route('cate_id');
        if($cate_id == ''){
            $cate_id=0;
        }else{
            $cate_id = intval($cate_id);
        }
        if(request()->isPost())
        {
            //如果存在post数据则以ajax方式返回数据
            $page = input('pages');
            //var_dump($page);exit;
            $articles = $artModel->frontListArticleByCateId($page,$perPage,$cate_id);
            if($articles){
                return json(['code'=>200,'msg'=>'获取成功','data'=>$articles,'page'=>$page]);
            }else{
                return json(['code'=>100,'msg'=>'获取数据失败','data'=>'','page'=>$page]);
            }
        }else{
            return $artModel->frontListArticleByCateId(1,$perPage,$cate_id);
        }
    }
    //详情页信息
    public function art_detail()
    {
        $model = new ArticleModel();
        $article_id = request()->route('article_id');
        $year = request()->route('year');
        $month = request()->route('month');
        $day = request()->route('day');
        $article = $model->frontArtDetail($article_id);
        if(!empty($article)){
            if($article['for_year']==$year&&$article['for_month']==$month&&$article['for_day']==$day)
            {
                return $article;
            }else
            {
                return [];
            }
        }
        return [];
    }

    //根据caticleid获取文章
    public function art_detail_by_carticle_id($article_id)
    {
        $model = new ArticleModel();
        return $model->frontArtDetail($article_id);
    }
    //获得首页轮播图
    public function get_swiper($map=[])
    {
        $map['status'] = 1;
        return Db::name('adv')->alias('a')->join('adv_group b','a.group=b.id')->field('a.id,a.title,b.name group_name,a.id,a.description,a.img_url,link_url,type,create_time,update_time,expir_time,status')->where($map)->order('a.create_time desc')->select();
    }

    //获取首页文章
    public function get_index_article()
    {
        $articles = [];
        //默认获取根据设置获取第一页数据
        $artModel = new ArticleModel();
        $perPage = config('siteconfig.indexLstNumber');
        if(request()->isPost())
        {
            //如果存在post数据则以ajax方式返回数据
            $page = input('pages');
            $articles = $artModel->frontIndexArticleByPage($page,$perPage);
            if($articles){
                return json(['code'=>200,'msg'=>'获取成功','data'=>$articles,'page'=>$page]);
            }else{
                return json(['code'=>100,'msg'=>'获取数据失败','data'=>'','page'=>$page]);
            }
        }else{
            return $artModel->frontIndexArticleByPage(1,$perPage);
        }

    }

    //标签搜索功能实现
    public function get_tag_search()
    {
        $tags = request()->route('tag');
        if($tags!=''){
            $article_ids = db('article_tag')->where('tag',$tags)->column('article_id');
            if(is_array($article_ids)){
                $article_ids = implode(',',$article_ids);
            }
            $map['id']=['in',$article_ids];
            $artModel = new ArticleModel();
            return $artModel->frontArtList($map);
        }else
        {
            return [];
        }

    }

    //内容标题搜索
    public function get_title_search()
    {
        $key = input('key')? input('key'):'';
        $artModel = new ArticleModel();
        return $artModel->frontArticleSearch($key);
    }

    //单页面应用获取
    public function art_single()
    {
        $articles = [];
        $cate_id = request()->route('cate_id');
        if($cate_id!='')
        {
            $articles = db('article_cate')->field("id,name as title,content,ora_content,update_time pub_time,'' tags,'' photo ")->find(intval($cate_id));
        }
        return $articles;
    }
}