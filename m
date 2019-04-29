Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15A9E2C7
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 14:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfD2MhQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 08:37:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37137 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfD2MhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 08:37:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so5102494pgc.4;
        Mon, 29 Apr 2019 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IFFzNMvg4aerENLfoVLpjXioHRtFuVQGNKde3eyKf2o=;
        b=kUzvsZgiT/vZOoQBDblCuDWc2xBq3/p/XLRYif4EdTRu7LHjaDHXFHZNHH4/WiyL49
         BFUATnWaUZUmmOML1cQDU3umMAgvywNPupBwmxJLiyaaGY/egWRe54BAx8NuORGVJV2h
         fUDYyQ0ugCVbo5DgO6ceY1VCOCNqGlx7yVArpylBWsVFAKyq1m13v2ZBMSRsFH+LfiZS
         pt43nKjYoYRAhcFJh0jX7FaGCwBu5kMopD/LI0SIW44J0aE2g2rL8T7PIDCrHfaT8Mmt
         hV4E2MRIz3DlQrVTfI3uWwNtlCuZumLIyF1yD4iwmBQ8uh+/44DIDdl5G7JmOnre55Jp
         D6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IFFzNMvg4aerENLfoVLpjXioHRtFuVQGNKde3eyKf2o=;
        b=IVaON24g7DP5BB7LMD8PUNx2NQ6/WOuaTZRWRPWsGIA51RxNd2ClwQ9FkmsGbkVAST
         mslbhss+97LrzSzgn2oBlb+hYDAudq16DjvQlEjmdUtSzdubGqSd6xFGShrkTBAFVES8
         7WjsgsvA79HQTl1iSkOBOwhWjxFsT5dQt8z2dDVi5IfVgkBxWrqnbD5CJN3SU5291ZzQ
         rLzVNb71G7Kp91L/mafUn+6v464vg4/Srlsj9zdOnEroDC6vtLzLXwnhEByj4DfDLDUU
         HDC+rCYymxXEhTrZqkgy7JbnIQzvQ+ZjooYch3uovftfMntPTqO3k6DIugdbuDjYbSyW
         1Ybg==
X-Gm-Message-State: APjAAAXB3Okqs8S1eCMO+nu2UQudZxzIHqXePUdP5wgXLRzvuVoi8G3M
        PHf0s3NVioiYFZ6DmUmiU+s=
X-Google-Smtp-Source: APXvYqz8WBIp2QXPGhZOJ8h2HONqwn9VJsro+NHjmts6JEem1OPzitZz3lO4ksu72pUB8WSIztA16Q==
X-Received: by 2002:aa7:8392:: with SMTP id u18mr64414760pfm.217.1556541435352;
        Mon, 29 Apr 2019 05:37:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j16sm43555013pfi.58.2019.04.29.05.37.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 05:37:14 -0700 (PDT)
Subject: Re: [PATCH v3 08/16] watchdog: imx_sc_wdt: drop warning after calling
 watchdog_init_timeout
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>
References: <20190419181601.7412-1-wsa+renesas@sang-engineering.com>
 <20190419181601.7412-9-wsa+renesas@sang-engineering.com>
 <20190429101558.6vyiospb6oqsstt7@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <616a9d4e-7050-a6c2-727d-f62e08d3d98c@roeck-us.net>
Date:   Mon, 29 Apr 2019 05:37:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429101558.6vyiospb6oqsstt7@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/29/19 3:15 AM, Uwe Kleine-König wrote:
> On Fri, Apr 19, 2019 at 08:15:53PM +0200, Wolfram Sang wrote:
>> The core will print out details now.
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>   drivers/watchdog/imx_sc_wdt.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
>> index 86c2722f2a09..6dc24ceb1b2c 100644
>> --- a/drivers/watchdog/imx_sc_wdt.c
>> +++ b/drivers/watchdog/imx_sc_wdt.c
> 
> This driver isn't in next, and I don't know where to look for it.
> 

Branch watchdog-next of
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git

>> @@ -117,10 +117,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>>   	imx_sc_wdd->parent = &pdev->dev;
>>   	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
>>   
>> -	ret = watchdog_init_timeout(imx_sc_wdd, 0, &pdev->dev);
>> -	if (ret)
>> -		dev_warn(&pdev->dev, "Failed to set timeout value, using default\n");
>> -
>> +	watchdog_init_timeout(imx_sc_wdd, 0, &pdev->dev);
> 
> One side effect is however that ret isn't set any more. So I wonder if a
> failure in watchdog_init_timeout() really makes the core print the
> details as expected.
> 

Sorry, I don't understand. The warning is printed in watchdog_init_timeout().
What does that have to do with setting ret here or not ?

Thanks,
Guenter
