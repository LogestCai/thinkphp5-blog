<?php
/**
 * Created by PhpStorm.
 * User: Kevin
 * Date: 2018/8/2
 * Time: 22:30
 */
namespace app\admin\service;
use think\Controller;
use think\Db;
use org\Verify;
use com\Geetestlib;
use app\common\model\UserType;
class LoginService extends Controller
{

    /**
     * 生成验证码
     * @return mixed
     */
    public function checkVerify()
    {
        $config =    [
            'imageH' => 38,// 验证码图片高度
            'imageW' => 120,// 验证码图片宽度
            'codeSet' => '02345689',// 验证码字符集合
            'useZh' => false,//使用中文验证码
            'length' => 4,// 验证码位数
            'useNoise' => true,//是否添加杂点
            'useCurve' => false,//是否画混淆曲线
            'useImgBg' => false,//使用背景图片
            'fontSize' => 16// 验证码字体大小(px)
        ];
        $verify = new Verify($config);
        return $verify->entry();
    }

    /**
     * 极验验证
     */
    public function getVerify()
    {
        $GtSdk = new Geetestlib(config('gee.gee_id'), config('gee.gee_key'));
        $user_id = "web";
        $status = $GtSdk->pre_process($user_id);
        session('gtserver',$status);
        session('user_id',$user_id);
        echo $GtSdk->get_response_str();
    }

    /**
     * 验证验证码
     * @return \think\response\Json
     */
    public function doLogin()
    {
        $username = input("param.username");
        $password = input("param.password");
        $verify = new Verify();
        if (config('verify_type') == 1) {
            $code = input("param.vercode");
            if (!$verify->check($code)) {
                return json(['code' => -4, 'url' => '', 'msg' => '验证码错误']);
            }
            return  $this->checkAdmin($username,$password);
        }elseif (config('verify_type') == 2) {
            $GtSdk = new Geetestlib(config('gee.gee_id'), config('gee.gee_key'));
            $user_id = session('user_id');
            if (session('gtserver') == 1) {
                $result = $GtSdk->success_validate(input('param.geetest_challenge'), input('param.geetest_validate'), input('param.geetest_seccode'), $user_id);
                //极验服务器状态正常的二次验证接口
                if (!$result) {
                    return json(['code' => -3, 'url' => '', 'msg' => '请先拖动图片到相应位置']);
                }
            }else{
                if (!$GtSdk->fail_validate(input('param.geetest_challenge'), input('param.geetest_validate'), input('param.geetest_seccode'))) {
                    //极验服务器状态宕机的二次验证接口
                    return json(['code' => -3, 'url' => '', 'msg' => '请先拖动图片到相应位置']);
                }
            }
            return  $this->checkAdmin($username,$password);
        }else{
            return  $this->checkAdmin($username,$password);
        }
    }

    /**
     * 验证帐号和密码
     * @param $username
     * @param $password
     * @return \think\response\Json
     */
    public function checkAdmin($username,$password){
        $hasUser = Db::name('admin a')
            ->join('auth_group ag','a.groupid=ag.id','left')
            ->where('username', $username)
            ->field('a.id,a.username,a.password,a.portrait,a.phone,a.loginnum,a.last_login_ip,a.last_login_time,a.real_name,a.status,a.groupid,ag.id agid,ag.title,ag.status ags')
            ->find();
        if(empty($hasUser)){
            return json(['code' => -1, 'url' => '', 'msg' => '管理员不存在']);
        }

        $config = api('Config/lists');
        if($config['web_site_close'] == 0 && $hasUser['id'] !=1 ){
            $this->error('后台已经关闭，请稍后访问');
            return json(['code' => -7, 'url' => '', 'msg' =>'后台已经关闭，请稍后访问']);
        }
        if($config['admin_allow_ip'] && $hasUser['id'] !=1 ){
            if(in_array(request()->ip(),explode(',',$config['admin_allow_ip']))){
                return json(['code' => -8, 'url' => '', 'msg' =>'IP禁止访问']);
            }
        }

        if(md5(md5($password) . config('auth_key')) != $hasUser['password']){
            writelog('管理员【'.$username.'】登录失败：密码错误',100,$hasUser['id'] , $username);
            return json(['code' => -2, 'url' => '', 'msg' => '密码错误']);
        }

        if(1 != $hasUser['status']){
            writelog('管理员【'.$username.'】登录失败：该账号被禁用',100,$hasUser['id'], $username);
            return json(['code' => -5, 'url' => '', 'msg' => '抱歉，该账号被禁用']);
        }
        if($hasUser['ags'] == 2){
            writelog('管理员【'.$username.'】登录失败：'.$hasUser['title'].'身份被禁用',100,$hasUser['id'], $username);
            return json(['code' => -6, 'url' => '', 'msg' =>'抱歉，'.$hasUser['title'].'身份被禁用']);
        }

        if($hasUser['ags'] == null){
            writelog('管理员【'.$username.'】登录失败：所属身份不存在',100,$hasUser['id'],$username);
            return json(['code' => -7, 'url' => '', 'msg' =>'抱歉，所属身份不存在']);
        }

        //获取该管理员的角色信息
        $user = new UserType();
        $info = $user->getRoleInfo($hasUser['groupid']);

        session('uid', $hasUser['id']);             //用户ID
        session('username', $hasUser['username']);  //用户名
        session('portrait', $hasUser['portrait']);  //用户头像
        session('phone', $hasUser['phone']);        //手机号
        session('agid', $hasUser['agid']);          //角色id
        session('rolename', $info['title']);        //角色名
        session('describe', $info['describe']);     //角色描述
        session('rule', $info['rules']);            //角色节点
        session('name', $info['name']);             //角色权限
        session('last_time',time());                //角色登录时间点

        //更新管理员状态
        $param = [
            'loginnum' => $hasUser['loginnum'] + 1,
            'last_login_ip' => request()->ip(),
            'last_login_time' => time()
        ];

        Db::name('admin')->where('id', $hasUser['id'])->update($param);
        writelog('管理员【'.session('username').'】登录成功',200);
        return json(['code' => 1, 'url' => url('admin/index/index'), 'msg' => '登录成功！']);
    }

    /**
     * 退出登录
     */
    public function loginOut()
    {
        writelog('退出登录',200);
        session(null);
        cache('db_config_data',null);
        $this->redirect(url('admin/index/index'));
    }
}