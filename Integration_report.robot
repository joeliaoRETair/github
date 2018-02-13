# -*- coding:utf-8 -*-
*** Settings ***
#這裡的    report  Integration  測試   1.Behavior Analytics   : tracking  visit  2   Pixel Report
Force Tags     測試 report Integration
Library     ../lib/ICEMRobot.py   ${env}
Library     ../lib/ICEM_tracking.py   ${env}
Library     ../lib/ICEMDatabase.py    ${env}
Library     ../lib/ICEMIntegrated.py    ${env}

*** Variables ***


${admin_NAME}      admin
${admin_PASSWORD}    retchat1603
${admin_ROLE}     adminrole

${USER_NAME}   test_report
${PASSWORD}     123qwe
${ROLE}     contr
${SITE1}   report_site1
${CONTR_loginId}   test_report



${url_prefix}   http://icem.retair.com:10080/tracking/
${siteClick}      test_siteClick
${rec_DomId}    rec_rule1


${member1}    159_retuid_testrec1
${member2}     159_retuid_testrec2
${member3}   159_retuid_testrec3
${member4}    159_retuid_testrec4
${member5}   159_retuid_testrec5
${member6}   159_retuid_testrec6

${hard_retUid1}     159_retuid_testrec1
${hard_retUid2}     159_retuid_testrec2
${hard_retUid3}     159_retuid_testrec3
${hard_retUid4}     159_retuid_testrec4
${hard_retUid5}     159_retuid_testrec5
${hard_retUid6}     159_retuid_testrec6

${rec_content1}     pre_rec_content
${rec_items1}   rec_items1
${rec_items2}   rec_items2

${test1_rule}      test1
${test2_rule}      test2
${test1_content}    test1_rec_content
${test2_content}    test2_rec_content
${domid}     rec_rule1





${start_date}    20161210

${log1_cost_day}  0
${log2_cost_day}  0


${range_track1}   150
${range_retimpr1}    20
${range_retclk1}       10
${range_buy1}     5
${range_visitor1}   40

${range_track2}   200
${range_retimpr2}    80
${range_retclk2}       60
${range_buy2}     20
${range_visitor2}   200



${all_pixel_data_name}  All Pixel Data

#--------------------------EVENTAG----------------------
${eventag_sessionId}     pixelsssssessionId


${eventag_name10}    evenTag-test10
${eventag_name11}    evenTag-test11
${eventag_name12}    evenTag-test12
${eventag_name13}    evenTag-test13
${eventag_name14}    evenTag-test14


${cat_range_eventag-test10}      100
${cat_range_eventag-test11}      120
${cat_range_eventag-test12}      140
${cat_range_eventag-test13}      160
${cat_range_eventag-test14}      180

${catclk_range_eventag-test10}      40
${catclk_range_eventag-test11}      50
${catclk_range_eventag-test12}      60
${catclk_range_eventag-test13}      70
${catclk_range_eventag-test14}      80


${catcv_range_eventag-test10}    20
${catcv_range_eventag-test11}    30
${catcv_range_eventag-test12}    40
${catcv_range_eventag-test13}    50
${catcv_range_eventag-test14}    60

${cat_range_eventag-visitor}   100

##------------offsite

${ad}   testad
${group}   testgroup
${pixel_offsitename10}    Pixel-offsitetest10
${pixel_offsitename11}    Pixel-offsitetest11
${pixel_offsitename12}    Pixel-offsitetest12
${pixel_offsitename13}    Pixel-offsitetest13
${pixel_offsitename14}    Pixel-offsitetest14


${cat_range_offsitePixel-test10}      150
${cat_range_offsitePixel-test11}      70
${cat_range_offsitePixel-test12}      20
${cat_range_offsitePixel-test13}      30
${cat_range_offsitePixel-test14}      40

${catclk_range_offsitePixel-test10}      120
${catclk_range_offsitePixel-test11}      45
${catclk_range_offsitePixel-test12}      27
${catclk_range_offsitePixel-test13}      13
${catclk_range_offsitePixel-test14}      70


${catcv_range_offsitePixel-test10}    100
${catcv_range_offsitePixel-test11}    10
${catcv_range_offsitePixel-test12}    30
${catcv_range_offsitePixel-test13}    25
${catcv_range_offsitePixel-test14}    60

${cat_range_offsitePixel-visitor}   100
#－－－－－
${app}   WEB

#--------------------------pixel----------------------
${sleeptime}   180
${log_sleeptime}  30
${cassandra_sleeptime}  30
*** Test Cases ***
Add New Contractor
   [Documentation]  預先新增contractor
    ${login_response}=   login   ${admin_NAME}      ${admin_PASSWORD}    ${admin_ROLE}
    #contractor_delete  ${login_response}      ${CONTR_loginId}
    set_contractor    ${login_response}    ${USER_NAME}    paulr1@mail.com    ${USER_NAME}


Add contractor_site
    [Documentation]  預先新增site
     ${login_response}=   login   ${admin_NAME}      ${admin_PASSWORD}    ${admin_ROLE}
      contractor_site_add    ${login_response}   ${USER_NAME}   as1    http://www.tonylin1.idv.t2     192.168.5.10
      contractor_site_add    ${login_response}   ${USER_NAME}   as2     http://www.tonylin1.idv.tw/dokuwiki/do    192.168.5.10
      contractor_site_add    ${login_response}   ${USER_NAME}   as3     http://www.tonylin1.idv.tw/dokdo.php122  192.168.5.10
      contractor_site_add    ${login_response}   ${USER_NAME}  as4     http://www.tonylin1.idv.tw/dokuwiki/do.php99    192.168.5.10
      contractor_site_add    ${login_response}   ${USER_NAME}   as5     http://www.tonylin1.idv.tw/dokuwiki/do.php88     192.168.5.10
      contractor_site_add    ${login_response}   ${USER_NAME}  as6     http://www.tonylin1.idv.tw/dokuwiki/do.ph77p      192.168.5.10
     contractor_site_add    ${login_response}   ${USER_NAME}   ${SITE1}     http://www.tonylin1.idv.tw/dokuwiki/do.php  192.168.5.10


Reset Contractor Password
    [Documentation]  reset  password
    ${login_response}=   login   ${admin_NAME}      ${admin_PASSWORD}    ${admin_ROLE}
    ${reset_password}=   contractor reset password  ${login_response}     ${USER_NAME}
    ${login_response}=  login   ${USER_NAME}      ${reset_password}    contr
    USER_reset_password_new   ${login_response}     ${reset_password}     ${PASSWORD}       ${PASSWORD}



pre_add_members
     [Documentation]  預先新增member
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
     #member_add(self,login_response ,siteName,accountName,memberName,phoneNumber,email,remainpoint=0,totalpoint=0,customerValues=None)
     member_add     ${login_response}   ${SITE1}  ${member1}     ${member1}      0978455151   retchat2017@mail.com       1000   2000
     member_add     ${login_response}   ${SITE1}  ${member2}     ${member2}      0978455151   retchat20172@mail.com       1000   2000
     member_add     ${login_response}   ${SITE1}  ${member3}     ${member3}      0978455151   retchat20173@mail.com       1000   2000
     member_add     ${login_response}   ${SITE1}  ${member4}     ${member4}      0978455151   retchat20174@mail.com       1000   2000
     member_add     ${login_response}   ${SITE1}  ${member5}     ${member5}      0978455151   retchat20175@mail.com       1000   2000
     member_add     ${login_response}   ${SITE1}  ${member6}     ${member6}     0978455151   retchat20176@mail.com       1000   2000

