<?php

namespace app\admin\Service;
use app\common\model\ArticleModel;
use app\common\model\ArticleCateModel;
use app\admin\service\BaseService;
use think\Db;
use org\Qiniu;

class ArticleService extends BaseService
{
    /**
     * [index 文章列表]
     * @author
     */
    public function index(){
        $map = ['r.status'=>1];
        $od  = ' r.create_time desc ';
        if(request()->isPost ()){
            extract(input());
            $map = [];
            if(isset($key)&&$key!=""){
                $map['r.title'] = ['like',"%" . $key . "%"];
            }
            if(isset($start)&&$start!=""&&isset($end)&&$end=="")
            {
                $map['r.create_time'] = ['>= time',$start];
            }
            if(isset($end)&&$end!=""&&isset($start)&&$start=="")
            {
                $map['r.create_time'] = ['<= time',$end];
            }
            if(isset($start)&&$start!=""&&isset($end)&&$end!="")
            {
                $map['r.create_time'] = ['between time',[$start,$end]];
            }
            $field=input('field');//字段
            $order=input('order');//排序方式
            if($field && $order){
                $od="r.".$field." ".$order;
            }else{
                $od="r.create_time desc";
            }
        }
        $article = new ArticleModel();
        $lists = $article->getArticleByWhere($map, $od);
        for($i=0;$i<count($lists);$i++){
            $photo = explode(',',$lists[$i]['photo']);
            $lists[$i]['photo'] = array_values($photo);
        }
        return $lists;
    }

    //tableSelect测试数据
    public function getUserData(){
        if(request()->isGet ()){
            extract(input());
            $map = [];
            if(isset($keyword)&&$keyword!=""){
                $map['name'] = ['like',"%" . $keyword . "%"];
            }
            $Nowpage = input('get.page') ? input('get.page'):1;
            $limits = input("limit")?input("limit"):10;
            $count = Db::name('test')->where($map)->count();//计算总页面
            $lists = Db::name('test')
                ->where($map)
                ->page($Nowpage,$limits)
                ->select();
            return json(['code'=>220,'msg'=>'','count'=>$count,'data'=>$lists]);
        }
        if(request()->isPost ()){
            $data = Db::name('test')
                ->where('id','in',input('id'))
                ->select();
            return json(['code'=>200,'data'=>$data]);
        }
    }

//    public function insertData(){
//        set_time_limit (0);
//        for($i=0;$i<100000;$i++){
//            $param = ['name'=>'kevin'.($i+1)];
//            Db::name('test')->insert($param);
//        }
//    }


