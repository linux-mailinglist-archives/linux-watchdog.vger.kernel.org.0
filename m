Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4D524168
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 21:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfETTon (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 15:44:43 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:43266 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbfETTon (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 15:44:43 -0400
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4KJaYji009693;
        Mon, 20 May 2019 19:44:16 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com with ESMTP id 2skyg7sev2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 May 2019 19:44:16 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 6A84853;
        Mon, 20 May 2019 19:44:15 +0000 (UTC)
Received: from anatevka (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id C700B4D;
        Mon, 20 May 2019 19:44:14 +0000 (UTC)
Date:   Mon, 20 May 2019 13:44:14 -0600
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 13/46] watchdog: hpwdt: drop warning after registering
 device
Message-ID: <20190520194414.GA2740@anatevka>
Reply-To: Jerry.Hoemann@hpe.com
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518212801.31010-14-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-20_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200123
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, May 18, 2019 at 11:27:28PM +0200, Wolfram Sang wrote:
> The core will print out details now.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/hpwdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Jerry Hoemann <jerry.hoemann@hpe.com>


> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index db1bf6f546ae..e0ebfba50aab 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -321,10 +321,8 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  
>  	hpwdt_dev.parent = &dev->dev;
>  	retval = watchdog_register_device(&hpwdt_dev);
> -	if (retval < 0) {
> -		dev_err(&dev->dev, "watchdog register failed: %d.\n", retval);
> +	if (retval < 0)
>  		goto error_wd_register;
> -	}
>  
>  	dev_info(&dev->dev, "HPE Watchdog Timer Driver: Version: %s\n",
>  				HPWDT_VERSION);
> -- 
> 2.19.1

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