pre_add_memberattribute
     [Documentation]  預先新增memberattribute,並配對給member
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
     ${value_options}   Create list      taiwan      japan   china
     member_Attribute_add   ${login_response}   ${SITE1}    where   ON    valueOptions=${value_options}
     member_Attribute_add   ${login_response}   ${SITE1}     workday   ON
     member_Attribute_add   ${login_response}   ${SITE1}     exerciseday   ON
      #member_add(self,login_response ,siteName,accountName,memberName,phoneNumber,email,remainpoint=0,totalpoint=0,customerValues=None)
     #example  format {cu1:[5,None] ; hj:[None,gogo]}--->'5' means random value, 'gogo ' means    specific  value
      #{customAttributeId: 51, attributeValue: null, valueOptionId: null}
     ${where_taiwan}  Create dictionary     customAttributeId=where      attributeValue=${None}    valueOptionId=taiwan
     ${where_janpan}  Create dictionary     customAttributeId=where     attributeValue=${None}    valueOptionId=japan
     ${where_china}  Create dictionary     customAttributeId=where     attributeValue=${None}    valueOptionId=china
     ${workday_8}   Create dictionary     customAttributeId=workday      attributeValue=8    valueOptionId=${None}
     ${workday_10}  Create dictionary     customAttributeId=workday      attributeValue=10    valueOptionId=${None}
     ${workday_12}  Create dictionary     customAttributeId=workday      attributeValue=12    valueOptionId=${None}
     ${workday_14}  Create dictionary     customAttributeId=workday      attributeValue=14    valueOptionId=${None}
     ${workday_16}  Create dictionary     customAttributeId=workday      attributeValue=16    valueOptionId=${None}
     ${workday_20}  Create dictionary     customAttributeId=workday      attributeValue=20    valueOptionId=${None}
     ${exerciseday_5}   Create dictionary     customAttributeId=exerciseday      attributeValue=5    valueOptionId=${None}
     ${exerciseday_4}   Create dictionary     customAttributeId=exerciseday      attributeValue=4     valueOptionId=${None}
     ${exerciseday_3}   Create dictionary     customAttributeId=exerciseday      attributeValue=3    valueOptionId=${None}
     ${exerciseday_2}   Create dictionary     customAttributeId=exerciseday      attributeValue=2    valueOptionId=${None}
     ${exerciseday_1}   Create dictionary     customAttributeId=exerciseday      attributeValue=1    valueOptionId=${None}
     ${exerciseday_0}   Create dictionary     customAttributeId=exerciseday      attributeValue=1     valueOptionId=${None}
     ${mb1}    Create list      ${where_taiwan}     ${workday_8}         ${exerciseday_5}
     ${mb2}    Create list      ${where_janpan}     ${workday_10}        ${exerciseday_4}
     ${mb3}    Create list      ${where_china}      ${workday_12}        ${exerciseday_3}
     ${mb4}    Create list      ${where_taiwan}     ${workday_14}        ${exerciseday_2}
     ${mb5}    Create list      ${where_janpan}     ${workday_16}        ${exerciseday_1}
     ${mb6}    Create list      ${where_china}      ${workday_20}        ${exerciseday_0}
     member_edit     ${login_response}   ${SITE1}   ${member1}     customerValues=${mb1}
     member_edit     ${login_response}   ${SITE1}   ${member2}      customerValues=${mb2}
     member_edit     ${login_response}   ${SITE1}   ${member3}      customerValues=${mb3}
     member_edit     ${login_response}   ${SITE1}   ${member4}      customerValues=${mb4}
     member_edit     ${login_response}   ${SITE1}   ${member5}      customerValues=${mb5}
     member_edit     ${login_response}   ${SITE1}   ${member6}      customerValues=${mb6}


update_cookiesync
     [Documentation]  更新 cookie sync,  進到資料庫修改  cookiesync
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${siteid}=   get_siteid_for_database    ${login_response}        ${SITE1}
    #insert_into_cookie_sync(self,connect,id,cookietype,memo,otherid,retuid,siteid)
    ${connect_post}=   cassandra_connect
    pg_get_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member1}
    #pg_get_icemmeta_data(self,connect,search_query)
    #${s}  Convert to String  SELECT * from icem_configuration where site_id=${siteid} and otherid=${member6}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member1}  3    ${hard_retUid1}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member1}  4    ${hard_retUid1}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member2}  3    ${hard_retUid2}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member2}  4    ${hard_retUid2}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member3}  3    ${hard_retUid3}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member3}  4    ${hard_retUid3}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member4}  3    ${hard_retUid4}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member4}  4    ${hard_retUid4}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member5}  3    ${hard_retUid5}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member5}  4    ${hard_retUid5}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member6}  3    ${hard_retUid6}
    pg_update_cookie_sync_retuid   ${connect_post}   ${siteid}     ${member6}  4    ${hard_retUid6}
    close_cassandra    ${connect_post}


pre_add_items
    [Documentation]   預先新增  item
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
     # item_add(self, login_response, siteName, itemcode, name, price, grouping, category ,  startDate, endDate
     item_add    ${login_response}    ${SITE1}    101   可樂   35   飲品   氣泡飲品  2016-07-01   2018-09-01    discount=35
     item_add    ${login_response}    ${SITE1}    102    MP3播放器    699    家電    娛樂    2016-07-01    2018-08-01     discount=699
     item_add    ${login_response}    ${SITE1}    103    舒眠枕頭    3000    家居    寢具    2016-01-20    2018-01-20       discount=3000
     item_add    ${login_response}    ${SITE1}    104    大人巧克力    500    食品    零嘴    2016-03-01    2018-09-01       discount=500
     item_add    ${login_response}    ${SITE1}    105    不沾鍋    21000    家居    廚具    2016-07-01    2018-07-02      discount=21000
     item_add    ${login_response}    ${SITE1}    106    限量福袋    100    特殊    促銷    2016-08-01    2018-08-01        discount=100
     item_add    ${login_response}    ${SITE1}    107    遊戲機    10500    家電    娛樂    2016-05-05    2018-09-28     discount=10500
     item_add    ${login_response}    ${SITE1}    108    舒跑    105    飲品    氣泡飲品    2016-05-05    2018-09-28      discount=105
     item_add    ${login_response}    ${SITE1}    109    筆電    30500    家電    娛樂    2016-05-05    2018-09-28        discount=30500
     item_add    ${login_response}    ${SITE1}    110    慢跑鞋    3050    鞋子    穿著    2016-05-05    2018-09-28        discount=3050
     item_add    ${login_response}    ${SITE1}    111     cookie111   35   飲品   氣泡飲品  2016-07-01   2018-09-01    discount=35
     item_add    ${login_response}    ${SITE1}    112     cookie112    699    家電    娛樂    2016-07-01    2018-08-01     discount=699
     item_add    ${login_response}    ${SITE1}    113     cookie113    300    家居    寢具    2016-01-20    2018-01-20       discount=300
     item_add    ${login_response}    ${SITE1}    114     cookie114    500    食品    零嘴    2016-03-01    2018-09-01       discount=500
     item_add    ${login_response}    ${SITE1}    115     cookie115    210    家居    廚具    2016-07-01    2018-07-02      discount=210
     item_add    ${login_response}    ${SITE1}    116     cookie116    100    特殊    促銷    2016-08-01    2018-08-01        discount=100
     item_add    ${login_response}    ${SITE1}    117     cookie117    1050    家電    娛樂    2016-05-05    2018-09-28     discount=1050
     item_add    ${login_response}    ${SITE1}    118     cookie118    105    飲品    氣泡飲品    2016-05-05    2018-09-28      discount=105
     item_add    ${login_response}    ${SITE1}    119     cookie119    3050    家電    娛樂    2016-05-05    2018-09-28        discount=3050
     item_add    ${login_response}    ${SITE1}    120     cookie120    305    鞋子    穿著    2016-05-05    2018-09-28        discount=305



