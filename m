Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE650590BD0
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Aug 2022 08:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiHLGI3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Aug 2022 02:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbiHLGI1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Aug 2022 02:08:27 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE95A4B2D;
        Thu, 11 Aug 2022 23:08:26 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27C4xiE3011282;
        Fri, 12 Aug 2022 06:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=MfNkTAG+7dJApclP3L+XM1h1WjfN+Q42xPoX9lsm1Wo=;
 b=RNv6l9LouBFVgeiCrqwlczz1OszuacnUHECSldCb85K7fnvlcAiij1M63ZJMDUEjVTqF
 VhNxh/NbrDz6YorBBjmZ2deWAY8+SSpdX+6yUj7JivAoT7WUrFOjoKs0qusoMuEtZUJl
 iicC/IaK2OFp/5CPB2vMBvffuO5Hl4H/utfdJfm+fsiDEI1gAiwC/9JdrEwwMuAv6jcO
 y1Tmqh0v5EvVApFBrpd1ByQ9j/9bPz5/s36gg9m5pqLAqSNXUQ0dCopcLnofjCHhA820
 SZRLF/Lz9oPFEGrpriPJUda6PDA8RxuDEsuOoZnhzzJutdGuCG5TFFXc97s9IcTuVunf Pg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwq9pdbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Aug 2022 06:08:10 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27C4nNU7020454;
        Fri, 12 Aug 2022 06:08:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqkc8dj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Aug 2022 06:08:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMocGZjNejR2ydTkwdzIPd+mn7pD3naF/QVUkstdPUCjc/Ke1+dzPqipQ+jF/Jm3a7Xg/CArsiPlKSOeNgAyckn5ur6ovIJsEMZLxXzEL2lJUrf8VNLOlvnh5N9a6fd1DK02GkavqA/4+/xdWPpb948E1rwQCxIfRTJ1LkrnKa848f3cD9s0oNcLrfP7qOsqSnpzTKRaVr3X8iej6sQKKYQl/IGmFdJTMiPSwVknYf6wuncW+RVBV09FjyskBczQG14qwQ8OIuol7zi59VCdFFs+gKfpR46UP3PIlLLEl4VEA5/YBAwffaBiyqN6HtZy7L7Cpr8r3TUXHjpHOM0LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CK2JdT0X0NXxT0v/HqxMelK7550ijZZijoBhoxzzmk=;
 b=IHcqCdk4faNOv5wCQjwDAR46hb9ux/pSFc8e9qPmFbTrkWooUR0/S21myT/COzM5nAkOXTMSpKCurywcVFVFv61FSTwVoSmkqD6TnAX8hJnX8+uGunIksjKH7v5bnrQ9FYJC1oR9hJf5K2q0xq3jk0cuMZ9Nd6AYepfyc3HYTdxb620UYo1rxPx4NEIDryXKOcvumZERZYpoXAM/dBkdQfaYhFyga8c8aq9kg2vb2pxghlvxHKARLJ5edR/Nrjs7Y8QyKNBBV5uIEHHb7xrld3Ig+q2i/vgtkIYOLFME1xy4td9mdjy1PD6oOc5zIf6BJozaGNy9GaI+yNWqvkmBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CK2JdT0X0NXxT0v/HqxMelK7550ijZZijoBhoxzzmk=;
 b=E8Q3/gjysnr3wlcOD7Tbm4lJBS8GgmBn3R9+IHlq2dcMb8RckI+zwrzwd/lfSXvvVXilcjb9OQ3Nr8YGhPxosHcl5HniTsY9Zwxtwxc0UUKcY+eVcG/M2RZKcwFHwVg0I42GQSfbUJFHraHVGpfXXmKsCyfpeQs9z5vBCQHyv+E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2250.namprd10.prod.outlook.com
 (2603:10b6:4:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 06:08:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Fri, 12 Aug 2022
 06:08:07 +0000
Date:   Fri, 12 Aug 2022 09:07:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Message-ID: <20220812060748.GX3460@kadam>
References: <YvTgRk/ABp62/hNA@kili>
 <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a5790cc-5a7e-410a-e81b-08da7c29065c
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2250:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kt5aXI0BW8QEarLc+MhD+GTwMwqWusBeWh+w+P82GieCDvrzB2s8fuYJTBRF8JjhsoDP/l5gGDkLZJorK7DLEVC9x4WO7HLRVBeyN/pBhP7aunpQ0Owvb/Q7rPGAYAWA0OdCoHfyEIUBUf8cVk3can4JHyiVmMj2DimVBkfVbSDy2AwjEy6NiMk9A8CsmcyjpiHvysIuxBjYLGeePdfISmVSLes9dqdyamngYlUPZVhEmL3ZGr89BHr0a3DxDiEt5qm4StMndOMkyk+mf3nTuOybXozISJRz6u6g+gyx1EsdafQnUGc4ZaX0DYFkDMomCwBSg9khDeimkqZ+9nQ9yDKfoJFlGKJZt2VqT9BOOOKi1MNrkrxdi12CQgj51qGJT9zO9cLw0kOw1X9Uz/kQgzsLPmQw+4VCn8BLI7sns1lEP8T/Un05pDm2I7FedX5UmOxYId3vyftZ4Pk99XmViPXYML1Rfsn0afNHYtpKPvPvr08UVRTK59ZGt3CvcjygAyPrc83nea+q1p4Nr1K2IaR0gMaqfqfAJHyqpVAZx7b6BzHl6ACJ8gRRtkhYru4KzX3Pc6VoIEuvHyvC98K18eorLeg+nzU1DSPWTRP2FcXRkGEwjvHevMy9M3pJZhbyt1fZztoOmd+tFqYsbaz+uZrfCpQOBLcy30NLZn26Vn65mnMaAnP3YNs/0+1vI2CrmaMvQ3gN91w7sbhn724e4usM+fD1G9Uo5rQqCu+oZTRJ+j8SxfD8M0wHkXnG/zuiwONM/sF3mI8VO/NxAt2i6M0QIa2KKHda4NAl3hNK75k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(376002)(346002)(366004)(396003)(136003)(38350700002)(6666004)(6512007)(26005)(8676002)(38100700002)(66556008)(52116002)(66476007)(66946007)(4326008)(6486002)(478600001)(6506007)(316002)(41300700001)(9686003)(54906003)(33656002)(2906002)(33716001)(1076003)(186003)(66574015)(5660300002)(6916009)(8936002)(86362001)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+3OI2SExZdMMuQxCqhj8dJ1Xyp46Z3tC6yvCwMuuanOB8XH4sf3U2gICR/?=
 =?iso-8859-1?Q?Y6vahBKev8xzPLl/gE937m+81cKWXoLf/fWbl4FA+x7KxWDL2XiwviEEZj?=
 =?iso-8859-1?Q?DnEnoKb9hgIGoryOa3W+mMoxmYQvyG+r5/K4SpiVZpTnGTh7Wl/SzTu3vo?=
 =?iso-8859-1?Q?nsXuc5BS4zZeFOC2YB2X3XC9mcZCRrz/URuNzlTPJGrYwbg2/s61ZGo+5i?=
 =?iso-8859-1?Q?lZd1sLA6kPyRtC4HvRm4IHKe3Od5igyTP9MDdBTYQuqS09hrIbULy78Acw?=
 =?iso-8859-1?Q?JZZPKMQ8J2E8981YrJAM+7d+rL8g1O65hFK0hJ/mv52H2huWbreGvGuZkp?=
 =?iso-8859-1?Q?1i1E5KdP6SkahamcgZI5s2LIop1rZaK+G6qQ8c8q6eRj946jvo3i36lXWY?=
 =?iso-8859-1?Q?kos+uSDfT0VZ6OMVlUNKAiFtdM8aXqIhfcxlJIFjmquhgTDiGJbDEwxcqg?=
 =?iso-8859-1?Q?F4Zda4Ef79HHnkQKiHW2EieGRWIcZuaIuZ/IrlmWy7jFArdY+aTAzm5P1r?=
 =?iso-8859-1?Q?Mq7rWWcW+IVCQJdl49WPm3+sAJ1SlxN7egq9cfUOx89FbE8UNISbjTaIaW?=
 =?iso-8859-1?Q?3fmFi8yLFPp5WdzaELNwmvUe5hDO2aZnDD5Cfbls0B0RatHWX8OO/XnogK?=
 =?iso-8859-1?Q?UFH5XN5Efzf8F9GZkUl/shpbcsnV3JpFYnAH/6t6Lflh59XcKlGakrtl+i?=
 =?iso-8859-1?Q?xgwdQ/VHOa/gROi2gTzywPy8hyKoE6umwNdt5zIpMYjIk76AmcZMlwTgqF?=
 =?iso-8859-1?Q?Qczd26h6AeP6ESb0+1XVnPb5UBR4y7x34oucne/3UWdGjjaUxwluYKqq8x?=
 =?iso-8859-1?Q?jkE42/RWPxY0nw+rC0WvW4vKoMqa9La7CxMhW1mDYPp53duWjeUqIqGLQX?=
 =?iso-8859-1?Q?rw4mhUdY31+0zHd/oofrcMnzHuD/1N+5NcfY1DapTjdq7FSN2JqBc9Kyz+?=
 =?iso-8859-1?Q?F43G8UbLFviFmvBXIx0mBjeWvqy2oER/NwsJxWFYYJXGiBM5wNaj+Ox7of?=
 =?iso-8859-1?Q?Aheci+KB0rKDSOODjVFe7ZsMq7Cg8xS0VepF3ompgFI7PZiLzmWoxifZuQ?=
 =?iso-8859-1?Q?fMmEFdjJbus1LXbrB/OIphc+6teO+B37ll3gHzMvE/WUPXRbn8W9rnLhpB?=
 =?iso-8859-1?Q?ORLrXt7xSBsnN0HgoT6iPtfFeuJMbigfgZloWxia0Vq3FL0fHPZH3PDcK8?=
 =?iso-8859-1?Q?7JbGhuk4mnD3dhpj8Ty4Ry3z0hkC+VgCrpVyix8tKvl+qecMyzLTzKyGNC?=
 =?iso-8859-1?Q?q7h8hX2jn0Gbb/Re9HaLx72SAew+KfzvCkEhEtPG+K/rKInQ6wPLjOdNj7?=
 =?iso-8859-1?Q?n1u3y4kfukKTdPBfjwxepIHxzKqjSwg6Dv07GXtRJM8IQ0pNXuTarzmY/2?=
 =?iso-8859-1?Q?xA5UsC19lM11r4sWvHM1WJjft/G0mDVu5GS5MSA0EBdBFnZJfD0pIfhvJp?=
 =?iso-8859-1?Q?JW2YcNi6KVWD8C8S7cv3FOaCM3MCPyw4zUSNvvnQlE4RSy/0y1bKXfOxTY?=
 =?iso-8859-1?Q?m3m1XeT86P3ZAa9GJKaXyEW7/zJpJ3M+GId9GfXevf/xELe5iOjYRvRlww?=
 =?iso-8859-1?Q?u/4nVxjwrNo+K6o0lUHADQrp/F6kdvcOupK0M+4aeQBfryIqQKqp7AP5zp?=
 =?iso-8859-1?Q?/IrL1Vy/oOQWA3TmBPM07RzBscwlspO45aTme2mFDLyvL5Yk+8YSvZVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-8859-1?Q?Q2ol0M2NK5R1j2MkzrTkD923COdoWQFp4pAdBa9URB802XXZ+ItRg6QxMR?=
 =?iso-8859-1?Q?w/SBu5rkoDfYOh9rI5ams9m7DbQfYa3Xm6GhbJZ0L4vbPPHqpnglKMg7/4?=
 =?iso-8859-1?Q?Goc9UJn6MuX5F9rkA1cv0fUfG4vcT9X9Co1MgJbiNgd17CFApVMFUFH/66?=
 =?iso-8859-1?Q?S5EKarLGe7TY5ErqbrXYKnlg+PW7Ur9dxSGDoW5cbFmjx0WezJKOpiWuRL?=
 =?iso-8859-1?Q?PAqU+lm7nEgXAs8YeywlE6qOm3/uf4o5qf8+az7J68gCQzW6a4u5PtoqhT?=
 =?iso-8859-1?Q?AG+Lg4FSBeZmX0XFHa8mfZZY1V2uZkCwhPKaA6WTd2SOyNSsN/SK5HWAIN?=
 =?iso-8859-1?Q?j7yTiyTSoe6KOudX1etLaF2R4ShvhbLI2sZZKld6Uaep71ADlKQ/Q4cgd4?=
 =?iso-8859-1?Q?hGxKeykvWOdqrqZGNWN4fjSuQ8GvWT+jumnlAnHWCLZR/OX9s630EKscU4?=
 =?iso-8859-1?Q?vieuUyxF+/DnEw2Mo9NjgyHzLCJNuu92HkVSj+9UwRtWIvMpV7Fwpq0tTO?=
 =?iso-8859-1?Q?3CqRwt1DxNtevwvRpIu/h3gQk/XpnTPmZOeaxCK11FAKkJjqkMeQ/qj0xn?=
 =?iso-8859-1?Q?1SnW1V2wj01hRdmMIrs7h6peKpR4pvA60KJ/vKatt3PzJSqDK9hAbl2koZ?=
 =?iso-8859-1?Q?soxhb2NcVMzbvDIEGpWaPBQ5fQf9BE2I0dnB2pRGnDRWbjiImjae+tuCYw?=
 =?iso-8859-1?Q?YDHETlLbvDEQHNgBHOKdVFQlYI7DIYck0h0F/iL3arHw+B+9z6r4Z87XGD?=
 =?iso-8859-1?Q?NCtE4DgyxIGfc3ehLBRRKh1MMuR11rU0tStSKRaqTUqg6hR7z+QUJv5MtR?=
 =?iso-8859-1?Q?XBIfX5ERCjFw6YHAYdM09BlIQHnKYKHc3bHtDtWCHw1kYMN+eQKsNfozEF?=
 =?iso-8859-1?Q?to5+TAVOZu0mCcaTaq25sUQD6vKKL++ZPgMQ+6gV9dJyFWTyeNpYtnWxGs?=
 =?iso-8859-1?Q?MiAdNyI3sxf1/h5rwnBjVQ06r3qYdTYCqBH9KE/wMllA4Gp0h3jn6tqczd?=
 =?iso-8859-1?Q?4hMSR7d4tqDLGZNVD3Vbsuyf1qz9NLty22tiWBjXSGH432Q6BtM1mqhNO8?=
 =?iso-8859-1?Q?7jR+9oJQoel2kqDwwxIl0Li8W4BE89c2a2fcpOxW4PL6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5790cc-5a7e-410a-e81b-08da7c29065c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 06:08:07.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBoLyi9VzF0aBR0ztEbqd59cDzCkKZ3H7xNFiNiCU2aeZB9y7TgOKFK3vgkcQwWUcFxyvBnJ8S/N3gokjf91TbfLea7oHXqdarDa62SwKi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2250
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_04,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120016
X-Proofpoint-ORIG-GUID: U4iL-seILk3pcF9d-bNJ1jj8ZJRKuup8
X-Proofpoint-GUID: U4iL-seILk3pcF9d-bNJ1jj8ZJRKuup8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 11, 2022 at 10:52:13PM +0200, Christophe JAILLET wrote:
> Le 11/08/2022 à 12:56, Dan Carpenter a écrit :
> > This code assumes that platform_get_irq() function returns zero on
> > failure.  In fact, platform_get_irq() never returns zero.  It returns
> > negative error codes or positive non-zero values on success.
> > 
> > Fixes: eca10ae6000d ("watchdog: add driver for Cortina Gemini watchdog")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/watchdog/ftwdt010_wdt.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> > index 21dcc7765688..02112fc264bd 100644
> > --- a/drivers/watchdog/ftwdt010_wdt.c
> > +++ b/drivers/watchdog/ftwdt010_wdt.c
> > @@ -156,7 +156,7 @@ static int ftwdt010_wdt_probe(struct platform_device *pdev)
> >   	}
> >   	irq = platform_get_irq(pdev, 0);
> > -	if (irq) {
> > +	if (irq > 0) {
> >   		ret = devm_request_irq(dev, irq, ftwdt010_wdt_interrupt, 0,
> >   				       "watchdog bark", gwdt);
> >   		if (ret)
> 
> Hi,
> can't platform_get_irq() return 0?
> All the paths in platform_get_irq() look like 0 is a valid value.
> 
> The other patches you just sent are "< 0 ==> error", so ">= 0 ==> valid"
> 
> Any reason here for >0?

It can't really be zero.  On some of the other patches there was a tests
failure and success.  So if we're testing for < 0 then a test for >= 0
felt more complete.

But here it was like, testing for > 0 won't break anything that isn't
already broken.  It's easier to review.

Somebody has a Coccinelle test for:

	irq = platform_get_irq(pdev, 0);
	if (!irq)
		return -ENODEV;

But I implemented it in Smatch just for fun.  It turns out people had
introduced a couple new bugs recently.  Also the it appears that their
Coccinelle test does not warn about for success tests like this one.
And there are still a bunch of test that do:

	if (irq <= 0)
		return irq ?: -ENODEV;

But testing for zero is dead code so I didn't bother cleaning it up.

regards,
dan carpenter