    /**
     * [add_article 添加文章]
     * @return [type] [description]
     * @author
     */
    public function add_article()
    {
        if(request()->isPost()){

            $data = input('post.');
            $param = [];
            //拼凑表单数据
            $param['title']       = isset($data['title']) ? $data['title'] : '';
            $param['cate_id']     = isset($data['cate_id']) ? intval($data['cate_id']) : 1;
            $param['views']       = isset($data['views']) ? intval($data['views']) : 50;
            $param['orderby']     = isset($data['orderby']) ? $data['orderby'] : 10;
            $param['writer']      = isset($data['writer']) ? $data['writer'] : '';
            $param['is_tui']      = isset($data['is_tui']) ? $data['is_tui'] : 0;
            $param['photo']       = (isset($data['thumb_img'])&&$data['thumb_img']!='') ? trim($data['thumb_img'],',') : '';
            $param['ora_content'] = isset($data['test-editor-markdown-doc']) ? $data['test-editor-markdown-doc'] : '';
            $param['content']     = isset($data['test-editor-html-code']) ? $data['test-editor-html-code'] : '';
            $param['is_hot']      = isset($data['is_hot']) ? intval($data['is_hot']) : 0;
            $param['is_img']      = isset($data['is_img']) ? intval($data['is_img']) : 0;
            $param['tags']        = isset($data['tags']) ? $data['tags'] : '';
            $param['status']      = 1;
            $param['is_pub']      = 0;
            $param['create_time'] = date('Y-m-d H:i:s');
            $param['update_time'] = date('Y-m-d H:i:s');
            //$param['pub_time']    = date('Y-m-d H:i:s');
            $article = new ArticleModel();
            if(isset($data['id']))
            {
                $param['id'] = $data['id'];
                unset($param['status']);
                unset($param['is_pub']);
                unset($param['status']);
                unset($param['create_time']);
                $flag = $article->updateArticle($param);//修改数据模型
            }else{

                $flag = $article->insertArticle($param);//添加数据模型
            }

            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
    }


    //获取一个文章记录
    public function getOneArticle($id)
    {
        $model = new ArticleModel();
        return $model->getOneArticle($id);
    }

    //获取tags
    public function getArticleTagsById($article_id)
    {
        $model = new ArticleModel();
        return $model->getArticleTagsById($article_id);
    }
    /**
     * [edit_article 编辑文章]
     * @return [type] [description]
     * @author
     */
    public function edit_article()
    {
        $article = new ArticleModel();
        if(request()->isPost()){
            $param = input('post.');
            $param['photo'] = trim($param['photo'],',');
            $flag = $article->updateArticle($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $cate = new ArticleCateModel();
        $data = $article->getOneArticle($id);
        if(!empty($data['photo'])){
            $data['photo'] = trim($data['photo'],',');
//            $img = explode(',',$data['photo']);
//            foreach($img as $vo){
//                $photo[] = '/uploads/images/'.$vo;
//            }
            $data['imges'] = $data['photo'];
        }else{
            $data['photo'] = '';
            $data['imges'] = '';
        }
        $this->assign('cate',$cate->getCate());
        $this->assign('article',$data);
        return $this->fetch();
    }

    /**
     * [del_article 删除文章]
     * @return [type] [description]
     * @author
     */
    public function del_article()
    {
        $id = input('id');
        $cate = new ArticleModel();
        $flag = $cate->delArticle($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    //更改发布状态
    public function change_article_pub_status()
    {
        if(request()->isPost())
        {
            $param = input();
            $param[$param['field']]=$param['status'];
            unset($param['field']);
            unset($param['status']);
            $id = isset($param['id']) ? $param['id'] : 0;
            if($param['is_pub']!=''){
                if($param['is_pub']==1){
                    $msg = '取消发布';
                    $param['is_pub']=0;
                }else{
                    $msg = '发布';
                    $param['is_pub']=1;
                }
                $model = new ArticleModel();
                $rst = $model->articleState($id,['is_pub'=>intval($param['is_pub']),'pub_time'=>date('Y-m-d H:i:s')]);
                if($rst['code']==200)
                {
                    return json(['code'=>200,'msg'=>$msg.'成功！','data'=>$rst['data']]);
                }else{
                    return json(['code'=>100,'msg'=>$msg.'失败！','data'=>'']);
                }
            }
        }
        return json(['code'=>100,'msg'=>'请求类型错误','data'=>'']);

    }
    //更改图片状态
    public function change_article_img_status()
    {
        if(request()->isPost())
        {
            $param = input();
            $param[$param['field']]=$param['status'];
            unset($param['field']);
            unset($param['status']);
            $id = isset($param['id']) ? $param['id'] : 0;
            if($param['is_img']!=''){
                if($param['is_img']==1){
                    $msg = '取消图片';
                    $param['is_img']=0;
                }else{
                    $msg = '设置图片';
                    $param['is_img']=1;
                }
                $model = new ArticleModel();
                $rst = $model->articleState($id,['is_img'=>intval($param['is_img'])]);
                if($rst['code']==200)
                {
                    return json(['code'=>200,'msg'=>$msg.'成功！','data'=>$rst['data']]);
                }else{
                    return json(['code'=>100,'msg'=>$msg.'失败！','data'=>'']);
                }
            }
        }
        return json(['code'=>100,'msg'=>'请求类型错误','data'=>'']);

    }
    //更改推荐状态
    public function change_article_tui_status()
    {
        if(request()->isPost())
        {
            $param = input();
            $param[$param['field']]=$param['status'];
            unset($param['field']);
            unset($param['status']);
            $id = isset($param['id']) ? $param['id'] : 0;
            if($param['is_tui']!=''){
                if($param['is_tui']==1){
                    $msg = '取消推荐';
                    $param['is_tui']=0;
                }else{
                    $msg = '设置推荐';
                    $param['is_tui']=1;
                }
                $model = new ArticleModel();
                $rst = $model->articleState($id,['is_tui'=>intval($param['is_tui'])]);
                if($rst['code']==200)
                {
                    return json(['code'=>200,'msg'=>$msg.'成功！','data'=>$rst['data']]);
                }else{
                    return json(['code'=>100,'msg'=>$msg.'失败！','data'=>'']);
                }
            }
        }
        return json(['code'=>100,'msg'=>'请求类型错误','data'=>'']);

    }
    //更改热门状态
    public function change_article_hot_status()
    {
        if(request()->isPost())
        {
            $param = input();
            $id = isset($param['id']) ? $param['id'] : 0;
            $param[$param['field']]=$param['status'];
            unset($param['field']);
            unset($param['status']);
            if($param['is_hot']!=''){
                if($param['is_hot']==1){
                    $msg = '取消热门';
                    $param['is_hot']=0;
                }else{
                    $msg = '设置热门';
                    $param['is_hot']=1;
                }
                $model = new ArticleModel();
                $rst = $model->articleState($id,['is_hot'=>intval($param['is_hot'])]);
                if($rst['code']==200)
                {
                    return json(['code'=>200,'msg'=>$msg.'成功！','data'=>$rst['data']]);
                }else{
                    return json(['code'=>100,'msg'=>$msg.'失败！','data'=>'']);
                }
            }
        }
        return json(['code'=>100,'msg'=>'请求类型错误','data'=>'']);

    }

    /**
     * [article_state 文章状态]
     * @return [type] [description]
     * @author
     */
    public function article_state()
    {
        extract(input());
        $cate = new ArticleModel();
        $flag = $cate->articleState($id,$num);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }
    /**
     * batchDelArticle 批量删除文章
     * @return \think\response\Json
     */
    public function batchDelArticle(){
        extract(input());
        if(empty($ids)){
            return json(['code'=>100,'msg'=>'请选择要删除的记录！']);
        }
        $article = new ArticleModel();
        $flag = $article->batchDelArticle($ids);
        return json(['code' => $flag['code'], 'msg' => $flag['msg']]);
    }

    /**
     * 批量启用文章
     * @return \think\response\Json
     */
    public function usingArticle(){
        extract(input());
        $list = [];
        if($ids){
            $ids = explode(',',$ids);
            for($i=0;$i<count($ids);$i++){
                $param = [
                    'id'=>$ids[$i],
                    'status'=>1
                ];
                $list[] = $param;
            }
        }
        $article = new ArticleModel();
        $flag = $article->usingArticle($list);
        return json(['code' => $flag['code'], 'msg' => $flag['msg']]);
    }

    /**
     * 批量禁用文章
     * @return \think\response\Json
     */
    public function forbiddenArticle(){
        extract(input());
        $list = [];
        if($ids){
            $ids = explode(',',$ids);
            for($i=0;$i<count($ids);$i++){
                $param = [
                    'id'=>$ids[$i],
                    'status'=>2
                ];
                $list[] = $param;
            }
        }
        $article = new ArticleModel();
        $flag = $article->forbiddenArticle($list);
        return json(['code' => $flag['code'], 'msg' => $flag['msg']]);
    }




    //*********************************************分类管理*********************************************//

    /**
     * [index_cate 分类列表]
     * @return [type] [description]
     * @author
     */
    public function index_cate(){
        if(request()->isPost ()){
            extract(input());
            $map = [];
            if(isset($key)&&$key!=""){
                $map['name'] = ['like',"%" . $key . "%"];
            }
            if(isset($start)&&$start!=""&&isset($end)&&$end=="")
            {
                $map['create_time'] = ['>= time',$start];
            }
            if(isset($end)&&$end!=""&&isset($start)&&$start=="")
            {
                $map['create_time'] = ['<= time',$end];
            }
            if(isset($start)&&$start!=""&&isset($end)&&$end!="")
            {
                $map['create_time'] = ['between time',[$start,$end]];
            }
            $field=input('field');//字段
            $order=input('order');//排序方式
            if($field && $order){
                $od=$field." ".$order;
            }else{
                $od="create_time desc";
            }
            $cate = new ArticleCateModel();
            $nowpage = input('get.page') ? input('get.page'):1;
            $limits  = input("limit")?input("limit"):10;
            $count   = $cate->getAllCount($map);//计算总页面
            $lists   = $cate->getAllCate($map, $nowpage, $limits,$od);
            return json(['code'=>0,'msg'=>'','count'=>$count,'data'=>$lists]);
        }
        return F_getTreeWithoutChild(db('article_cate')->where(['status'=>1])->order('orderby asc')->select());
    }


    /**
     * [add_cate 添加分类]
     * @return [type] [description]
     * @author
     */
    public function add_cate()
    {
        if(request()->isPost()){
            extract(input());
            $param = [];
            $data = input('post.');
            $cate = new ArticleCateModel();
            $param['name'] = isset($data['name']) ? $data['name'] : '';
            $param['ora_content'] = isset($data['test-editor-markdown-doc']) ? $data['test-editor-markdown-doc'] : '';
            $param['content']     = isset($data['test-editor-html-code']) ? $data['test-editor-html-code'] : '';
            $param['views']       = isset($data['views']) ? intval($data['views']) : 0;
            $param['orderby']     = isset($data['orderby']) ? intval($data['orderby']) : 0;
            $param['pid']         = isset($data['pid']) ? intval($data['pid']) : 0;
            $param['is_suggest']  = isset($data['is_suggest']) ? intval($data['is_suggest']) : 0;
            $param['type']  = isset($data['type']) ? intval($data['type']) : 1;
            $param['keywords']    = isset($data['keywords']) ? $data['keywords'] : '';
            $param['status']      = 1;
            $param['create_time'] = time();
            $param['update_time'] = time();
            //$param['pub_time']    = date('Y-m-d H:i:s');
            if($param['pid']!=0)
            {
                //处理栏目级别
                $param['level']   = db('article_cate')->where('id',$param['pid'])->value('level')+1;
            }

            if(isset($data['id']))
            {
                $param['id'] = $data['id'];
                unset($param['status']);
                unset($param['create_time']);
                $flag = $cate->editCate($param);//修改数据模型
            }else{

                $flag = $cate->insertCate($param);//添加数据模型
            }

            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

    }




    /**
     * [del_cate 删除分类]
     * @return [type] [description]
     * @author
     */
    public function del_cate()
    {
        $id = input('id');
        $cate = new ArticleCateModel();
        $flag = $cate->delCate($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }


    public function getOneCate($id)
    {
        return db('article_cate')->where(['id'=>$id])->find();
    }



    public function printOrder()
    {
        return $this->fetch('article/order');
    }
}