add_itemlistcontent
    [Tags]
    ${login_response} =    login    ${USER_NAME}    ${PASSWORD}     ${ROLE}

    #itemGroupDetailVOs 格式  [{code:edit_i0111 ,score:10},{code:edit_i1111,score:75}]
    ${it1}  Create Dictionary       code=101    score=10
    ${it2}  Create Dictionary       code=102    score=40
    ${it3}  Create Dictionary       code=103    score=80
    ${it4}  Create Dictionary       code=104    score=20
    ${it5}  Create Dictionary       code=105    score=18
    ${it6}  Create Dictionary       code=106    score=48
    ${it7}  Create Dictionary       code=107    score=55
    ${it8}  Create Dictionary       code=108    score=155
    ${it9}  Create Dictionary       code=109    score=70
    ${it10}  Create Dictionary       code=110    score=70
    ${it11}  Create Dictionary       code=111    score=10
    ${it12}  Create Dictionary       code=112    score=10
    ${it13}  Create Dictionary       code=113    score=80
    ${it14}  Create Dictionary       code=114   score=80
    ${it15}  Create Dictionary       code=115    score=18
    ${it16}  Create Dictionary       code=116    score=18
    ${it17}  Create Dictionary       code=117    score=55
    ${it18}  Create Dictionary       code=118    score=55
    ${it19}  Create Dictionary       code=119    score=70
    ${it20}  Create Dictionary       code=120    score=70

    ${items1}   Create List      ${it1}      ${it3}    ${it5}    ${it7}   ${it9}   ${it11}      ${it13}    ${it15}    ${it17}   ${it19}
    ${items2}   Create List      ${it2}      ${it4}    ${it6}    ${it8}   ${it10}   ${it12}      ${it14}    ${it16}    ${it18}   ${it20}
    #rec_add_itemGroup(login_response, 'p4site1',itemGroupName,itemGroupDetailVOs,displayType="AUTO",memo=None,status='UNUSED'
    rec_add_itemGroup      ${login_response}   ${SITE1}     rec_items1      ${items1}      displayType=AUTO
    rec_add_itemGroup      ${login_response}   ${SITE1}     rec_items2      ${items2}      displayType=AUTO


pre_add_recommend_content
    [Documentation]  預先新增 recommend content
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    #rec_add_Content(self, login_response, siteName,name,itemhtml='i',memo=None,itemmemo=None)
    ${itemId}=  robot_str_plus_str   $    {itemId}
    ${code}=   robot_str_plus_str    $     {code}
    ${name}=   robot_str_plus_str    $    {name}
    rec_add_Content      ${login_response}    ${SITE1}     pre_rec_content    itemhtml=<html><a href=http://icem.retair.com:10080/site6_159/004.html> 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </a></html>
    rec_add_Content      ${login_response}    ${SITE1}     test1_rec_content    itemhtml=<html>test1 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </html>
    rec_add_Content      ${login_response}    ${SITE1}     test2_rec_content    itemhtml=<html>test2 商品id: ${itemId} itemcode :${code} 商品名稱: ${name} </html>


pre_add_recommendation
    [Documentation]   預先新增 recommendation
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    rec_add_Configuration   ${login_response}  ${SITE1}    test_recommendation   recommendType=ITEM_AUTO    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_rulebase   recommendType=RULE_BASE    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_item   recommendType=ITEM_AUTO    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_user   recommendType=USER_AUTO    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_ranking   recommendType=RANKING    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_history   recommendType=HISTORY_ORIENTED_AUTO    　　isLimit=${False}   displayNum=${None}       contentName=pre_rec_content   behaviorType=BROWSING
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_reminder   recommendType=REMINDER    　　isLimit=${False}   displayNum=${None}       contentName=pre_rec_content
    rec_add_Configuration   ${login_response}  ${SITE1}    rec_buy   recommendType=BUY_AFTER_VIEWING　　    isLimit=${False}   displayNum=${None}       contentName=pre_rec_content


add_recommendation_with_rule
     [Documentation]   預先新增  rule
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}   ${ROLE}
    #rec_add_Configuration_Rule(self,login_response,  siteName, confName,ruleName,contentName,itemGroupName=None,ruleMemo=None,visit=None,memberAttrs=None,dateAttr=None,channel_type="WEB",scoreOperator="EQUAL",score=0, scoreRuleName="",check_button ='OFF')
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_rulebase      r1         ${rec_content1}
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_item      r1          ${rec_content1}
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_user      r1          ${rec_content1}
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_ranking      r1           ${rec_content1}
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_history      r1          ${rec_content1}
    rec_add_Configuration_Rule   ${login_response}   ${SITE1}    rec_buy      r1           ${rec_content1}



pre_add_socrerule_no_require
    [Documentation]   預先新增   score rule
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${mb_value1}     Create Dictionary     memberCustomAttrName=where    memberCustomAttrValue=taiwan    operator=EQUAL   memberCustomAttrId=${None}
    ${mb_atr1}       Create List           ${mb_value1}
    rec_add_scorerule    ${login_response}    ${SITE1}  test_rec_require   ADD     33
  #rec_add_scorerule(self, login_response, siteName, name, rewardCalcOperator, rewardCalcValue, memo="", memberAttrs=None, referrer=None, request=None, dateAttr=None)
   rec_add_scorerule  ${login_response}    ${SITE1}     taiwan_rec_require    ADD     190        memberAttrs=${mb_atr1}


pre_add_TagTrack
    [Documentation]  預先  新增  Tag_track
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}   ${ROLE}
     #rec_add_TagTrack(self, login_response, siteName, trackName=None, trackmemo=None, trackstatus='OFF',cookieNamePair=None,urlparam=None,urllastpath='ON',trackpayload=None):
     ${cookieNamePair1}     Create dictionary      account_Name=MEMBER_ID
     rec_add_TagTrack    ${login_response}    ${SITE1}   tagtrack1      trackmemo=memo123      trackstatus=ON      cookieNamePair=${cookieNamePair1}


pre_TagRecommend
     [Documentation]  預先  新增 TagRecommend
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    #icemrobot: rec_add_TagRecommend(self, login_response, siteName, recommendName=None, recommendmemo=None, recommendstatus='OFF',domRulePair=None,recpayload='no')
    ${domRulePair}   Create dictionary      rec_rule1=test_recommendation
    rec_add_TagRecommend    ${login_response}   ${SITE1}    tagrecommend       recommendstatus=ON   domRulePair=${domRulePair}


Add_edit urlprefix
    [Documentation]  預先  編輯 TagRecommend
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    rec_edit_urlprefix   ${login_response}    ${SITE1}      retUrlPrefix=${url_prefix}





#------------------------------------打   tracking  log----------------------------------------
#為了 測試  1.daily tracking 的數量是否正確  2. monthly tracking 的數量是否正確   3.daily的 總和 和  monthly的總和 是相等的

