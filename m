Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53141590C6A
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Aug 2022 09:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbiHLHWP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Aug 2022 03:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiHLHWO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Aug 2022 03:22:14 -0400
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr [80.12.242.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE3FA4B10
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Aug 2022 00:22:14 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id MOzjovI48sfCIMOzjocC6u; Fri, 12 Aug 2022 09:22:12 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 12 Aug 2022 09:22:12 +0200
X-ME-IP: 90.11.190.129
Message-ID: <dcf0d8b1-40c3-ca67-5416-1da56b507857@wanadoo.fr>
Date:   Fri, 12 Aug 2022 09:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Content-Language: fr
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <YvTgRk/ABp62/hNA@kili>
 <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
 <20220812060748.GX3460@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220812060748.GX3460@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le 12/08/2022 à 08:07, Dan Carpenter a écrit :
> On Thu, Aug 11, 2022 at 10:52:13PM +0200, Christophe JAILLET wrote:
>> Le 11/08/2022 à 12:56, Dan Carpenter a écrit :
>>> This code assumes that platform_get_irq() function returns zero on
>>> failure.  In fact, platform_get_irq() never returns zero.  It returns
>>> negative error codes or positive non-zero values on success.
>>>
>>> Fixes: eca10ae6000d ("watchdog: add driver for Cortina Gemini watchdog")
>>> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>    drivers/watchdog/ftwdt010_wdt.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
>>> index 21dcc7765688..02112fc264bd 100644
>>> --- a/drivers/watchdog/ftwdt010_wdt.c
>>> +++ b/drivers/watchdog/ftwdt010_wdt.c
>>> @@ -156,7 +156,7 @@ static int ftwdt010_wdt_probe(struct platform_device *pdev)
>>>    	}
>>>    	irq = platform_get_irq(pdev, 0);
>>> -	if (irq) {
>>> +	if (irq > 0) {
>>>    		ret = devm_request_irq(dev, irq, ftwdt010_wdt_interrupt, 0,
>>>    				       "watchdog bark", gwdt);
>>>    		if (ret)
>>
>> Hi,
>> can't platform_get_irq() return 0?
>> All the paths in platform_get_irq() look like 0 is a valid value.
>>
>> The other patches you just sent are "< 0 ==> error", so ">= 0 ==> valid"
>>
>> Any reason here for >0?
> 
> It can't really be zero.  On some of the other patches there was a tests
> failure and success.  So if we're testing for < 0 then a test for >= 0
> felt more complete.
> 
> But here it was like, testing for > 0 won't break anything that isn't
> already broken.  It's easier to review.
> 
> Somebody has a Coccinelle test for:
> 
> 	irq = platform_get_irq(pdev, 0);
> 	if (!irq)
> 		return -ENODEV;
> 
> But I implemented it in Smatch just for fun.  It turns out people had
> introduced a couple new bugs recently.  Also the it appears that their
> Coccinelle test does not warn about for success tests like this one.
> And there are still a bunch of test that do:
> 
> 	if (irq <= 0)
> 		return irq ?: -ENODEV;
> 
> But testing for zero is dead code so I didn't bother cleaning it up.
> 
> regards,
> dan carpenter
> 

Got it, thanks.

CJ
