var t;

t=outlookbar.addtitle('修改密码')
outlookbar.additem('密码修改',t,'/cosmetic/admin/userinfo/userPw.jsp')

t=outlookbar.addtitle('用户管理')
outlookbar.additem('用户管理',t,'/cosmetic/userMana.action')

t=outlookbar.addtitle('商品类别')
outlookbar.additem('类别管理',t,'/cosmetic/catelogMana.action')
outlookbar.additem('添加类别',t,'/cosmetic/admin/catelog/catelogAdd.jsp')

t=outlookbar.addtitle('商品管理')
outlookbar.additem('商品管理',t,'/cosmetic/goodsMana.action')

t=outlookbar.addtitle('订单管理')
outlookbar.additem('订单管理',t,'/cosmetic/xiaoshouMine.action')
outlookbar.additem('订单统计',t,'/cosmetic/admin/xiaoshou/tongji.jsp')

t=outlookbar.addtitle('留言管理')
outlookbar.additem('留言管理',t,'/cosmetic/liuyanMana.action')

t=outlookbar.addtitle('评价管理')
outlookbar.additem('评价管理',t,'/cosmetic/commentMana.action')

t=outlookbar.addtitle('退出系统') 
outlookbar.additem('安全退出',t,'/cosmetic/login.jsp')