input_tracking_log1
    [Documentation]   打入 tracking log_member1  ,時間為當前時間
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}
    ${recommendation_list}=   rec_get_Configuration_list    ${login_response}       ${SITE1}
    ${recommendId}=   get_element   ${recommendation_list}    test_recommendation          name    id      get_recommendationId
    ${retimpr_vItemId}=   Convert To String   101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120
    ${shopDetail}   Convert To String      105,500,100,106,300,12,107,250,10,108,15,100,109,150,50,110,1500,50
    ${tag_resp}     rec_getSnippetCode    ${login_response}    ${SITE1}
    ${hard_retCrt}   get_tag_retCert     ${tag_resp}
    ${range_visitor}   Convert To Integer    ${range_visitor1}

    # track_tracking(self, host, t,  siteId,retCrt, retUid,sessionId,siteMember=None,fromOutLink=None,Referer=None,param='googleid=987qwe' )
    #track_siteclick(self, host, t,  siteId,retCrt, retUid,sessionId,clkLabel='TEST',siteMember=None,Referer=None )
    #track_retImpr(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None,vItemId='573,577',recDomId=None,recommendId=None,
                     # Referer='http://icem.retair.com//Q11A_tracking_example_site71/0121.html'):
    #track_retclk(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None,recDomId=None,recommendId=None,
                      #vItemId='573', Referer='http://icem.retair.com//Q11A_tracking_example_site71/0121.html')

    # track_buy(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None, recDomId=None,recommendId=None,
                  #shopDetail='101,30,1000,103,300,10,105,210,10',Referer=None):
    :FOR    ${page}    IN RANGE    0   ${range_track1}
        \  ${yester_time}=   generate_time  ${log1_cost_day}
        \  ${sessionId}=    generate_sessionId
        \  track_tracking      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}     siteMember=${member1}



    :FOR    ${page}    IN RANGE    0   ${range_retimpr1}
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   ${sessionId}=    generate_sessionId
        \   track_retImpr     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}    ${member1}      ${rec_DomId}     ${recommendId}         ${retimpr_vItemId}

    #track_retclk(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None,recDomId=None,recommendId=None,
                      #vItemId='573', Referer='http://icem.retair.com//Q11A_tracking_example_site71/0121.html')
    :FOR    ${page}    IN RANGE    0   ${range_retclk1}
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     101
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     102
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk   ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     103
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     104
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time   ${log1_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     105
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time   ${log1_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     106
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     107
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     108
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk    ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     109
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     110



    # track_buy(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None, recDomId=None,recommendId=None,
                  #shopDetail='101,30,1000,103,300,10,105,210,10',Referer=None):
    :FOR    ${page}    IN RANGE    0   ${range_buy1}
        \   ${yester_time}=   generate_time  ${log1_cost_day}
        \   ${sessionId}=    generate_sessionId
        \   track_buy     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid1}    ${sessionId}     ${member1}      ${shopDetail}


    :FOR    ${page}    IN RANGE   0   ${range_visitor}
        \    ${page}=   Convert To String   ${page}
        \    ${test_name}=     Catenate     visitor1Test-Track-test${page}
        \  ${yester_time}=   generate_time  ${log1_cost_day}
        \  ${sessionId}=    generate_sessionId
        \  track_tracking      ${yester_time}     ${siteId}   ${hard_retCrt}   ${test_name}    ${sessionId}


beforecheck_sleep_time
    [Documentation]  打完log後,  獲取資料前的緩衝時間
    sleep     ${sleeptime}




check_log1_date
    [Documentation]   檢查第一次打的log   (Daily  view)
    #report_get_PixelByDay(self,login_response, siteName, startTime, endTime,pixel='All%20Pixel%20Data'):
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${tracking_data}=   report_get_behavior_TrackingVisit    ${login_response}   ${SITE1}   ${str_date1}     ${str_date1}
    ${tran_behavior_data}=   transfer_BehaviorReport_data     ${tracking_data}
    ${impression1}=  Evaluate   ${range_track1}+${range_visitor1}+${range_retimpr1}
    ${click1}=   Evaluate   ${range_retclk1}*10
    ${count1}=  Evaluate   ${impression1}+ ${click1}
    ${visit1}=  Evaluate   ${impression1}+ ${click1}
    ${visitor1}=   Evaluate   ${range_visitor1}+1
    ${check}=   Create dictionary       count=${count1}   impression=${impression1}    visit=${visit1}      click=${click1}        visitor=${visitor1}
    check_Report_count    ${tran_behavior_data}     ${check}





input_tracking_log2
    [Documentation]   打入 tracking log_member1    時間為當前時間
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}
    ${recommendation_list}=   rec_get_Configuration_list    ${login_response}       ${SITE1}
    ${recommendId}=   get_element   ${recommendation_list}    test_recommendation          name    id      get_recommendationId
    ${retimpr_vItemId}=   Convert To String   101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120
    ${shopDetail}   Convert To String     101,300,12,102,250,10,103,15,100,104,150,50,105,500,100
    ${range_track}=   Convert To Integer     ${range_track2}
    ${range_retimpr}=   Convert To Integer     ${range_retimpr2}
    ${range_retclk}=   Convert To Integer     ${range_retclk2}
    ${range_buy}=   Convert To Integer     ${range_buy2}
    ${range_visitor}   Convert To Integer    ${range_visitor2}
    ${tag_resp}     rec_getSnippetCode    ${login_response}    ${SITE1}
    ${hard_retCrt}   get_tag_retCert     ${tag_resp}


    :FOR    ${page}    IN RANGE    0   ${range_track}
        \  ${yester_time}=   generate_time  ${log2_cost_day}     #yesterday  time
        \  ${sessionId}=    generate_sessionId
        \  track_tracking      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}    siteMember=${member1}

    :FOR    ${page}    IN RANGE    0   ${range_retimpr}
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   ${sessionId}=    generate_sessionId
        \   track_retImpr     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}    ${member1}      ${rec_DomId}     ${recommendId}         ${retimpr_vItemId}

    #track_retclk(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None,recDomId=None,recommendId=None,
                      #vItemId='573', Referer='http://icem.retair.com//Q11A_tracking_example_site71/0121.html')
    :FOR    ${page}    IN RANGE    0   ${range_retclk}
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     101
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     102
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk   ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     103
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     104
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     105
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     106
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk      ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     107
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     108
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk    ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     109
        \   ${sessionId}=    generate_sessionId
        \   ${yester_time}=   generate_time  ${log2_cost_day}
        \   track_retclk     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}         ${member1}         ${rec_DomId}        ${recommendId}     110


    # track_buy(self, host, t, siteId, retCrt, retUid, sessionId, siteMember=None, recDomId=None,recommendId=None,
                  #shopDetail='101,30,1000,103,300,10,105,210,10',Referer=None):
    :FOR    ${page}    IN RANGE    0   ${range_buy}
        \   ${yester_time}=   generate_time  ${log2_cost_day}     #yesterday  time
        \   ${sessionId}=    generate_sessionId
        \   track_buy     ${yester_time}     ${siteId}   ${hard_retCrt}    ${hard_retUid2}    ${sessionId}     ${member1}      ${shopDetail}


    :FOR    ${page}    IN RANGE   0    ${range_visitor}
        \    ${page}=   Convert To String   ${page}
        \    ${test_name}=     Catenate     visitor2Test-Track-test${page}
        \  ${yester_time}=   generate_time  ${log2_cost_day}     #yesterday  time
        \  ${sessionId}=    generate_sessionId
        \  track_tracking      ${yester_time}     ${siteId}   ${hard_retCrt}   ${test_name}    ${sessionId}


#report_get_behavior_TrackingVisit_month(self, url, SessionToken, siteName, siteId,startMonth,endMonth)
beforecheck_sleep_time
    [Documentation]  打完log後,  獲取資料前的緩衝時間
    sleep     ${sleeptime}










