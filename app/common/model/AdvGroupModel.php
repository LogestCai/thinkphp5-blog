<?php
/**
 * User        : 青草根
 * Email       : caimh0223@163.com
 * Blog        : http://52qcg.cn
 * Date        : 2019.11.06
 * Time        : 12:19
 * Description : ********
 */

namespace app\common\model;


use think\Model;

class AdvGroupModel extends Model
{
    protected $name = 'adv_group';
    public function index()
    {
        return $this->select();
    }
}