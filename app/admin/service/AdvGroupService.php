<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.11.06
 * Time        : 9:06
 * Description : ********
 */

namespace app\admin\service;

use app\common\model\AdvGroupModel;
use think\Db;

class AdvGroupService extends BaseService
{
    public function index($data=[])
    {
        $model = new AdvGroupModel();
        return $model->index();
    }

    public function add()
    {
        $param = [];
        $data = input('post.');
        if($data['id']!=''){
            $param['id']=intval($data['id']);
        }
        $param['name']=$data['name'];
        if($data['name']=='')
        {
            return json(['code'=>100,msg=>'分组名称不能为空！','data'=>'']);
        }else{
           // $advModel = new AdvGroupModel();
            $db = Db::name('adv_group');
            $db->insert($param,true);
            return json(['code'=>200,'msg'=>'成功！','data'=>['id'=>$db->getLastInsID(),'name'=>$param['name']]]);
        }
    }

    public function del()
    {
        $data = input('post.');
        $param['id'] = intval($data['id']);
        $res = db('adv_group')->delete($param['id']);
        if($res){
            return json(['code'=>200,'msg'=>'删除广告分组成功！','data'=>'']);
        }else{
            return json(['code'=>100,'msg'=>'删除广告分组失败！','data'=>'']);
        }
    }
}