check_log2_date
    [Documentation]   檢查第二次打的log     (Daily  view)
    #report_get_PixelByDay(self,login_response, siteName, startTime, endTime,pixel='All%20Pixel%20Data'):
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log2_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date}=  transfer_date_to_string  ${date1}
    ${tracking_data}=   report_get_behavior_TrackingVisit    ${login_response}   ${SITE1}    ${str_date}     ${str_date}
    ${tran_data}=   transfer_BehaviorReport_data     ${tracking_data}
     ${impression1}=  Evaluate   ${range_track1}+${range_visitor1}+${range_retimpr1}
    ${click1}=   Evaluate   ${range_retclk1} *10
    ${count1}=  Evaluate   ${impression1}+ ${click1}
    ${visit1}=  Evaluate   ${impression1}+ ${click1}
    ${visitor1}=   Evaluate   ${range_visitor1}+1

    ${impression2}=  Evaluate   ${range_track2}+${range_visitor2}+${range_retimpr2}
    ${click2}=   Evaluate   ${range_retclk2} *10
    ${count2}=  Evaluate   ${impression2}+ ${click2}
    ${visit2}=  Evaluate   ${impression2}+ ${click2}
    ${visitor2}=   Evaluate   ${range_visitor2}+1

    ${impression}=  Evaluate    ${impression1}+ ${impression2}
    ${click}=   Evaluate   ${click1}+${click2}
    ${count}=  Evaluate   ${count1}+${count2}
    ${visit}=  Evaluate   ${visit1}+${visit2}
    ${visitor}=   Evaluate   ${visitor1}+${visitor2}
    ${check}=   Create dictionary      impression=${impression}       click=${click}       count=${count}    visit=${visit}     visitor=${visitor}
    check_Report_count    ${tran_data}     ${check}




check_sum_log1_log2_date
    [Documentation]   檢查第一次和第二次打的   log 總和     (Daily  view)
    #report_get_PixelByDay(self,login_response, siteName, startTime, endTime,pixel='All%20Pixel%20Data'):
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${tracking_data}=   report_get_behavior_TrackingVisit    ${login_response}   ${SITE1}   ${start_date}     ${str_date1}
    ${tran_data}=   transfer_BehaviorReport_data     ${tracking_data}
    ${impression1}=  Evaluate   ${range_track1}+${range_visitor1}+${range_retimpr1}
    ${click1}=   Evaluate   ${range_retclk1} *10
    ${count1}=  Evaluate   ${impression1}+ ${click1}
    ${visit1}=  Evaluate   ${impression1}+ ${click1}
    ${visitor1}=   Evaluate   ${range_visitor1}+1

    ${impression2}=  Evaluate   ${range_track2}+${range_visitor2}+${range_retimpr2}
    ${click2}=   Evaluate  ${range_retclk2} *10
    ${count2}=  Evaluate   ${impression2}+ ${click2}
    ${visit2}=  Evaluate   ${impression2}+ ${click2}
    ${visitor2}=   Evaluate   ${range_visitor2}+1

    ${impression}=  Evaluate    ${impression1}+ ${impression2}
    ${click}=   Evaluate   ${click1}+${click2}
    ${count}=  Evaluate   ${count1}+${count2}
    ${visit}=  Evaluate   ${visit1}+${visit2}
    ${visitor}=   Evaluate   ${visitor1}+${visitor2}
    ${check}=   Create dictionary      impression=${impression}       click=${click}       count=${count}    visit=${visit}     visitor=${visitor}
    check_Report_count    ${tran_data}     ${check}





#-----------------------------------tracking    log------------------------------







#-----------------pixel------------------------
# 確認    1.每天的 pixel數量總和 2. pixel各自的數量   是正確的

Add_eventag
    [Documentation]  添加 cat , catcv , catclk 類型
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${url_click}  Create list     QA
    ${trvo_click}  Create dictionary   type=PAGE_VIEW_PIXEL_CLICK    urlPatternList=${url_click}
    ${trvo_track}  Create dictionary   type=PAGE_VIEW_PIXEL_TRACK   urlPatternList=${url_click}
    ${trvo_convert}  Create dictionary   type=PAGE_VIEW_PIXEL_CONVERT    urlPatternList=${url_click}
    ${triggerVOList}   Create list    ${trvo_click}    ${trvo_track}     ${trvo_convert}
    # rec_add_TagPixel(self,  login_response, siteName,TagPixelName,label=None,memo=None,status='ON',pixelpayload='no',triggerVOList=None)
    :FOR    ${page}    IN RANGE   10   15
        \    ${page}=   Convert To String   ${page}
        \    ${test_name}=     Catenate     evenTag-test${page}
        #\    rec_delete_TagPixel      ${login_response}   ${SITE1}    ${test_name}
        \    rec_add_TagPixel      ${login_response}   ${SITE1}    ${test_name}      tagpixelclick    tagpixelclick    pixelpayload=no    triggerVOList=${triggerVOList}





input_eventag_visitor_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name10}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test10}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test10}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test10}
    #  設定   visitor   pixel_type
    ${pixel_type}=  Convert To String    cat


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")


    #  打  visitor 的 log
    :FOR    ${page}    IN RANGE    0   ${cat_range_eventag-visitor}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  ${sessionId}=    generate_sessionId
        \   ${retuid}=  generate_retuid
        \   ${new_retuid}=     Catenate     ${page}${retuid}
        #track_pixel(self, host, t, siteId,pixeltype, cat,cert,  retUid=None, sessionId='testsessionId',fromOutLink=None, Referer=None,param='googleid=987qwe')
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${new_retuid}   ${sessionId}   sitetype=${sitetype}    app=${app}






input_eventag10_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name10}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test10}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test10}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test10}
    #  設定   visitor   pixel_type
    ${pixel_type}=  Convert To String    cat


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")





#  setting  variable
    ${hard_retUid}     Convert to String   ${hard_retUid1}
    ${sessionId}=  Convert to String    ${eventag_sessionId}

    :FOR    ${page}    IN RANGE    0   ${cat_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catclk
   :FOR    ${page}    IN RANGE    0   ${catclk_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}

    ${pixel_type}=  Convert To String    catcv
   :FOR    ${page}    IN RANGE    0   ${catcv_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}



input_eventag11_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name11}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test11}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test11}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test11}


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")


#  setting  variable
    ${hard_retUid}     Convert to String   ${hard_retUid2}
    ${sessionId}=  Convert to String    ${eventag_sessionId}

    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0    ${cat_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catclk
   :FOR    ${page}    IN RANGE    0   ${catclk_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}

    ${pixel_type}=  Convert To String    catcv
   :FOR    ${page}    IN RANGE    0    ${catcv_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


input_eventag12_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name12}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test12}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test12}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test12}


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")


#  setting  variable
    ${hard_retUid}     Convert to String   ${hard_retUid3}
    ${sessionId}=  Convert to String    ${eventag_sessionId}

    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catclk
   :FOR    ${page}    IN RANGE    0    ${catclk_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}

    ${pixel_type}=  Convert To String    catcv
   :FOR    ${page}    IN RANGE    0   ${catcv_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


input_eventag13_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name13}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test13}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test13}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test13}


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")


