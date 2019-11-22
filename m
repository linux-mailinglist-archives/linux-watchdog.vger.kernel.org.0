Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29474105E17
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 02:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfKVBQj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 20:16:39 -0500
Received: from cnshjsmin05.app.nokia-sbell.com ([116.246.26.45]:60792 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726329AbfKVBQj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 20:16:39 -0500
X-AuditID: ac18929d-49dff700000014de-85-5dd736f3c3c1
Received: from CNSHPPEXCH1603.nsn-intra.net (Unknown_Domain [135.251.51.103])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 90.DC.05342.3F637DD5; Fri, 22 Nov 2019 09:16:35 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1603.nsn-intra.net (135.251.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 22 Nov 2019 09:16:35 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Fri, 22 Nov 2019 09:16:35 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Guenter Roeck <groeck7@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWgVy1kREB4bw5dQ4u+4ZEezt20u///t7KA//7BtxA=
Date:   Fri, 22 Nov 2019 01:16:34 +0000
Message-ID: <a66f73ba253b41f8956eb85e3cc67a4a@nokia-sbell.com>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
 <20191121141508.GA13249@roeck-us.net>
In-Reply-To: <20191121141508.GA13249@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsXS/ts4Xfez2fVYg5VLzS32dV5nsri8aw6b
        xY11+9gtniw8w2Tx+OU/ZgdWj52z7rJ7rFyzBsj63sDu8XmTXABLFJdNSmpOZllqkb5dAlfG
        /6W3WQomC1ccPveGvYHxLH8XIyeHhICJRNv7CYxdjFwcQgKHmCQ2XjvADOH8ZZS4vuY7lLOJ
        UWLSt6tsIC1sAu4STZvWgdkiAmoSzada2ECKmAUeMEq8P7IXyOHgEBZIkfjSwQNRkyrxbcIB
        JgjbSuLlqy1gNouAqsTX3n5GEJtXwE5i0f8pjCCtQgJpEl//pIOEOQWMJE6vuMsKYjMKyEpM
        e3QfrJVZQFzi1pP5TBAfCEgs2XOeGcIWlXj5+B8ryBgJASWJvg1Q5ToSC3Z/YoOwtSWWLXzN
        DLFVUOLkzCcsExjFZiGZOgtJyywkLbOQtCxgZFnFKJ2cV5yRVZybmWdgqpeXn52ZqFuclJqT
        o5ecn7uJERh7ayQmzd3B2NkZf4hRgINRiYf3ReW1WCHWxLLiytxDjBIczEoivHuuX4kV4k1J
        rKxKLcqPLyrNSS0+xCjNwaIkztsyeWGskEB6YklqdmpqQWoRTJaJg1OqgVF0wzel59+iXU64
        bv0qpzA1Y+HJRdqh/6dmMhaEGioeOuhxMbLHqrXkdvU0feWvU0W4lRlXMkrtOdWYzaR6ou1t
        /pEfn/9K3ONaVbGzzIfV6tnHMN34FdKrb+96ovtHKcrhQVtizeT7xz84Fe3bXDnHqSHzx2r+
        7XZLJNTX1Ns+nagjUZWRuEmJpTgj0VCLuag4EQCPDo//uQIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Roeck, thanks for your time to guide me to finish the review. Do I need to re-send a mail with your sign?

Peng Wang

-----Original Message-----
From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter Roeck
Sent: Thursday, November 21, 2019 10:15 PM
To: Wang, Peng 1. (NSB - CN/Hangzhou) <peng.1.wang@nokia-sbell.com>
Cc: Guenter Roeck <groeck7@gmail.com>; wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: make DesignWare watchdog allow users to set bigger timeout value

On Thu, Nov 21, 2019 at 10:35:12AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> From aabaa4b709bd451e566c906e8d1dca48f92f9b12 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set 
> bigger  timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout 
> value than HW can support, make DesignWare watchdog align with this.
> 
> ---
> 
> v2 -> v1:
>        - use top_s to compare with wdd->max_hw_heartbeat_ms
>        - update wdd->timeout in case it's greater than HW supports
>        - fix comments error
> 
> v1: initial version
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/dw_wdt.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c 
> index fef7c61..12c116e 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	/*
> +	 * In case users set bigger timeout value than HW can support,
> +	 * kernel(watchdog_dev.c) helps to feed watchdog before 
> +	 * wdd->max_hw_heartbeat_ms
> +	 */
> +	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	else
> +		wdd->timeout = top_s;
>  
>  	return 0;
>  }
> --
> 1.8.3.1
> 
