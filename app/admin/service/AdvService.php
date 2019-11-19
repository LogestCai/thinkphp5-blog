<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.11.06
 * Time        : 9:03
 * Description : ********
 */
namespace app\admin\service;

use app\common\model\AdvGroupModel;
use app\common\model\AdvModel;
use think\Db;

class AdvService extends BaseService
{
    protected $_model=null;
    public function _initialize()
    {
        $this->_model=new AdvModel();
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function index()
    {
        $param = [];
        if(request()->isPost())
        {
            $param = input('post.');

        }
        return $this->_model->index($param);
    }

    public function add()
    {
        if(request()->isPost())
        {
            $param = [];
            $data= input('post.');
            $param['title']       = isset($data['title']) ? $data['title']:'';
            $param['link_url']    = isset($data['link_url']) ? $data['link_url']:'';
            $param['group']       = isset($data['group']) ? intval($data['group']):'';
            $param['type']        = isset($data['type']) ? intval($data['type']):'';
            $param['img_url']     = isset($data['img_url']) ? $data['img_url'] :'';
            $param['description'] = isset($data['description']) ? $data['description'] :'';
            $param['start_time']  = isset($data['start_time']) ? str_replace('+',' ',$data['start_time']) :'';
            $param['expir_time']  = isset($data['expir_time']) ? str_replace('+',' ',$data['expir_time']) :'';

            if(strtotime($param['start_time'])>=strtotime($param['expir_time']))
            {
                return json(['code'=>100,'msg'=>'起始时间不能大于结束时间！','data'=>[
                    'start'=>strtotime($param['start_time']),
                    'start_time'=>$param['start_time'],
                    'end'=>strtotime($param['expir_time']),
                    'end-time'=>$param['expir_time']]]);
            }

            if(isset($data['id'])&&$data['id']!='')//修改操作
            {
                $param['id'] = $data['id'];
                $param['update_time'] = date('Y-m-d H:i:s');
                $res = Db::name('adv')->where(['id'=>$param['id']])->update($param);
                if($res){
                    return json(['code'=>200,'msg'=>'修改广告成功！','data'=>'']);
                }else{
                    return json(['code'=>100,'msg'=>'修改广告出错了，请稍后重试！','data'=>'']);
                }
            }
            else //添加操作
            {
                $param['create_time'] = date('Y-m-d H:i:s');
                $param['update_time'] = date('Y-m-d H:i:s');
                $param['status'] = 1;
                $db = Db::name('adv');
                $res = $db->insertGetId($param);
                if($res>0){
                    return json(['code'=>200,'msg'=>'添加广告成功！','data'=>'']);
                }else{
                    return json(['code'=>100,'msg'=>'添加广告出错了，请稍后重试！','data'=>'']);
                }
            }

        }
        $id = request()->route('id');
        return db('adv')->find($id);
    }



    public function del()
    {
        if(request()->isPost())
        {
            $id = input('id');
            $res = db('adv')->where(['id'=>$id])->update(['status'=>0]);
            if($res){
                return json(['code'=>200,'msg'=>'删除广告成功！','data'=>'']);
            }else{
                return json(['code'=>100,'msg'=>'删除广告失败！','data'=>'']);
            }
        }
    }
}