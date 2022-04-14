Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93185004CC
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Apr 2022 05:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbiDNDu4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 23:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbiDNDuy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 23:50:54 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8A951E6E
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 20:48:31 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o20-20020a9d7194000000b005cb20cf4f1bso2552747otj.7
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 20:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uygqJx0ZfZZwoqnOHzq78lvurapBN0u5xPbalsYrwD4=;
        b=KaeqKn5x+dcFIpKt+c2A/Z4h/nZJgKieU5U9TBOI0AjtdNeH6fWwdxU7Qph+U7hTin
         6Kp8RQowVFe9amd9xkPP+3a7JYWGLA077c8WvC3H72/BrTx48vnqes/52lcsrqVsRKUn
         UMqXC+CXqvqoNCEdBQPWN+O8R0LNL+sU1grh1GLWGXY4d+vM+3zZgcwzsnc6j4qp9gKd
         pey1nN426fn4mWWqar6gPid9hFAFW9HZtUBnM22kNd5XZHheb0bbMP1aTSRi5Jm4iN0x
         EHUjkoAKw+mt2ZUyAa+a9lLdUVLFKiFZ/aCijGTauC4tgarr8uvwQAZTiUd2/HLV6iPu
         801g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=uygqJx0ZfZZwoqnOHzq78lvurapBN0u5xPbalsYrwD4=;
        b=285ZwIihKSkl96uje1cWuxm/stu1GELV6fv7Vus1lL7gluOd6uRQsE1U/Ckk7ligOh
         annxPhiHDEhZo2aQaN36Xx+iw1iqjC2KnNO8KQ6xKG4hek/LJV+KH0t/V8lUrR33mnRW
         b2kUvrspb3FF4ee5jFTUSaQfsZfCiY5aYeH0PbcpPFeVWl6g+kr+f0ALSYuXxXAL6XQL
         sbwQLjObdOo1n29kTcJlCAxU4ArI5tT7ldtBKWcZzuZ0oaYvBvUwtS/mVZwKFuyZNleh
         gd66S96wW/UqK7o2TiBqSjhvnG0a7il4iAfnhHK/VRh5xn6cr75eC63/sDcNqT7JyVVi
         PHGw==
X-Gm-Message-State: AOAM530NH8R18VONUWANrP/t0MTQcFwzPVy1LS3EWabblboje+7sasa7
        WwP0IO93e2J50ixvNzRZu0Y=
X-Google-Smtp-Source: ABdhPJwI9+WtVJHu785QSOxlnmaGHhQmtsCRkCK2d+WXTMOjNHZ28Wz6zsXQDLMgFJHIrL0VVSo00Q==
X-Received: by 2002:a9d:7588:0:b0:5ce:e9c0:39a8 with SMTP id s8-20020a9d7588000000b005cee9c039a8mr320872otk.120.1649908110424;
        Wed, 13 Apr 2022 20:48:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g105-20020a9d12f2000000b005c961f9e119sm353444otg.35.2022.04.13.20.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 20:48:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 13 Apr 2022 20:48:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tzung-Bi Shih <tzungbi@kernel.org>
Cc:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org, bjking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
Subject: Re: [RFC v1 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
Message-ID: <20220414034828.GA2497623@roeck-us.net>
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
 <20220413165104.179144-3-cheloha@linux.ibm.com>
 <YleS6B3bFA0J1/b+@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YleS6B3bFA0J1/b+@google.com>
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

On Thu, Apr 14, 2022 at 11:20:08AM +0800, Tzung-Bi Shih wrote:
> On Wed, Apr 13, 2022 at 11:51:04AM -0500, Scott Cheloha wrote:
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index c4e82a8d863f..f3e6db5bed74 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1941,6 +1941,14 @@ config WATCHDOG_RTAS
> >  	  To compile this driver as a module, choose M here. The module
> >  	  will be called wdrtas.
> >  
> > +config PSERIES_WDT
> > +	tristate "POWER Architecture Platform Watchdog Timer"
> > +	depends on PPC_PSERIES
> > +	select WATCHDOG_CORE
> > +	help
> > +	  Driver for virtual watchdog timers provided by PAPR
> > +	  hypervisors (e.g. pHyp, KVM).
> > +
> 
> To maintain alphabetical order, the option should be prior to WATCHDOG_RTAS.
> 
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index f7da867e8782..3ae1f7d9f1ec 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -185,6 +185,7 @@ obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
> >  
> >  # PPC64 Architecture
> >  obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
> > +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
> 
> Same here.
> 
> > diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> > new file mode 100644
> > index 000000000000..0d22ddf12a7f
> > --- /dev/null
> > +++ b/drivers/watchdog/pseries-wdt.c
> > @@ -0,0 +1,337 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +#define DRV_NAME "pseries-wdt"
> > +#define pr_fmt(fmt) DRV_NAME ": " fmt
> 
> `pr_fmt` is unused.
> 

That is just a neat trick to get subsequent pr_xxx to print the driver name
as prefix.

> 
> > +static int __init pseries_wdt_init_module(void)
> > +{
> > +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> > +	unsigned long cap;
> > +	long rc;
> > +	int err;
> > +
> > +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> > +	if (rc != H_SUCCESS) {
> > +		if (rc == H_FUNCTION) {
> > +			pr_info("hypervisor does not support H_WATCHDOG");
> > +			return -ENODEV;
> > +		}
> > +		pr_err("H_WATCHDOG: %ld: capability query failed", rc);
> > +		return -EIO;

The init function should not print any messages. Loading the driver on
a platform not supporting it should have no effect and print no messages.

> > +	}
> > +	cap = ret[0];
> > +	min_timeout = roundup(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000) / 1000;
> > +	pr_info("hypervisor supports %lu timer(s), %lums minimum timeout",
> > +		PSERIES_WDTQ_MAX_NUMBER(cap), PSERIES_WDTQ_MIN_TIMEOUT(cap));
> 
> Could these bits be in pseries_wdt_probe()?

Yes. Also, if values have to be passed to the driver, the init code should
pass it as platform data. There should be no static variables to pass
values to the probe function.

Thanks,
Guenter
