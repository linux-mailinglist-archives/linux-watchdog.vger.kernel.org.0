Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2134687E86
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Feb 2023 14:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbjBBNWw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Feb 2023 08:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjBBNWi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Feb 2023 08:22:38 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5590C8E4AC
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Feb 2023 05:22:35 -0800 (PST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312CCHHR027602;
        Thu, 2 Feb 2023 13:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tCCyLaU0+8zdwihibDiHBN8tUCNo8SwFvEHIgF9lhN8=;
 b=r+Lqk0DVRfietPStb1NbEA4/aPp/LwexLJnqL3Fi7eA1TYJXL4tOY75ncM5KWeMvRY4H
 XWR9RgiSfLU07rp80fMMf7+hOfglgG1Kd8ggfhCnSVr2wgEB9njntQNN107SFLmGfFXe
 VwZX1V8UpyS9A5dOGsDA0VN82K+XlL8EY2pt1yhI9AZ99Cp75a8TrpFJ8VWUOsruukKC
 8aBlSB3nyWUqE5ZVCRsA4eL1xG0BHBekAhGoRLT0iIe7GlbpmwbW/0IfDrCMkm4A+gui
 EYUQ2MabGNsP1WtIsSc9asfAeWn7tFOgN6+w3L60EklI8cz6ZOiOPKgxOdpO2uZ/L6yY EA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngcjdj9ps-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 13:22:11 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3129bQOf025999;
        Thu, 2 Feb 2023 13:22:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
        by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ndn6ubq8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 13:22:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
        by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312DM71u42992012
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 Feb 2023 13:22:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A25082004B;
        Thu,  2 Feb 2023 13:22:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 51D8320043;
        Thu,  2 Feb 2023 13:22:07 +0000 (GMT)
Received: from osiris (unknown [9.171.31.155])
        by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu,  2 Feb 2023 13:22:07 +0000 (GMT)
Date:   Thu, 2 Feb 2023 14:22:05 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Subject: Re: [PATCH -next] watchdog: diag288_wdt: use kmemdup() to allocate
 memory
Message-ID: <Y9u4/amCdKDz5L2J@osiris>
References: <20230202074127.4108100-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202074127.4108100-1-yangyingliang@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _yV0hJyoY4Yp9_I3GzxQ8HjCDthQtbX6
X-Proofpoint-GUID: _yV0hJyoY4Yp9_I3GzxQ8HjCDthQtbX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=690 adultscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020117
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 02, 2023 at 03:41:27PM +0800, Yang Yingliang wrote:
> Use kmemdup() helper instead of open-coding to simplify
> the code when allocating ebc_cmd.
> 
> Generated by: scripts/coccinelle/api/memdup.cocci
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/watchdog/diag288_wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, but this code will be changed differently with the next merge
window. Therefore I will not apply patch.
