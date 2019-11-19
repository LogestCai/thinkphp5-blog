<?php

namespace app\common\model;
use think\Model;
use think\Db;

class ArticleModel extends Model
{
    protected $name = 'article';
    private $article_field = "r.id,r.title,r.cate_id,r.photo,r.remark,r.keyword,r.content,r.views,r.type,r.is_tui,r.from,r.writer,r.ip,r.create_time,r.update_time,r.status,rc.name,r.music,r.is_pub,r.is_hot,r.is_img,r.pub_time,DATE_FORMAT(pub_time,'%Y') as for_year,DATE_FORMAT(pub_time,'%m') as for_month,DATE_FORMAT(pub_time,'%d') as for_day,tags,r.ora_content ";
    
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;


    /**
     * 根据搜索条件获取文章列表信息
     * @author
     */
    public function getArticleByWhere($map,$od)
    {
        //return $this->select();
        return $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->paginate('10',false,['query' => request()->param()]);
    }
    
    
    /**
     * [insertArticle 添加文章]
     * @author
     */
    public function insertArticle($param)
    {
        $tags = [];
        if(isset($param['tags']))
        {
            $tags = explode(',',$param['tags']);
            //var_dump($tags);exit;
            //unset($param['tags']);
        }
        Db::startTrans();// 启动事务
        try{
            $id = $this->allowField(true)->insertGetId($param);
            if(!empty($tags))
            {
                foreach ($tags as $v)
                {
                    if($v!=''){
                        db('article_tag')->insert(['article_id'=>$id,'tag'=>str_replace(' ','',$v)]);
                    }                    
                }

            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章【'.$param['title'].'】添加成功',1);
            return ['code' => 200, 'data' => ['id'=>$id], 'msg' => $tags];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章【'.$param['title'].'】添加失败',2);
            return ['code' => 100, 'data' => '', 'msg' =>'文章添加失败'];
        }
    }



    /**
     * [updateArticle 编辑文章]
     * @author
     */
    public function updateArticle($param)
    {
        $tags = [];
        if(isset($param['tags']))
        {
            $tags = explode(',',$param['tags']);
            //var_dump($tags);exit;
            //unset($param['tags']);
        }
        Db::startTrans();// 启动事务
        try{
            $this->allowField(true)->update($param, ['id' => $param['id']]);
            if(!empty($tags))
            {
                foreach ($tags as $v)
                {
                    if($v!=''){                          
                        db('article_tag')->insert(['article_id'=>$param['id'],'tag'=>str_replace(' ','',$v)],true);
                    }  
                }
            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章【'.$param['title'].'】编辑成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '文章编辑成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章【'.$param['title'].'】编辑失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '文章编辑失败'];
        }
    }



    /**
     * [getOneArticle 根据文章id获取一条信息]
     * @author
     */
    public function getOneArticle($id)
    {
        return $this->where('id', $id)->find();
    }



    /**
     * [delArticle 删除文章]
     * @author
     */
    public function delArticle($id)
    {
        $title = $this->where('id',$id)->value('title');
        Db::startTrans();// 启动事务
        try{
            $this->where('id', $id)->delete();
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章【'.$title.'】删除成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '文章删除成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章【'.$title.'】删除失败',2);
            return ['code' => 100, 'data' => '', 'msg' =>  '文章删除失败'];
        }
    }

    /**
     * batchDelArticle 批量删除文章
     * @param $param
     * @return array
     */
    public function batchDelArticle($param){
        Db::startTrans();// 启动事务
        try{
            ArticleModel::destroy($param);
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章批量删除成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量删除成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章批量删除失败',1);
            return ['code' => 100, 'data' => '', 'msg' => '批量删除失败'];
        }
    }

    /**
     * [articleState 文章状态]
     * @param $param
     * @return array
     */
    public function articleState($id,$param){

        Db::startTrans();// 启动事务
        try{
            $this->where('id',$id)->update($param);
            Db::commit();// 提交事务
            //writelog(session('uid'),session('username'),'文章【'.$title.'】'.$msg.'成功',1);
               return ['code' => 200, 'data' => $this->toArray(), 'msg' => '成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            //writelog(session('uid'),session('username'),'文章【'.$title.'】'.$msg.'失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '失败'];
        }
    }

    /**
     * 批量禁用文章
     * @param $param
     * @return array
     */
    public function forbiddenArticle($param){
        Db::startTrans();// 启动事务
        try{
            if($param){
                $this->saveAll($param);
            }else{
                $this->where('1=1')->update(['status'=>2]);
            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'批量禁用文章成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量禁用成功'];
        }catch( \Exception $e){
            Db::rollback ();//回滚事务
            writelog(session('uid'),session('username'),'批量禁用文章失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '批量禁用失败'];
        }
    }

    /**
     * 批量启用文章
     * @param $param
     * @return array
     */
    public function usingArticle($param){
        Db::startTrans();// 启动事务
        try{
            if($param){
                $this->saveAll($param);
            }else{
                $this->where('1=1')->update(['status'=>1]);
            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'批量启用文章成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量启用成功'];
        }catch( \Exception $e){
            Db::rollback ();//回滚事务
            writelog(session('uid'),session('username'),'批量启用文章失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '批量启用失败'];
        }
    }


    //===============================前端模型开始============================

    public function getArticleCate()
    {
        return F_getTree(db('article_cate')->where(['status'=>1])->select());
    }
    /*获取热门
     *
     */
    public function getHotArticle($cate_id=0)
    {
        $cateModel = new ArticleCateModel();
        $cateids = $cateModel->getCateChildrenIds($cate_id);
        if($cateids!='')
        {
            $map['r.cate_id'] = ['in',$cateids];
        }
        $map['r.status']=1;
        return $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('views desc')
            ->paginate('10',false,['query' => request()->param()]);
    }

    /**
     * 获取最新文章
     * @param $cateid
     * @return \think\Paginator
     */
    public function getNewArticle($cateid=0)
    {

        $map['r.status']=1;
        $cateModel = new ArticleCateModel();
        $cateids = $cateModel->getCateChildrenIds($cateid);
        if($cateids!='')
        {
            $map['r.cate_id'] = ['in',$cateids];
        }
        return $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('pub_time desc')
            ->paginate('10',false,['query' => request()->param()]);
    }

    /**
     * 获取推荐文章
     * @param $cateid
     * @return \think\Paginator
     */
    public function getSuggestArticle($cateid=0)
    {

        $map['r.status']=1;
        $map['r.is_tui']=1;
        $cateModel = new ArticleCateModel();
        $cateids = $cateModel->getCateChildrenIds($cateid);
        if($cateids!='')
        {
            $map['r.cate_id'] = ['in',$cateids];
        }
        return $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('pub_time desc')
            ->paginate('10',false,['query' => request()->param()]);
    }

    /**
     * 获取图片文章
     * @param $cateid
     * @return \think\Paginator
     */
    public function getImgArticle($cateid=0)
    {

        $map['r.status']=1;
        $map['r.is_img']=1;
        $cateModel = new ArticleCateModel();
        $cateids = $cateModel->getCateChildrenIds($cateid);
        if($cateids!='')
        {
            $map['r.cate_id'] = ['in',$cateids];
        }
        return $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('pub_time desc')
            ->paginate('10',false,['query' => request()->param()]);
    }


    public function getArticleTagsById($article_id)
    {
        return db('article_tag')->where('article_id',$article_id)->field('article_id,tag')->select();
    }


    public function getHotTags()
    {
        return db('article_tag')->field('tag,count(*) number')->group('tag')->order('number desc')->limit(config('siteconfig.tagNumber'))->select();
    }
    /*
     * 前端页面获取文章列表
     */
    public function frontArtList($map=[])
    {
        $map['status']=1;
        $map['is_pub']=1;
        return $this->where($map)->order('pub_time desc')->select();
    }

    //前端页面文章详情
    public  function frontArtDetail($article_id = 0)
    {
        $field = "id,title,cate_id,photo,keyword,content,views,type,is_tui,writer,ip,create_time,update_time,status,is_pub,is_hot,is_img,pub_time,DATE_FORMAT(pub_time,'%Y') as for_year,DATE_FORMAT(pub_time,'%m') as for_month,DATE_FORMAT(pub_time,'%d') as for_day,tags,ora_content ";
        $map['status']=1;
        $map['is_pub']=1;
        return $this->where($map)->field($field)->find($article_id);
    }

    public function frontIndexArticleByPage($page =1,$offset=10)
    {
        $map['r.status']=1;
        $map['is_pub']=1;
        $map['is_tui']=1;
        $data = $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('pub_time desc')
            ->limit((intval($page)-1)*$offset,$offset)
            ->select();
        return $data;
    }

    public function frontListArticleByCateId($page =1,$offset=3,$cate_id)
    {
        $cateModel = new ArticleCateModel();
        $ids = $cateModel->getCateChildrenIds($cate_id);
        $map['r.status']=1;
        $map['is_pub']=1;
        $map['cate_id']=['in',$ids];
        $data = $this->alias ('r')
            ->field($this->article_field)
            ->join('article_cate rc', 'r.cate_id = rc.id')
            ->where($map)
            ->order('pub_time desc')
            ->limit((intval($page)-1)*$offset,$offset)
            ->select();
        return $data;
    }

    //关键字搜索文章
    public function frontArticleSearch($key='')
    {
        if($key!=''){
            $cateModel = new ArticleCateModel();
            $map['status']=1;
            $map['is_pub']=1;
            $map['title']=['like','%'.$key.'%'];
            $whereOr['content']=['like','%'.$key.'%'];
            return $this->where($map)->whereOr($whereOr)->order('pub_time desc')->select();
        }
    }

}