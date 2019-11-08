Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A6BF5338
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 19:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfKHSGT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 13:06:19 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:57756 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726446AbfKHSGS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 13:06:18 -0500
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA8I23Rl000866;
        Fri, 8 Nov 2019 18:05:21 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 2w5d0sg54m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Nov 2019 18:05:21 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3427.houston.hpe.com (Postfix) with ESMTP id 06C3A6C;
        Fri,  8 Nov 2019 18:05:20 +0000 (UTC)
Received: from anatevka.americas.hpqcorp.net (anatevka.americas.hpqcorp.net [10.34.81.30])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id BECA94F;
        Fri,  8 Nov 2019 18:05:17 +0000 (UTC)
Date:   Fri, 8 Nov 2019 11:05:17 -0700
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: aspeed: Fix clock behaviour for ast2600
Message-ID: <20191108180517.GB150483@anatevka.americas.hpqcorp.net>
Reply-To: Jerry.Hoemann@hpe.com
References: <20191108032905.22463-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108032905.22463-1-joel@jms.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_06:2019-11-08,2019-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=4 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911080176
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 08, 2019 at 01:59:05PM +1030, Joel Stanley wrote:
> The ast2600 no longer uses bit 4 in the control register to indicate a
> 1MHz clock (It now controls weather this watchdog is reset by a SOC
> reset). This means we do not want to set it. It also does not need to be
> set for the ast2500, as it is read-only on that SoC.


s/weather/whether/


> 
> The comment next to the clock rate selection wandered away from where it
> was set, so put it back next to the register setting it's describing.
> 
> Fixes: b3528b487448 ("watchdog: aspeed: Add support for AST2600")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/watchdog/aspeed_wdt.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 4ec0906bf12c..7e00960651fa 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -258,11 +258,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	/*
> -	 * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
> -	 * runs at 1MHz. We chose to always run at 1MHz, as there's no
> -	 * good reason to have a faster watchdog counter.
> -	 */
>  	wdt->wdd.info = &aspeed_wdt_info;
>  	wdt->wdd.ops = &aspeed_wdt_ops;
>  	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
> @@ -278,7 +273,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	config = ofdid->data;
>  
> -	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +	/*
> +	 * On clock rates:
> +	 *  - ast2400 wdt can run at PCLK, or 1MHz
> +	 *  - ast2500 only runs at 1MHz, hard coding bit 4 to 1
> +	 *  - ast2600 always runs at 1MHz
> +	 *
> +	 * Set the ast2400 to run at 1MHz as it simplifies the driver.
> +	 */
> +	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
> +		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
>  
>  	/*
>  	 * Control reset on a per-device basis to ensure the
> -- 
> 2.24.0.rc1

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
