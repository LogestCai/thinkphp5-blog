<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
//Route::rule('路由表达式','路由地址','请求类型POST|GET','路由参数（数组）','变量规则（数组）');
//Route::get('/','admin/index/index');//登录页面
Route::get('l','admin/login/index');//登录页面
Route::get('a','admin/index/index');
Route::rule('article','admin/article/index','GET');//文章列表
Route::rule('add_article/[:id]','admin/article/add_article','POST|GET',['id'=>'\d+']);//文章添加
Route::rule('edit_article','admin/article/edit_article','POST|GET');//文章修改
Route::rule('del_article','admin/article/del_article','POST');//文章删除
route::rule('upLoadThumbImg','admin/article/upLoadThumbImg','POST');//上传缩略图
route::rule('uploadFile','admin/article/uploadFile','POST');//编辑器中上传图片
route::rule('change_pub_status','admin/article/change_pub_status','POST');//文章发布状态更改
route::rule('change_img_status','admin/article/change_img_status','POST');//文章图片状态更改
route::rule('change_hot_status','admin/article/change_hot_status','POST');//文章热门状态更改
route::rule('change_tui_status','admin/article/change_tui_status','POST');//文章推荐状态更改
Route::rule('index_cate','admin/article/index_cate','POST|GET');//分类列表
Route::rule('add_cate/[:id]','admin/article/add_cate','POST|GET',['id'=>'\d+']);//分类添加
Route::rule('edit_cate','admin/article/edit_cate','POST|GET');//分类删除
Route::rule('del_cate','admin/article/del_cate','POST');//分类删除
Route::rule('user','admin/user/index','POST|GET');
Route::rule('checkVerify','admin/login/checkVerify','GET');
Route::rule('indexPage','admin/Index/indexPage','GET');//首页
route::rule('getVerify','admin/Login/getVerify','GET');//获取验证码
route::rule('doLogin','admin/Login/doLogin','GET|POST');//登录提交
//广告路由
route::rule('adv','admin/adv/index','POST|GET');//后台广告列表
route::rule('adv_add/[:id]','admin/adv/add','POST|GET',['id'=>'\d+']);//添加修改
route::rule('adv_del','admin/adv/del','POST|GET');//广告删除
route::rule('adv_group','admin/advGroup/index','POST|GET');//后台广告分组设置
route::rule('adv_group_add','admin/advGroup/add','POST');//后台分组添加
route::rule('adv_group_del','admin/advGroup/del','POST|GET');//广告组删除
route::rule('clear','admin/index/clear','POST|GET');//清除缓存
route::rule('loginOut','admin/login/loginOut','POST|GET');//退出登录


//===============================================前端路由开始==========================================================
Route::rule('/','index/index/index','GET|POST');
Route::rule('/getpage','index/index/index_pst','POST');
//Route::get('/test','index/index/test');
//Route::get(':year/:month/:day/art-<id>-<name>','index/index/test',[],['id'=>'\d+']);
Route::rule('articles/:year/:month/:day/art-<article_id>','index/article/art_detail','GET',['article_id'=>'\d+','year'=>'\d+','month'=>'\d+','day'=>'\d+']);
Route::rule('artlist-<cate_id>','index/article/art_list','GET',['cate_id'=>'\d+']);
Route::rule('artsingle-<cate_id>','index/article/art_single','GET',['cate_id'=>'\d+']);
Route::rule('search/tag/:tag','index/search/tags','GET');
Route::rule('search/keys','index/search/keys','POST|GET');
//return [
////    '__pattern__' => [
////        'name' => '\w+',
////    ],
////    '[hello]'     => [
////        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
////        ':name' => ['index/hello', ['method' => 'post']],
////    ],
//    'l' => 'admin/login/index',
//    'a' => 'admin/index/index',
//];