#  setting  variable
    ${hard_retUid}     Convert to String   ${hard_retUid4}
    ${sessionId}=  Convert to String    ${eventag_sessionId}

    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0    ${cat_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catclk
   :FOR    ${page}    IN RANGE    0    ${catclk_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}

    ${pixel_type}=  Convert To String    catcv
   :FOR    ${page}    IN RANGE    0   ${catcv_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


input_eventag14_log
    [Documentation]   打入  pixel  cat  log
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定 要哪一個 ewventag tag
    ${eventag_name}=    Convert to String     ${eventag_name14}
    #設定  log數量
    ${cat_range}=    Convert to String    ${cat_range_eventag-test14}
    ${catclk_range}=    Convert to String   ${catclk_range_eventag-test14}
    ${catcv_range}=    Convert to String   ${catcv_range_eventag-test14}


    #  獲取  pixelid 和 cert
    ${icem_pixel_resp} =   rec_get_TagPixelbyTagId   ${login_response}   ${SITE1}     ${eventag_name}
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")
    ${sitetype}=   evaluate  $pixel_cat_cert.get("sitetype")


#  setting  variable
    ${hard_retUid}     Convert to String   ${hard_retUid5}
    ${sessionId}=  Convert to String    ${eventag_sessionId}

    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catclk
   :FOR    ${page}    IN RANGE    0   ${catclk_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}

    ${pixel_type}=  Convert To String    catcv
   :FOR    ${page}    IN RANGE    0   ${catcv_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      sitetype=${sitetype}











#-----------------pixel------------------------



Add_pixel
    [Documentation]  添加 cat , catcv , catclk 類型
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}

    cam_add_pixel      ${login_response}   ${SITE1}    campaign=${pixel_offsitename10}      ad=${ad}    group=${group}     pixelpayload=no
    cam_add_pixel      ${login_response}   ${SITE1}    campaign=${pixel_offsitename11}      ad=${ad}   group=${group}     pixelpayload=no
    cam_add_pixel      ${login_response}   ${SITE1}    campaign=${pixel_offsitename12}      ad=${ad}    group=${group}    pixelpayload=no
    cam_add_pixel      ${login_response}   ${SITE1}    campaign=${pixel_offsitename13}      ad=${ad}    group=${group}    pixelpayload=no
    cam_add_pixel      ${login_response}   ${SITE1}    campaign=${pixel_offsitename14}      ad=${ad}    group=${group}    pixelpayload=no

#${cat_range_offsitePixel-visitor}

input_pixel_visitor_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename10}
    ${visitor_range}  Convert To String   ${cat_range_offsitePixel-visitor}

    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${visitor_range}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  ${sessionId}=    generate_sessionId
        \  ${hard_retUid}=   generate_retuid
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}





input_pixel10_log_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename10}
    ${cat_range_Pixel}  Convert To String   ${cat_range_offsitePixel-test10}
    ${catclk_range_Pixel}  Convert To String   ${catclk_range_offsitePixel-test10}
    ${catcv_range_Pixel}  Convert To String   ${catcv_range_offsitePixel-test10}
    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
    ${hard_retUid}   Convert To String   ${hard_retUid1}
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}
    sleep  5

    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}       app=${app}       sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catcv

    :FOR    ${page}    IN RANGE    0  ${catcv_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     app=${app}     sitetype=${sitetype}


input_pixel11_log_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename11}
    ${cat_range_Pixel}  Convert To String   ${cat_range_offsitePixel-test11}
    ${catclk_range_Pixel}  Convert To String   ${catclk_range_offsitePixel-test11}
    ${catcv_range_Pixel}  Convert To String   ${catcv_range_offsitePixel-test11}
    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
    ${hard_retUid}   Convert To String   ${hard_retUid2}
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}
    sleep  5

    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}       app=${app}       sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catcv

    :FOR    ${page}    IN RANGE    0  ${catcv_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     app=${app}     sitetype=${sitetype}



input_pixel12_log_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename12}
    ${cat_range_Pixel}  Convert To String   ${cat_range_offsitePixel-test12}
    ${catclk_range_Pixel}  Convert To String   ${catclk_range_offsitePixel-test12}
    ${catcv_range_Pixel}  Convert To String   ${catcv_range_offsitePixel-test12}
    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
    ${hard_retUid}   Convert To String   ${hard_retUid3}
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}
    sleep  5

    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}       app=${app}       sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catcv

    :FOR    ${page}    IN RANGE    0  ${catcv_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     app=${app}     sitetype=${sitetype}



input_pixel13_log_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename13}
    ${cat_range_Pixel}  Convert To String   ${cat_range_offsitePixel-test13}
    ${catclk_range_Pixel}  Convert To String   ${catclk_range_offsitePixel-test13}
    ${catcv_range_Pixel}  Convert To String   ${catcv_range_offsitePixel-test13}
    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
    ${hard_retUid}   Convert To String   ${hard_retUid4}
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}
    sleep  5

    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}       app=${app}       sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catcv

    :FOR    ${page}    IN RANGE    0  ${catcv_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     app=${app}     sitetype=${sitetype}




input_pixel14_log_appWEB
    [Documentation]   打入  pixel  cat  log     ,  extanswer : answer1  ,app : WEB
     ${login_response}=   login   ${USER_NAME}    ${PASSWORD}      ${ROLE}
    #get_element(self,icem_list,input_name,icem_name_param,icem_id_param,get_what='no_inpt_get_what:')
    ${Contractor_allsite}=    get_element    ${login_response}     input_name=${None}      icem_name_param=${None}       icem_id_param=owningSiteList       get_what=get_owningSiteList
    ${siteId}=   get_siteId      ${Contractor_allsite}    ${SITE1}

    #設定
    ${pixel_name}   Convert To String   ${pixel_offsitename14}
    ${cat_range_Pixel}  Convert To String   ${cat_range_offsitePixel-test14}
    ${catclk_range_Pixel}  Convert To String   ${catclk_range_offsitePixel-test14}
    ${catcv_range_Pixel}  Convert To String   ${catcv_range_offsitePixel-test14}
    ${app}   Convert To String    ${app}

    #獲取  pixelid 和 cert
    ${sitetype}   Convert To String   p
    ${icem_pixel_list} =   cam_get_pixel_list   ${login_response}   ${SITE1}      ${pixel_name}
    ${icem_pixel_resp}=   get_icem_dic_resp    ${icem_pixel_list}   ${pixel_name}   campaign      get_what=get_campaign_pixel
    ${pixel_cat_cert} =     transfer_pixel_data   ${icem_pixel_resp}    campixelbutton=ON
    ${pixelid}=   evaluate  $pixel_cat_cert.get("pixelid")
    ${cert}=   evaluate  $pixel_cat_cert.get("cert")

    #log設定
    ${hard_retUid}   Convert To String   ${hard_retUid5}
   　${sessionId}=    generate_sessionId

    #type設定
    ${pixel_type}=  Convert To String    cat
    :FOR    ${page}    IN RANGE    0   ${cat_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}      app=${app}      sitetype=${sitetype}
    sleep  5

    ${pixel_type}=  Convert To String    catclk
    :FOR    ${page}    IN RANGE    0   ${catclk_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}       app=${app}       sitetype=${sitetype}


    ${pixel_type}=  Convert To String    catcv

    :FOR    ${page}    IN RANGE    0  ${catcv_range_Pixel}
        \  ${yester_time}=   generate_time  ${log1_cost_day}     #yesterday  time
        \  track_pixel   ${yester_time}   ${siteId}   ${pixel_type}     ${pixelid}    ${cert}    ${hard_retUid}   ${sessionId}     app=${app}     sitetype=${sitetype}






















#---------------check    it  must run cassandra




beforecheck_sleep_time
    [Documentation]  打完log後,  獲取資料前的緩衝時間
    sleep     ${sleeptime}

run_hourly_cassandra1
   integrated_run_hourly_cassandra

run_cassandra_sleep
    [Documentation]     跑 完cassandra 的 推薦 結果 後 暫緩時間
    sleep    ${cassandra_sleeptime}


run_cassandra
    [Documentation]  跑cassandra結果
    run_cassandra



run_cassandra_sleep
    [Documentation]     跑 完cassandra 的 推薦 結果 後 暫緩時間
    sleep    ${cassandra_sleeptime}



check_log2_month
    [Documentation]     檢查第二次打的log   (Month  view)
   ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time2}=   generate_time   ${log2_cost_day}
    ${date2}=  timetransfer_time_into_date  ${time2}
    ${month2}=   transfer_date_to_string  ${date2}   type=month
    #report_get_behavior_TrackingVisit_month(self,login_response, siteName,startMonth,endMonth
    ${tracking_data}=   report_get_behavior_TrackingVisit_month      ${login_response}     ${SITE1}     ${month2}     ${month2}
    ${tran_data}=   transfer_BehaviorReport_data     ${tracking_data}
     ${impression1}=  Evaluate   ${range_track1}+${range_visitor1}+${range_retimpr1}
    ${click1}=   Evaluate  ${range_retclk1} *10
    ${count1}=  Evaluate   ${impression1}+ ${click1}
    ${visit1}=  Evaluate   ${impression1}+ ${click1}
    ${visitor1}=   Evaluate   ${range_visitor1}+1

    ${impression2}=  Evaluate   ${range_track2}+${range_visitor2}+${range_retimpr2}
    ${click2}=   Evaluate  ${range_retclk2} *10
    ${count2}=  Evaluate   ${impression2}+ ${click2}
    ${visit2}=  Evaluate   ${impression2}+ ${click2}
    ${visitor2}=   Evaluate   ${range_visitor2}+1

    ${impression}=  Evaluate    ${impression1}+ ${impression2}
    ${click}=   Evaluate   ${click1}+${click2}
    ${count}=  Evaluate   ${count1}+${count2}
    ${visit}=  Evaluate   ${visit1}+${visit2}
    ${visitor}=   Evaluate   ${visitor1}+${visitor2}
    ${check}=   Create dictionary      impression=${impression}       click=${click}       count=${count}    visit=${visit}     visitor=${visitor}
    check_Report_count    ${tran_data}     ${check}



