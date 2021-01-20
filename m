Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DDE2FD7AA
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 19:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729549AbhATSBI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 13:01:08 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:26272 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389189AbhATRyG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 12:54:06 -0500
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10KHmqet026688;
        Wed, 20 Jan 2021 17:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=ymDPOgzNepWEMEbR41VTy3kWpcvb58iGsN9KkgiPEdY=;
 b=N9LiUe33vhpott9z5PueuzquizzLBM79h1m0FJG+0cORPYMuW1KnpFXSyH9bvcsbJ4Ww
 MaXo6kGfyqGIKrzzb7Ymeho1rsT4R+r9pkRRSIV0QGaVkR5E7WwgaoxWEXvVgu6gCUpt
 mNAn3IYXDBMrVkLfZuOAqoyjFVyPpDp3GdqmOl6n9sdIrveCzVI7JwAiXpKUxYDaa7Jq
 kTc42nAuANOr8RGa4A+ePYmjUdbzb4090QL2l7qWWLQFJS5azM0IGWIC+UnbUhUrvxwx
 BNhF4fyRmPTADUq4zNETyV8FcC6XykeErWAH7JKfOomJzXhhcIN5VyjG4eefco1FbGPx oQ== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 3668r5qs4m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Jan 2021 17:52:51 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3427.houston.hpe.com (Postfix) with ESMTP id BA4BF6A;
        Wed, 20 Jan 2021 17:52:50 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (anatevka.americas.hpqcorp.net [10.33.237.3])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id D63384B;
        Wed, 20 Jan 2021 17:52:49 +0000 (UTC)
Date:   Wed, 20 Jan 2021 10:52:49 -0700
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog/hpwdt: Assign boolean values to a bool variable
Message-ID: <20210120175249.GW594882@anatevka.americas.hpqcorp.net>
References: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-20_10:2021-01-20,2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200104
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 03:48:10PM +0800, Jiapeng Zhong wrote:
> Fix the following coccicheck warnings:
> 
>  ./drivers/watchdog/hpwdt.c:345:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> ./drivers/watchdog/hpwdt.c:126:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> ---
>  drivers/watchdog/hpwdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>


> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index cbd1498..22ddba3 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -123,7 +123,7 @@ static int hpwdt_settimeout(struct watchdog_device *wdd, unsigned int val)
>  	if (val <= wdd->pretimeout) {
>  		dev_dbg(wdd->parent, "pretimeout < timeout. Setting to zero\n");
>  		wdd->pretimeout = 0;
> -		pretimeout = 0;
> +		pretimeout = false;
>  		if (watchdog_active(wdd))
>  			hpwdt_start(wdd);
>  	}
> @@ -336,13 +336,13 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
>  
>  	if (is_kdump_kernel()) {
> -		pretimeout = 0;
> +		pretimeout = false;
>  		kdumptimeout = 0;
>  	}
>  
>  	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
>  		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
> -		pretimeout = 0;
> +		pretimeout = false;
>  	}
>  	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
>  	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
> -- 
> 1.8.3.1

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
