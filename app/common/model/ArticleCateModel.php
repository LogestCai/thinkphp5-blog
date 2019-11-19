<?php

namespace app\common\model;
use think\Model;
use think\Db;

class ArticleCateModel extends Model
{
    protected $name = 'article_cate';
    
    // 开启自动写入时间戳
    protected $autoWriteTimestamp = true;


    /**
     * [getAllCate 获取全部分类]
     * @author
     */
    public function getAllCate($map, $Nowpage, $limits,$od)
    {
        return $this->where($map)->page($Nowpage, $limits)->order($od)->select();
    }

    /**
     * [getCate 获取全部分类]
     * @author
     */
    public function getCate()
    {
        return $this->where(['status'=>1])->order('create_time desc')->select();
    }

    /**
     * 根据条件获取所有配置信息数量
     * @param $map
     */
    public function getAllCount($map)
    {
        return $this->where($map)->count();
    }

    /**
     * [insertCate 添加分类]
     * @author
     */
    public function insertCate($param)
    {
        Db::startTrans();// 启动事务
        try{
            $this->save($param);
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章分类【'.$param['name'].'】添加成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '分类添加成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章分类【'.$param['name'].'】添加失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '分类添加失败'];
        }
    }



    /**
     * [editMenu 编辑分类]
     * @author
     */
    public function editCate($param)
    {
        Db::startTrans();// 启动事务
        try{
            $this->save($param, ['id' => $param['id']]);
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章分类【'.$param['name'].'】编辑成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '分类编辑成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章分类【'.$param['name'].'】编辑失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '分类编辑失败'];
        }
    }



    /**
     * [getOneMenu 根据分类id获取一条信息]
     * @return [type] [description]
     * @author
     */
    public function getOneCate($id)
    {
        return $this->where(['id'=>$id,'status'=>1])->find();
    }



    /**
     * [delMenu 删除分类]
     * @return [type] [description]
     * @author
     */
    public function delCate($id)
    {
        $name = $this->where('id',$id)->value('name');
        Db::startTrans();// 启动事务
        try{
            $this->where(['id'=>$id])->update(['status'=>0]);
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章分类【'.$name.'】删除成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '分类删除成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章分类【'.$name.'】删除失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '分类删除失败'];
        }
    }

    /**
     * batchDelCate 批量删除文章分类
     * @param $param
     * @return array
     */
    public function batchDelCate($param){
        Db::startTrans();// 启动事务
        try{
            ArticleCateModel::destroy($param);
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'文章分类批量删除成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量删除成功'];
        }catch( \Exception $e){
            Db::rollback();// 回滚事务
            writelog(session('uid'),session('username'),'文章分类批量删除失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '批量删除失败'];
        }
    }

    /**
     * [cateState 文章分类状态]
     * @param $param
     * @return array
     */
    public function cateState($id,$num)
    {
        $name = Db::name('article_cate')->where(['id'=>$id])->value('name');//判断当前状态情况
        if($num == 2){
            $msg = '禁用';
        }else{
            $msg = '启用';
        }
        Db::startTrans();// 启动事务
        try {
            $this->where ('id' , $id)->setField (['status' => $num]);
            Db::commit();// 提交事务
            writelog (session ('uid') , session ('username') , '文章分类【' . $name . '】'.$msg.'成功' , 1);
//                return ['code' => 200 , 'data' => '' , 'msg' => '已'.$msg];
        } catch (\Exception $e) {
            Db::rollback();// 回滚事务
            writelog (session ('uid') , session ('username') , '文章分类【' . $name . '】'.$msg.'失败' , 2);
            return ['code' => 100 , 'data' => '' , 'msg' => $msg.'失败'];
        }
    }

    /**
     * 批量禁用分类
     * @param $param
     * @return array
     */
    public function forbiddenCate($param){
        Db::startTrans();// 启动事务
        try{
            if($param){
                $this->saveAll($param);
            }else{
                $this->where('1=1')->update(['status'=>2]);
            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'批量禁用文章分类成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量禁用成功'];
        }catch( \Exception $e){
            Db::rollback ();//回滚事务
            writelog(session('uid'),session('username'),'批量禁用文章分类失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '批量禁用失败'];
        }
    }

    /**
     * 批量启用分类
     * @param $param
     * @return array
     */
    public function usingCate($param){
        Db::startTrans();// 启动事务
        try{
            if($param){
                $this->saveAll($param);
            }else{
                $this->where('1=1')->update(['status'=>1]);
            }
            Db::commit();// 提交事务
            writelog(session('uid'),session('username'),'批量启用文章分类成功',1);
            return ['code' => 200, 'data' => '', 'msg' => '批量启用成功'];
        }catch( \Exception $e){
            Db::rollback ();//回滚事务
            writelog(session('uid'),session('username'),'批量启用文章分类失败',2);
            return ['code' => 100, 'data' => '', 'msg' => '批量启用失败'];
        }
    }


    //==============================前端项目模型开始========================================

    /**根据栏目id 获取所有子id
     * @param int $cateid
     * @return string 1,2,3,4
     */
    public function getCateChildrenIds($cateid=0)
    {
        $cateres=$this->select();
        $arr=$this->_getchilrenid($cateres,$cateid);
        $arr[]=$cateid;
        $strId=implode(',', $arr);
        return $strId;
    }

    public function _getchilrenid($cateres,$cateid){
        static $arr=array();
        foreach ($cateres as $k => $v) {
            if($v['pid'] == $cateid){
                $arr[]=$v['id'];
                $this->_getchilrenid($cateres,$v['id']);
            }
        }
        return $arr;
    }

    /**获取该栏目的所有父节点
     * @param $cateid
     * @return array
     */
    public function getParents($cateid){
        $cateres=$this->field('id,pid,name,type')->select();
        $cates=db('article_cate')->field('id,pid,name,type')->find($cateid);
        $pid=$cates['pid'];
        if($pid){
            $arr=$this->_getparentsid($cateres,$pid);
        }
        $arr[]=$cates;
        return $arr;
    }

    public function _getparentsid($cateres,$pid){
        static $arr=array();
        foreach ($cateres as $k => $v) {
            if($v['id'] == $pid){
                $arr[]=$v;
                $this->_getparentsid($cateres,$v['pid']);
            }
        }

        return $arr;
    }

    //==============================前端项目模型结束========================================

}