---
layout: post
title: sphinx with discuz
categories: Web
description: sphinx with discuz
keywords: sphinx,discuz
---


安装sphinx：
```shell
sudo apt-get install sphinxsearch
```
配置：

```shell
source discuz
{
    type                    = mysql

    sql_host                = xx.xx.xx.xx
    sql_user                =
    sql_pass                =
    sql_db                  = discuz
    sql_port                = 3306  # optional, default is 3306

}

source uc
{
    type                    = mysql

    sql_host                = xx.xx.xx.xx
    sql_user                =
    sql_pass                =
    sql_db                  = ucenter
    sql_port                = 3306  # optional, default is 3306
}

source threads : discuz
{
    sql_query_pre           = SET NAMES utf8
    sql_query_pre           = REPLACE INTO sph_counter SELECT 1, MAX(tid) FROM pre_forum_thread
    sql_query               = SELECT t.tid AS id,t.tid,t.fid,t.subject,t.digest,t.displayorder,t.dateline,t.lastpost,t.recommends,t.replies,t.views \
                                FROM pre_forum_thread AS t \
                                WHERE t.displayorder >= 0 AND t.tid>=$start AND t.tid<=$end 

    sql_query_range         = SELECT (SELECT MIN(tid) FROM pre_forum_thread),max_doc_id FROM sph_counter WHERE counter_id = 1
    sql_range_step          = 4096

    sql_attr_uint           = fid
    sql_attr_uint           = tid
    sql_attr_uint           = digest
    sql_attr_uint           = displayorder
    sql_attr_timestamp      = dateline
    sql_attr_uint           = recommends
    sql_attr_uint           = replies
    sql_attr_timestamp      = lastpost
    sql_attr_uint           = views

    sql_query_info          = SELECT * FROM pre_forum_thread WHERE tid=$id
}

source threads_delta : threads
{
    sql_query_pre           = SET NAMES utf8
    sql_query_range         = SELECT max_doc_id + 1, (SELECT MAX(tid) FROM pre_forum_thread) FROM sph_counter WHERE counter_id = 1
}

index threads
{
    source          = threads
    path            = /var/lib/sphinxsearch/data/threads
    docinfo         = extern
    mlock           = 0
    morphology      = none
    charset_type    = utf-8
    html_strip      = 0
    charset_table   = U+FF10..U+FF19->0..9, 0..9, U+FF41..U+FF5A->a..z, U+FF21..U+FF3A->a..z,\
        A..Z->a..z, a..z, U+0149, U+017F, U+0138, U+00DF, U+00FF, U+00C0..U+00D6->U+00E0..U+00F6,\
        U+00E0..U+00F6, U+00D8..U+00DE->U+00F8..U+00FE, U+00F8..U+00FE, U+0100->U+0101, U+0101,\
        U+0102->U+0103, U+0103, U+0104->U+0105, U+0105, U+0106->U+0107, U+0107, U+0108->U+0109,\
        U+0109, U+010A->U+010B, U+010B, U+010C->U+010D, U+010D, U+010E->U+010F, U+010F,\
        U+0110->U+0111, U+0111, U+0112->U+0113, U+0113, U+0114->U+0115, U+0115, U+0116->U+0117,\
        U+0117, U+0118->U+0119, U+0119, U+011A->U+011B, U+011B, U+011C->U+011D, U+011D,\
        U+011E->U+011F, U+011F, U+0130->U+0131, U+0131, U+0132->U+0133, U+0133, U+0134->U+0135,\
        U+0135, U+0136->U+0137, U+0137, U+0139->U+013A, U+013A, U+013B->U+013C, U+013C,\
        U+013D->U+013E, U+013E, U+013F->U+0140, U+0140, U+0141->U+0142, U+0142, U+0143->U+0144,\
        U+0144, U+0145->U+0146, U+0146, U+0147->U+0148, U+0148, U+014A->U+014B, U+014B,\
        U+014C->U+014D, U+014D, U+014E->U+014F, U+014F, U+0150->U+0151, U+0151, U+0152->U+0153,\
        U+0153, U+0154->U+0155, U+0155, U+0156->U+0157, U+0157, U+0158->U+0159, U+0159,\
        U+015A->U+015B, U+015B, U+015C->U+015D, U+015D, U+015E->U+015F, U+015F, U+0160->U+0161,\
        U+0161, U+0162->U+0163, U+0163, U+0164->U+0165, U+0165, U+0166->U+0167, U+0167,\
        U+0168->U+0169, U+0169, U+016A->U+016B, U+016B, U+016C->U+016D, U+016D, U+016E->U+016F,\
        U+016F, U+0170->U+0171, U+0171, U+0172->U+0173, U+0173, U+0174->U+0175, U+0175,\
        U+0176->U+0177, U+0177, U+0178->U+00FF, U+00FF, U+0179->U+017A, U+017A, U+017B->U+017C,\
        U+017C, U+017D->U+017E, U+017E, U+0410..U+042F->U+0430..U+044F, U+0430..U+044F,\
        U+05D0..U+05EA, U+0531..U+0556->U+0561..U+0586, U+0561..U+0587, U+0621..U+063A, U+01B9,\
        U+01BF, U+0640..U+064A, U+0660..U+0669, U+066E, U+066F, U+0671..U+06D3, U+06F0..U+06FF,\
        U+0904..U+0939, U+0958..U+095F, U+0960..U+0963, U+0966..U+096F, U+097B..U+097F,\
        U+0985..U+09B9, U+09CE, U+09DC..U+09E3, U+09E6..U+09EF, U+0A05..U+0A39, U+0A59..U+0A5E,\
        U+0A66..U+0A6F, U+0A85..U+0AB9, U+0AE0..U+0AE3, U+0AE6..U+0AEF, U+0B05..U+0B39,\
        U+0B5C..U+0B61, U+0B66..U+0B6F, U+0B71, U+0B85..U+0BB9, U+0BE6..U+0BF2, U+0C05..U+0C39,\
        U+0C66..U+0C6F, U+0C85..U+0CB9, U+0CDE..U+0CE3, U+0CE6..U+0CEF, U+0D05..U+0D39, U+0D60,\
        U+0D61, U+0D66..U+0D6F, U+0D85..U+0DC6, U+1900..U+1938, U+1946..U+194F, U+A800..U+A805,\
        U+A807..U+A822, U+0386->U+03B1, U+03AC->U+03B1, U+0388->U+03B5, U+03AD->U+03B5,\
        U+0389->U+03B7, U+03AE->U+03B7, U+038A->U+03B9, U+0390->U+03B9, U+03AA->U+03B9,\
        U+03AF->U+03B9, U+03CA->U+03B9, U+038C->U+03BF, U+03CC->U+03BF, U+038E->U+03C5,\
        U+03AB->U+03C5, U+03B0->U+03C5, U+03CB->U+03C5, U+03CD->U+03C5, U+038F->U+03C9,\
        U+03CE->U+03C9, U+03C2->U+03C3, U+0391..U+03A1->U+03B1..U+03C1,\
        U+03A3..U+03A9->U+03C3..U+03C9, U+03B1..U+03C1, U+03C3..U+03C9, U+0E01..U+0E2E,\
        U+0E30..U+0E3A, U+0E40..U+0E45, U+0E47, U+0E50..U+0E59, U+A000..U+A48F, U+4E00..U+9FBF,\
        U+3400..U+4DBF, U+20000..U+2A6DF, U+F900..U+FAFF, U+2F800..U+2FA1F, U+2E80..U+2EFF,\
        U+2F00..U+2FDF, U+3100..U+312F, U+31A0..U+31BF, U+3040..U+309F, U+30A0..U+30FF,\
        U+31F0..U+31FF, U+AC00..U+D7AF, U+1100..U+11FF, U+3130..U+318F, U+A000..U+A48F,\
        U+A490..U+A4CF

    #简单分词，只支持0和1，如果要搜索中文，请指定为1
    ngram_len       = 1

    #需要分词的字符，如果要搜索中文，去掉前面的注释
    ngram_chars     = U+4E00..U+9FBF, U+3400..U+4DBF, U+20000..U+2A6DF, U+F900..U+FAFF,\
    U+2F800..U+2FA1F, U+2E80..U+2EFF, U+2F00..U+2FDF, U+3100..U+312F, U+31A0..U+31BF,\
    U+3040..U+309F, U+30A0..U+30FF, U+31F0..U+31FF, U+AC00..U+D7AF, U+1100..U+11FF,\
    U+3130..U+318F, U+A000..U+A48F, U+A490..U+A4CF
    min_infix_len   = 1
    min_word_len    = 1
}

index threads_delta : threads
{
    source          = threads_delta
    path            = /var/lib/sphinxsearch/data/threads_delta
    #morphology     = stem_en
}

source members : uc
{
    sql_query_pre           = SET NAMES utf8
    sql_query_pre           = REPLACE INTO sph_counter SELECT 2, MAX(uid) FROM uc_members

    sql_query               = SELECT m.uid AS id, m.uid, m.username FROM uc_members AS m WHERE m.uid>=$start AND m.uid<=$end

    sql_query_range         = SELECT (SELECT MIN(uid) FROM uc_members),max_doc_id FROM sph_counter WHERE counter_id = 2
    sql_range_step          = 4096

    sql_attr_uint           = uid

    sql_query_info          = SELECT * FROM uc_members WHERE uid=$id
}

source members_delta : members
{
    sql_query_pre           = SET NAMES utf8
    sql_query_range         = SELECT max_doc_id + 1, (SELECT MAX(uid) FROM uc_members) FROM sph_counter WHERE counter_id = 2
}

index members
{
    source          = members
    path            = /var/lib/sphinxsearch/data/members
    docinfo         = extern
    mlock           = 0
    morphology      = none
    charset_type    = utf-8
    html_strip      = 0
    charset_table = U+FF10..U+FF19->0..9, 0..9, U+FF41..U+FF5A->a..z, U+FF21..U+FF3A->a..z,\
        A..Z->a..z, a..z, U+0149, U+017F, U+0138, U+00DF, U+00FF, U+00C0..U+00D6->U+00E0..U+00F6,\
        U+00E0..U+00F6, U+00D8..U+00DE->U+00F8..U+00FE, U+00F8..U+00FE, U+0100->U+0101, U+0101,\
        U+0102->U+0103, U+0103, U+0104->U+0105, U+0105, U+0106->U+0107, U+0107, U+0108->U+0109,\
        U+0109, U+010A->U+010B, U+010B, U+010C->U+010D, U+010D, U+010E->U+010F, U+010F,\
        U+0110->U+0111, U+0111, U+0112->U+0113, U+0113, U+0114->U+0115, U+0115, U+0116->U+0117,\
        U+0117, U+0118->U+0119, U+0119, U+011A->U+011B, U+011B, U+011C->U+011D, U+011D,\
        U+011E->U+011F, U+011F, U+0130->U+0131, U+0131, U+0132->U+0133, U+0133, U+0134->U+0135,\
        U+0135, U+0136->U+0137, U+0137, U+0139->U+013A, U+013A, U+013B->U+013C, U+013C,\
        U+013D->U+013E, U+013E, U+013F->U+0140, U+0140, U+0141->U+0142, U+0142, U+0143->U+0144,\
        U+0144, U+0145->U+0146, U+0146, U+0147->U+0148, U+0148, U+014A->U+014B, U+014B,\
        U+014C->U+014D, U+014D, U+014E->U+014F, U+014F, U+0150->U+0151, U+0151, U+0152->U+0153,\
        U+0153, U+0154->U+0155, U+0155, U+0156->U+0157, U+0157, U+0158->U+0159, U+0159,\
        U+015A->U+015B, U+015B, U+015C->U+015D, U+015D, U+015E->U+015F, U+015F, U+0160->U+0161,\
        U+0161, U+0162->U+0163, U+0163, U+0164->U+0165, U+0165, U+0166->U+0167, U+0167,\
        U+0168->U+0169, U+0169, U+016A->U+016B, U+016B, U+016C->U+016D, U+016D, U+016E->U+016F,\
        U+016F, U+0170->U+0171, U+0171, U+0172->U+0173, U+0173, U+0174->U+0175, U+0175,\
        U+0176->U+0177, U+0177, U+0178->U+00FF, U+00FF, U+0179->U+017A, U+017A, U+017B->U+017C,\
        U+017C, U+017D->U+017E, U+017E, U+0410..U+042F->U+0430..U+044F, U+0430..U+044F,\
        U+05D0..U+05EA, U+0531..U+0556->U+0561..U+0586, U+0561..U+0587, U+0621..U+063A, U+01B9,\
        U+01BF, U+0640..U+064A, U+0660..U+0669, U+066E, U+066F, U+0671..U+06D3, U+06F0..U+06FF,\
        U+0904..U+0939, U+0958..U+095F, U+0960..U+0963, U+0966..U+096F, U+097B..U+097F,\
        U+0985..U+09B9, U+09CE, U+09DC..U+09E3, U+09E6..U+09EF, U+0A05..U+0A39, U+0A59..U+0A5E,\
        U+0A66..U+0A6F, U+0A85..U+0AB9, U+0AE0..U+0AE3, U+0AE6..U+0AEF, U+0B05..U+0B39,\
        U+0B5C..U+0B61, U+0B66..U+0B6F, U+0B71, U+0B85..U+0BB9, U+0BE6..U+0BF2, U+0C05..U+0C39,\
        U+0C66..U+0C6F, U+0C85..U+0CB9, U+0CDE..U+0CE3, U+0CE6..U+0CEF, U+0D05..U+0D39, U+0D60,\
        U+0D61, U+0D66..U+0D6F, U+0D85..U+0DC6, U+1900..U+1938, U+1946..U+194F, U+A800..U+A805,\
        U+A807..U+A822, U+0386->U+03B1, U+03AC->U+03B1, U+0388->U+03B5, U+03AD->U+03B5,\
        U+0389->U+03B7, U+03AE->U+03B7, U+038A->U+03B9, U+0390->U+03B9, U+03AA->U+03B9,\
        U+03AF->U+03B9, U+03CA->U+03B9, U+038C->U+03BF, U+03CC->U+03BF, U+038E->U+03C5,\
        U+03AB->U+03C5, U+03B0->U+03C5, U+03CB->U+03C5, U+03CD->U+03C5, U+038F->U+03C9,\
        U+03CE->U+03C9, U+03C2->U+03C3, U+0391..U+03A1->U+03B1..U+03C1,\
        U+03A3..U+03A9->U+03C3..U+03C9, U+03B1..U+03C1, U+03C3..U+03C9, U+0E01..U+0E2E,\
        U+0E30..U+0E3A, U+0E40..U+0E45, U+0E47, U+0E50..U+0E59, U+A000..U+A48F, U+4E00..U+9FBF,\
        U+3400..U+4DBF, U+20000..U+2A6DF, U+F900..U+FAFF, U+2F800..U+2FA1F, U+2E80..U+2EFF,\
        U+2F00..U+2FDF, U+3100..U+312F, U+31A0..U+31BF, U+3040..U+309F, U+30A0..U+30FF,\
        U+31F0..U+31FF, U+AC00..U+D7AF, U+1100..U+11FF, U+3130..U+318F, U+A000..U+A48F,\
        U+A490..U+A4CF

        #简单分词，只支持0和1，如果要搜索中文，请指定为1
        ngram_len = 1

        #需要分词的字符，如果要搜索中文，去掉前面的注释
        ngram_chars = U+4E00..U+9FBF, U+3400..U+4DBF, U+20000..U+2A6DF, U+F900..U+FAFF,\
        U+2F800..U+2FA1F, U+2E80..U+2EFF, U+2F00..U+2FDF, U+3100..U+312F, U+31A0..U+31BF,\
        U+3040..U+309F, U+30A0..U+30FF, U+31F0..U+31FF, U+AC00..U+D7AF, U+1100..U+11FF,\
        U+3130..U+318F, U+A000..U+A48F, U+A490..U+A4CF,A..Z->a..z,a..z
        min_infix_len  = 1
        min_word_len  = 1
}

index members_delta : members
{
    source          = members_delta
    path            = /var/lib/sphinxsearch/data/members_delta
}


indexer
{
    mem_limit       = 256M
}


searchd
{
    listen              = 9312
    listen              = 9306:mysql41

    log                 = /var/log/sphinxsearch/searchd.log
    query_log           = /var/log/sphinxsearch/query.log
    read_timeout        = 5
    client_timeout      = 300
    max_children        = 30
    pid_file            = /var/run/sphinxsearch/searchd.pid
    max_matches         = 1000
    seamless_rotate     = 1
    preopen_indexes     = 1
    unlink_old          = 1
    mva_updates_pool    = 1M
    max_packet_size     = 8M
    max_filters         = 256
    max_filter_values   = 4096
    max_batch_queries   = 32
    workers             = threads # for RT to work
}
# --eof-- 
```

