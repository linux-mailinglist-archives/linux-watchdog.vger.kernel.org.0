Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CB6687F86
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Feb 2023 15:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjBBOGy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Feb 2023 09:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjBBOGx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Feb 2023 09:06:53 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E78865F3F
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Feb 2023 06:06:53 -0800 (PST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312CpUGG025987;
        Thu, 2 Feb 2023 14:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=PWaQu7PQIzoVnhcVLcR6ehL881Hc0XuL7GGYbTDpuxo=;
 b=kCUje1+4JC7yHr4q6iqbnmmYXGTjvI0HFP2/w10lzDoRGXjy+zBymd/tZFfTkyz7UXRB
 e74aSct+nnazoqkZBqyoiHJCySgKKpQw8BPI+jax22sSZ6TwZW6TaF1BQwUVJQNmNVdM
 EvPcW3r9xIRYtA3Fe7ftKwzrFxhZN9zA653oMLC3jOr9wRv2isN2XFSm/E0irLaRlqRw
 P8uwhUfiBhRcYJ1l6/Qt7A/tBBNudCcbEQbu0ARbuN4DPzkK6zy+4ThIL1wGcgKpdv3o
 OcoezbxOFA9CyK+pLCK2dIKzSOgQJy4TDZt8/I68GszQRmSOt7RErjksV4uAVdihF2TW uA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng94yrv3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 14:06:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312Cug46014744;
        Thu, 2 Feb 2023 14:06:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
        by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttx8pg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 14:06:28 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312E6QFG45744472
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 Feb 2023 14:06:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 853CD20040;
        Thu,  2 Feb 2023 14:06:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4BF4120043;
        Thu,  2 Feb 2023 14:06:26 +0000 (GMT)
Received: from osiris (unknown [9.171.31.155])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu,  2 Feb 2023 14:06:26 +0000 (GMT)
Date:   Thu, 2 Feb 2023 15:06:24 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH -next] watchdog: diag288_wdt: use kmemdup() to allocate
 memory
Message-ID: <Y9vDYOxWqAvva3hL@osiris>
References: <20230202074127.4108100-1-yangyingliang@huawei.com>
 <Y9u4/amCdKDz5L2J@osiris>
 <6f80303d-fe26-a2af-a1fa-e99c00da9a81@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f80303d-fe26-a2af-a1fa-e99c00da9a81@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FHpBquyvqy1mRsHDQMxr5-A7Gnha7Cz1
X-Proofpoint-GUID: FHpBquyvqy1mRsHDQMxr5-A7Gnha7Cz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=581 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020126
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 02, 2023 at 05:35:40AM -0800, Guenter Roeck wrote:
> On 2/2/23 05:22, Heiko Carstens wrote:
> > On Thu, Feb 02, 2023 at 03:41:27PM +0800, Yang Yingliang wrote:
> > > Use kmemdup() helper instead of open-coding to simplify
> > > the code when allocating ebc_cmd.
> > > 
> > > Generated by: scripts/coccinelle/api/memdup.cocci
> > > 
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > >   drivers/watchdog/diag288_wdt.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > Thanks, but this code will be changed differently with the next merge
> > window. Therefore I will not apply patch.
> 
> It looks like you decided to bypass even sending your patches to the watchdog
> mailing list. I know I have not been as responsive there as I should be,
> but that it no reason to bypass the maintainers completely.

This is s390 only code which is broken. I doubt that anybody cares
about s390 specific inline assemblies.

But yes, besides that you are correct.