check_sum_log1_log2_month
    [Documentation]   檢查第一次和第二次打的   log 總和     (Month  view)
    #report_get_PixelByDay(self,login_response, siteName, startTime, endTime,pixel='All%20Pixel%20Data'):
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time2}=   generate_time   ${log2_cost_day}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date2}=  timetransfer_time_into_date  ${time2}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${month2}=   transfer_date_to_string  ${date2}   type=month
    ${month1}=   transfer_date_to_string  ${date1}   type=month
    ${tracking_data}=    report_get_behavior_TrackingVisit_month    ${login_response}   ${SITE1}   ${month2}    ${month1}
    ${tran_data}=   transfer_BehaviorReport_data     ${tracking_data}

    ${impression1}=  Evaluate   ${range_track1}+${range_visitor1}+${range_retimpr1}
    ${click1}=   Evaluate   ${range_retclk1} *10
    ${count1}=  Evaluate   ${impression1}+ ${click1}
    ${visit1}=  Evaluate   ${impression1}+ ${click1}
    ${visitor1}=   Evaluate   ${range_visitor1}+1

    ${impression2}=  Evaluate   ${range_track2}+${range_visitor2}+${range_retimpr2}
    ${click2}=   Evaluate   ${range_retclk2} *10
    ${count2}=  Evaluate   ${impression2}+ ${click2}
    ${visit2}=  Evaluate   ${impression2}+ ${click2}
    ${visitor2}=   Evaluate   ${range_visitor2}+1

    ${impression}=  Evaluate    ${impression1}+ ${impression2}
    ${click}=   Evaluate   ${click1}+${click2}
    ${count}=  Evaluate   ${count1}+${count2}
    ${visit}=  Evaluate   ${visit1}+${visit2}
    ${visitor}=   Evaluate   ${visitor1}+${visitor2}
    ${check}=   Create dictionary      impression=${impression}       click=${click}       count=${count}       visit=${visit}       visitor=${visitor}
    check_Report_count    ${tran_data}     ${check}











check_eventagsum_data
    [Documentation]    檢查  evenTag : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_name}=  Convert to string   ${all_pixel_data_name}
    ${pixel_data}=     get_icem_dic_resp      ${pixelDaySum}    ${pixel_name}      tagName
    ${tran_list_param}=  Create List    impression    click    conversion   visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${sum_cat} =   Evaluate    ${cat_range_eventag-test10}+${cat_range_eventag-test11}+${cat_range_eventag-test12}+${cat_range_eventag-test13}+${cat_range_eventag-test14}+${cat_range_eventag-visitor}
    ${sum_catlk} =   Evaluate   ${catclk_range_eventag-test10}+${catclk_range_eventag-test11}+${catclk_range_eventag-test12}+${catclk_range_eventag-test13}+${catclk_range_eventag-test14}
    ${sum_catcv} =   Evaluate   ${catcv_range_eventag-test10}+${catcv_range_eventag-test11}+${catcv_range_eventag-test12}+${catcv_range_eventag-test13}+${catcv_range_eventag-test14}
    ${visitors}=   Evaluate      ${cat_range_eventag-visitor}+5
    ${check}=   Create dictionary      impression=${sum_cat}      click=${sum_catlk}       conversion=${sum_catcv}　　   visitor=${visitors}
    check_Report_count    ${tran_pixel_data}     ${check}





check_eventag_test10_includingvisitors
    [Documentation]    檢查  evenTag-test10 : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${eventag_name10}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${visitors}=   Evaluate      ${cat_range_eventag-visitor}+1
    ${impression}=   Evaluate           ${cat_range_eventag-test10}+${cat_range_eventag-visitor}
    ${check}=   Create dictionary      impression=${impression}       click=${catclk_range_eventag-test10}       conversion=${catcv_range_eventag-test10}    visitor=${visitors}
    check_Report_count      ${tran_pixel_data}      ${check}

check_eventag_test11
    [Documentation]  檢查  evenTag-test11 : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${eventag_name11}    tagName
    ${visitors}=   Evaluate      1
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range_eventag-test11}        click=${catclk_range_eventag-test11}       conversion=${catcv_range_eventag-test11}     visitor=${visitors}
    check_Report_count      ${tran_pixel_data}      ${check}

check_eventag_test12
    [Documentation]  檢查  evenTag-test12 : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${eventag_name12}    tagName
    ${visitors}=   Evaluate      1
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary     impression=${cat_range_eventag-test12}        click=${catclk_range_eventag-test12}       conversion=${catcv_range_eventag-test12}      visitor=${visitors}
    check_Report_count      ${tran_pixel_data}      ${check}


check_eventag_test13
    [Documentation]  檢查  evenTag-test13 : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${eventag_name13}    tagName
    ${visitors}=   Evaluate      1
    ${tran_list_param}=  Create List    impression    click    conversion     visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary      impression=${cat_range_eventag-test13}        click=${catclk_range_eventag-test13}       conversion=${catcv_range_eventag-test13}      visitor=${visitors}
    check_Report_count      ${tran_pixel_data}      ${check}