注意：

　　任何一项配置，如果在新的数据源块中指定了新值，继承的值都将被忽略，即使有多个定义（ multivalue）－－也就是说在一个块中如果某个类型的定义有多个，如果在新块中定义了该类型的一个新值，那么继承来的该类型的整个列表都将被忽略。所以discuz source中指定的 sql_query_pre = SET NAMES utf8对threads source不起作用。

 

启动：
```shell
searchd
```
查看是否启动：

```shell
# netstat -anp | grep searchd
tcp        0      0 0.0.0.0:9306            0.0.0.0:*      LISTEN      12128/searchd   
tcp        0      0 0.0.0.0:9312            0.0.0.0:*      LISTEN      12128/searchd   
```
建立索引：
```shell
indexer --all
```
查询：

```shell
root@ubuntu:/etc/sphinxsearch# search -i threads -q 中国
Sphinx 2.0.4-release (r3135)
Copyright (c) 2001-2012, Andrew Aksyonoff
Copyright (c) 2008-2012, Sphinx Technologies Inc (http://sphinxsearch.com)

using config file '/etc/sphinxsearch/sphinx.conf'...
index 'threads': query '中国 ': returned 1000 matches of 2475 total in 0.001 sec

displaying matches:
1. document=7119603, weight=2585, tid=7119603, digest=0, displayorder=0, authorid=1946538, lastpost=Sun Jan  5 12:45:44 2014, special=0
2. document=7261805, weight=2585, tid=7261805, digest=0, displayorder=0, authorid=24325709, lastpost=Tue Mar  4 12:24:38 2014, special=0
3. document=7290324, weight=2585, tid=7290324, digest=0, displayorder=0, authorid=1445813, lastpost=Mon Mar 17 04:01:24 2014, special=0
4. document=7227195, weight=2579, tid=7227195, digest=0, displayorder=0, authorid=11733214, lastpost=Sun Mar  9 16:40:53 2014, special=0
5. document=7290329, weight=2579, tid=7290329, digest=0, displayorder=0, authorid=1445813, lastpost=Tue Apr  8 10:45:22 2014, special=0
6. document=7106960, weight=2574, tid=7106960, digest=0, displayorder=0, authorid=4805441, lastpost=Mon May  5 10:35:42 2014, special=0
7. document=7119614, weight=2574, tid=7119614, digest=0, displayorder=0, authorid=1946538, lastpost=Sun Jan  5 12:47:58 2014, special=0
8. document=7126922, weight=2574, tid=7126922, digest=0, displayorder=0, authorid=702620, lastpost=Wed Jan  8 12:03:42 2014, special=0
9. document=7142792, weight=2574, tid=7142792, digest=0, displayorder=0, authorid=15085343, lastpost=Wed Feb  5 11:28:42 2014, special=0
10. document=7149618, weight=2574, tid=7149618, digest=0, displayorder=0, authorid=702620, lastpost=Sun Jan 19 16:31:48 2014, special=0
11. document=7163844, weight=2574, tid=7163844, digest=0, displayorder=0, authorid=23516188, lastpost=Sat Jan 18 08:36:57 2014, special=0
12. document=7184213, weight=2574, tid=7184213, digest=0, displayorder=4294967295, authorid=702620, lastpost=Thu Jan 23 20:06:34 2014, special=0
13. document=7184247, weight=2574, tid=7184247, digest=0, displayorder=0, authorid=702620, lastpost=Tue Apr 15 18:21:35 2014, special=0
14. document=7199964, weight=2574, tid=7199964, digest=0, displayorder=0, authorid=702620, lastpost=Mon Feb  3 22:25:35 2014, special=0
15. document=7202349, weight=2574, tid=7202349, digest=0, displayorder=0, authorid=702620, lastpost=Tue Apr 15 12:41:43 2014, special=0
16. document=7213200, weight=2574, tid=7213200, digest=0, displayorder=0, authorid=11734808, lastpost=Sat Apr 12 22:03:55 2014, special=0
17. document=7226460, weight=2574, tid=7226460, digest=0, displayorder=0, authorid=6581011, lastpost=Sun Feb 16 21:02:46 2014, special=0
18. document=7237943, weight=2574, tid=7237943, digest=0, displayorder=0, authorid=3522150, lastpost=Thu Feb 20 19:10:51 2014, special=0
19. document=7241387, weight=2574, tid=7241387, digest=0, displayorder=0, authorid=11733214, lastpost=Sun Mar  9 18:39:46 2014, special=0
20. document=7244569, weight=2574, tid=7244569, digest=0, displayorder=0, authorid=3066764, lastpost=Sat Apr  5 18:31:09 2014, special=0

words:
1. '中': 13444 documents, 13716 hits
2. '国': 15152 documents, 16196 hits
```
 连接虚拟mysql
