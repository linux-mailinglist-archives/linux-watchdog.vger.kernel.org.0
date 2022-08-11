Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB8C590850
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Aug 2022 23:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiHKVtG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Aug 2022 17:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiHKVtF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Aug 2022 17:49:05 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F589F756;
        Thu, 11 Aug 2022 14:49:04 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s206so18230808pgs.3;
        Thu, 11 Aug 2022 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=UntAa4zFQ3cQGGi1i7kPpZYC1O22iBUgC7sLjjOH6DU=;
        b=bF7NMduXlaHbQQoBo+nrsUalCGto42gVrOEU29zvWsnSokh+dAL25YmlZ+ctPCucPI
         JMyLZ6rbz6ETiE0651rYrzldk5C79ps8EM2io91BrOJnk6Mq2/T1GEjYEzMR/uNgzfH4
         i0HmVtZO3aZiiGW8sI7GabgpnQYLZIKggE2C1S1xriboWXbswPneykDKhz79Yb/oq2ff
         FI1pV5XCJD2oENsLskz6KoU3LnUg3K+tkadqKNJH1j9M7m3B1MeVnXPk9avMiT8p3ReI
         37ySPVeoXMNSnPLhPTk2k+Wab/5mKecfdny9S1M/t77HghD5pKofaTYyfdvbg8VRZEyt
         Am3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=UntAa4zFQ3cQGGi1i7kPpZYC1O22iBUgC7sLjjOH6DU=;
        b=YicYk9Ti0eUjoRwRtRcEI4zxPptFbCywwFogHXxWRV4hxr6PUg606S4iV8eg1g+BI7
         RyZIT9VmTFyDnL006sK1KUzcOCd7CVfGKkVzUYE8LwT3psASiTkh55ifbr7Dk2POXa4y
         16JxwPwhIZDwwhL430Dv/6dAgTB73llqExkz5XdjgWy7g6MBcJhy4bvukaMTYZWzrJNR
         OMBBiKCuQkH10ILByjnqxhD9nM8UcNd0wJH35S/xh50pDLgZ1LGk+T7T3VH0wNdTIXoE
         EJfR9OYSlpBBeQVrqaIX2eozgOV4TKxgYqCQABfqBj/8ur89pe7MIwUUh7erVzMdEHk7
         PByQ==
X-Gm-Message-State: ACgBeo1WbhofXZniWyS08tXJsUEqQuBIU06f5u7kUMLQbQVlB8PMX5dk
        JaM2gdgKlidjZrX67YdsUYY=
X-Google-Smtp-Source: AA6agR5bvJWvB9X1o9CHJ+49jVkxmG1woDaZJ/jdz52qgqUIN0EdECaLx15L1ZbY/WaAH3UG7wntoQ==
X-Received: by 2002:a05:6a00:15d2:b0:52e:b5fe:8fa9 with SMTP id o18-20020a056a0015d200b0052eb5fe8fa9mr988582pfu.30.1660254544178;
        Thu, 11 Aug 2022 14:49:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090341c100b0016db43e5212sm137909ple.175.2022.08.11.14.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 11 Aug 2022 14:49:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: fix test for platform_get_irq()
 failure
Message-ID: <20220811214901.GA4089417@roeck-us.net>
References: <YvTgRk/ABp62/hNA@kili>
 <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f1f9300-1d5e-22f8-f544-475a9840d14c@wanadoo.fr>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
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

API documentation says:

* Return: non-zero IRQ number on success, negative error number on failure.

Also, 0 is not a valid interrupt number.

Guenter