check_eventag_test14
    [Documentation]  檢查  evenTag-test14 : impression ,click,conversion,visitors 的驗證 是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=1
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${eventag_name14}    tagName
    ${visitors}=   Evaluate      1
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary     impression=${cat_range_eventag-test14}        click=${catclk_range_eventag-test14}       conversion=${catcv_range_eventag-test14}      visitor=${visitors}
    check_Report_count      ${tran_pixel_data}      ${check}















check_pixelsum_data
    [Documentation]    檢查  pixel impression ,click,conversion,visitors   數量  是否正確
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_name}=    Convert to string    ${all_pixel_data_name}
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion   visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${sum_cat} =   Evaluate    ${cat_range_offsitePixel-test10}+${cat_range_offsitePixel-test11}+${cat_range_offsitePixel-test12}+${cat_range_offsitePixel-test13}+${cat_range_offsitePixel-test14}+${cat_range_offsitePixel-visitor}
    ${sum_catlk} =   Evaluate   ${catclk_range_offsitePixel-test10}+${catclk_range_offsitePixel-test11}+${catclk_range_offsitePixel-test12}+${catclk_range_offsitePixel-test13}+${catclk_range_offsitePixel-test14}
    ${sum_catcv} =   Evaluate   ${catcv_range_offsitePixel-test10}+${catcv_range_offsitePixel-test11}+${catcv_range_offsitePixel-test12}+${catcv_range_offsitePixel-test13}+${catcv_range_offsitePixel-test14}
    ${visitors}=   Evaluate      ${cat_range_offsitePixel-visitor}+5
    ${check}=   Create dictionary      impression=${sum_cat}      click=${sum_catlk}       conversion=${sum_catcv}　　   visitor=${visitors}
    check_Report_count    ${tran_pixel_data}     ${check}





check_pixel-test10_includingvisitors
    [Documentation]  檢查  pixel : Pixel-test10   impression ,click,conversion,visitors 數量  是否正確
    #setting
    ${pixel_name}=  Convert to string   ${pixel_offsitename10}
    ${visitor_count}=  Convert to string    ${cat_range_offsitePixel-visitor}
    ${cat_range}=   Evaluate        ${cat_range_offsitePixel-test10}+${visitor_count}
    ${catclk_range}=  Convert to string     ${catclk_range_offsitePixel-test10}
    ${catcv_range}=  Convert to string     ${catcv_range_offsitePixel-test10}
    #${visitor_range}=   Convert to string    ${cat_range_offsitePixel-visitor}
    ${visitor_range}=   Evaluate       ${cat_range_offsitePixel-visitor}+1
    ${ad}=  Convert to string  ${ad}
    ${group}=  Convert to string  ${group}
    ${Integrated_pixel_name}=  catenate   ${pixel_name}-${group}-${ad}


    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${Integrated_pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range}       click=${catclk_range}        conversion=${catcv_range}     visitor=${visitor_range}
    check_Report_count      ${tran_pixel_data}      ${check}



check_pixel_test11
    [Documentation]  檢查  pixel : Pixel-test11   impression ,click,conversion,visitors 數量  是否正確
    #setting
    ${pixel_name}=  Convert to string   ${pixel_offsitename11}
    ${cat_range}=  Convert to string     ${cat_range_offsitePixel-test11}
    ${catclk_range}=  Convert to string     ${catclk_range_offsitePixel-test11}
    ${catcv_range}=  Convert to string     ${catcv_range_offsitePixel-test11}
    #${visitor_range}=   Convert to string     ${cat_range_offsitePixel-test11}
    ${visitor_range}=   Convert to string      1
    ${Integrated_pixel_name}=  catenate   ${pixel_name}-${group}-${ad}

    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${Integrated_pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range}       click=${catclk_range}        conversion=${catcv_range}     visitor=${visitor_range}
    check_Report_count      ${tran_pixel_data}      ${check}



check_pixel_test12
    [Documentation]  檢查  pixel : Pixel-test12   impression ,click,conversion,visitors 數量  是否正確
    #setting
    ${pixel_name}=  Convert to string   ${pixel_offsitename12}
    ${cat_range}=  Convert to string     ${cat_range_offsitePixel-test12}
    ${catclk_range}=  Convert to string     ${catclk_range_offsitePixel-test12}
    ${catcv_range}=  Convert to string     ${catcv_range_offsitePixel-test12}
    #${visitor_range}=   Convert to string     ${cat_range_offsitePixel-test12}
    ${visitor_range}=   Convert to string      1
    ${Integrated_pixel_name}=  catenate   ${pixel_name}-${group}-${ad}

    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${Integrated_pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range}       click=${catclk_range}        conversion=${catcv_range}     visitor=${visitor_range}
    check_Report_count      ${tran_pixel_data}      ${check}




check_pixel_test13
    [Documentation]  檢查  pixel : Pixel-test13   impression ,click,conversion,visitors 數量  是否正確
    #setting
    ${pixel_name}=  Convert to string   ${pixel_offsitename13}
    ${cat_range}=  Convert to string     ${cat_range_offsitePixel-test13}
    ${catclk_range}=  Convert to string     ${catclk_range_offsitePixel-test13}
    ${catcv_range}=  Convert to string     ${catcv_range_offsitePixel-test13}
    #${visitor_range}=   Convert to string     ${cat_range_offsitePixel-test13}
    ${visitor_range}=   Convert to string      1
    ${Integrated_pixel_name}=  catenate   ${pixel_name}-${group}-${ad}


    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${Integrated_pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range}       click=${catclk_range}        conversion=${catcv_range}     visitor=${visitor_range}
    check_Report_count      ${tran_pixel_data}      ${check}




check_pixel_test14
    [Documentation]   檢查  pixel : Pixel-test14   impression ,click,conversion,visitors 數量  是否正確
    #setting
    ${pixel_name}=  Convert to string   ${pixel_offsitename14}
    ${cat_range}=  Convert to string     ${cat_range_offsitePixel-test14}
    ${catclk_range}=  Convert to string     ${catclk_range_offsitePixel-test14}
    ${catcv_range}=  Convert to string     ${catcv_range_offsitePixel-test14}
    #${visitor_range}=   Convert to string     ${cat_range_offsitePixel-test14}
    ${visitor_range}=   Convert to string      1
    ${Integrated_pixel_name}=  catenate   ${pixel_name}-${group}-${ad}

    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2
    ${pixel_data}=    get_icem_dic_resp    ${pixelDaySum}    ${Integrated_pixel_name}    tagName
    ${tran_list_param}=  Create List    impression    click    conversion    visitor
    ${tran_pixel_data}=    transfer_report_data    ${pixel_data}     ${tran_list_param}
    ${check}=   Create dictionary       impression=${cat_range}       click=${catclk_range}        conversion=${catcv_range}     visitor=${visitor_range}
    check_Report_count      ${tran_pixel_data}      ${check}

check_pixel_name_search_test
    [Documentation]     檢查 Pixel Name Search 搜尋 pixel name 是否成功
    ${login_response}=   login   ${USER_NAME}    ${PASSWORD}     ${ROLE}
    ${time1}=   generate_time   ${log1_cost_day}
    ${date1}=  timetransfer_time_into_date  ${time1}
    ${str_date1}=  transfer_date_to_string  ${date1}
    ${pixelDaySum}=    get_report_behaviorDaySum    ${login_response}    ${SITE1}    ${start_date}    ${str_date1}    tagType=2    search_tagName=pixel_offsitename
    ${search_pixel_sum}=   Get Length   ${pixelDaySum}
    ${all_pixel_sum}=   Convert to integer  5
    Should be Equal     ${all_pixel_sum}     ${search_pixel_sum}