```shell
root@ubuntu:/etc/sphinxsearch# mysql -h127.0.0.1 -P9306
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 2.0.4-release (r3135)

Copyright (c) 2000, 2014, Oracle, SkySQL Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MySQL [(none)]> show tables;
+---------------+-------+
| Index         | Type  |
+---------------+-------+
| members       | local |
| threads       | local |
| threads_delta | local |
+---------------+-------+
3 rows in set (0.00 sec)

MySQL [(none)]> desc threads;
+--------------+-----------+
| Field        | Type      |
+--------------+-----------+
| id           | integer   |
| subject      | field     |
| tid          | uint      |
| fid          | uint      |
| digest       | uint      |
| displayorder | uint      |
| dateline     | timestamp |
| lastpost     | timestamp |
| recommends   | uint      |
| replies      | uint      |
+--------------+-----------+
10 rows in set (0.02 sec)
```

## 参考：
* <http://sphinxsearch.com/docs/2.1.8/installing-debian.html>
* <https://code.google.com/p/sphinxsearch/>
* <https://code.google.com/p/sphinx-for-chinese/>
* [Sphinx 之 Coreseek、Sphinx-for-chinaese、Sphinx+Scws 评测](http://www.wubiao.info/292)
* [中文全文检索Coreseek, Sphinx-for-Chinese, SCWS的使用对比](http://www.rockbb.com/blog/?p=221)
* [Sphinx中文分词详细安装配置及API调用实战手册](http://hi.baidu.com/gyc800/item/1b359ea3f656893c030a4ddb)
* [Sphinx PHP API Documentation](http://sphinxsearch.com/wiki/doku.php?id=php_api_docs)