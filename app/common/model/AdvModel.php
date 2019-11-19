<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.11.06
 * Time        : 12:11
 * Description : ********
 */

namespace app\common\model;
use think\Model;
use think\Db;

class AdvModel extends Model
{
    //protected $name = 'adv';
    public function index($map=[])
    {
        $map['status']=1;
        //return $this->select();
        return Db::name('adv')->alias('a')->join('adv_group b','a.group=b.id')->field('a.id,a.title,b.name group_name,a.id,a.description,a.img_url,link_url,type,create_time,update_time,expir_time,status')->where($map)->order('a.create_time desc')->paginate();
    }
}