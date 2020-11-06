Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364A92A96E3
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 14:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgKFNTf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 08:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgKFNTe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 08:19:34 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6D4C0613CF;
        Fri,  6 Nov 2020 05:19:34 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id m13so1278325oih.8;
        Fri, 06 Nov 2020 05:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KJB1xgKq9a1nDIt664i0hHb75r+6UHn2yvPVaWKbhxg=;
        b=DOsBqRxtlNHR5ZreCneNhifwRaW0lb046z4iq3WQ1KfggQtlzfU8J2qXJREhyDQ7cg
         ++BcXlYn2XWSI80IMs3qZRytRdnxuwGaACeb98bAQBtqeGaPn+XuaM1iuPMhS24SAtTC
         r3LGYYfV+UV+4u0LOj3Y6Z4q8/RVJN3ov2Wh8wtD/UG3bTSUd4ptom+gTl+T8xBf2naU
         5xNP24vO1EnlXXuKvhw0kDCu4FSmTkdHzXLVQi67rxS9aLXzU614i2nv4SmFaoB7uZhd
         Ue5mD1REr01eXLZrlhBR0f2qkYLHhYmKu8Vlf6gLHOjHDC5hnsReZf90U9RKAOudX/Ye
         V4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=KJB1xgKq9a1nDIt664i0hHb75r+6UHn2yvPVaWKbhxg=;
        b=LMXJ1RS86YRdw4BPsi4VLVrMB6FTCGo4pP+64Q6UF1CF3wRkEe7L4itm38wNANqD5a
         mtvWY1hRtjtNtX7iLip6PIV5lMe8hJi00j+PES5bF/mCNuy+H/2Jzo5aGbcntoJ84ygF
         daVDo3NXNycrJ+ZqDCnqZYcP1jj8eUaQTYiwPImempX9CP70lGlpas37MOpdj9bWakCG
         7il30sBCkqedhWKsjSADl1RNixu5p6XvGLXjdtTIWE8/+OowgxzV/WtCwBHQH2SuHRWY
         06njw7/r5N55k8avYR3M+ua/+cOUyeDY3H9UKEqqzuo26iYhoh1xDkZNx0+cORp+MZ8K
         v/Dg==
X-Gm-Message-State: AOAM531lzwYzjizXyS3R/QgyNhi/KBe/9DnoqZRObY6GrTY4f7LLTvzJ
        8K/iYOD30LIDpzc3zvGXQlH3/GjfayI=
X-Google-Smtp-Source: ABdhPJy//DTLAwtKxOi4CFlZ1NvnIpSpWaxe8a66KjJ8ASGzscPZnO1sTkVM8HlWE9XeUr2CKK5t0A==
X-Received: by 2002:aca:33c2:: with SMTP id z185mr1130517oiz.174.1604668774086;
        Fri, 06 Nov 2020 05:19:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y3sm282369ota.62.2020.11.06.05.19.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 05:19:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 6 Nov 2020 05:19:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "wangwensheng (C)" <wangwensheng4@huawei.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Xiangrui (Euler)" <rui.xiang@huawei.com>,
        "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>
Subject: Re: [PATCH -next v3 1/2] watchdog: Fix potential dereferencing of
 null pointer
Message-ID: <20201106131932.GE14837@roeck-us.net>
References: <20201105123848.93735-1-wangwensheng4@huawei.com>
 <20201105142621.GB1389@roeck-us.net>
 <4a85d0170a69430585fb89aba7490d9a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a85d0170a69430585fb89aba7490d9a@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 06, 2020 at 07:37:08AM +0000, wangwensheng (C) wrote:
> 在 2020/11/5 22:26, Guenter Roeck 写道:
> > On Thu, Nov 05, 2020 at 12:38:47PM +0000, Wang Wensheng wrote:
> >> A reboot notifier, which stops the WDT by calling the stop hook without
> >> any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.
> >>
> >> Howerer we allow the WDT driver to omit the stop hook since commit
> >> "d0684c8a93549" ("watchdog: Make stop function optional") and provide
> >> a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
> >> in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
> >> control reboot policy"). Together that commits make user potential to
> >> insert a watchdog driver that don't provide a stop hook but with the
> >> stop_on_reboot parameter set, then dereferencing of null pointer occurs
> >> on system reboot.
> >>
> >> Check the stop hook before registering the reboot notifier to fix the
> >> issue.
> >>
> >> Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
> >> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> >> ---
> >>   drivers/watchdog/watchdog_core.c | 9 ++++++++-
> >>   1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> >> index 423844757812..945ab38b14b8 100644
> >> --- a/drivers/watchdog/watchdog_core.c
> >> +++ b/drivers/watchdog/watchdog_core.c
> >> @@ -267,8 +267,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
> >>   	}
> >>   
> >>   	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> >> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> >> +		if (!wdd->ops->stop) {
> >> +			pr_err("watchdog%d: Cannot support stop_on_reboot\n",
> >> +				wdd->id);
> >> +			watchdog_dev_unregister(wdd);
> >> +			ida_simple_remove(&watchdog_ida, id);
> >> +			return -EINVAL;
> >> +		}
> > 
> > The problem with this is that setting the "stop_on_reboot" module parameter
> > would now prevent the watchdog from being loaded, which isn't really
> > desirable and might go unnoticed. I think the initial check should be
> > above, with the "Mandatory operations" check, and
> > 	if (stop_on_reboot != -1) {
> > should be extended to
> > 	if (stop_on_reboot != -1 && wdd->ops->stop) {
> > 
> > or possibly more fancy:
> > 
> > 	if (stop_on_reboot != -1) {
> > 		if (stop_on_reboot) {
> > 			if (!wdd->ops->stop)
> > 				pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
> > 			else
> > 				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> > 		} else {
> > 			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> > 		}
> > 	}
> > 
> > Thanks,
> > Guenter
> 
> Now the divergence is that should we stop the registering process and 
> return error when the STOP_ON_REBOOT flag is set but the driver doesn't 
> support it. The flag is set in two scenes.
> Firstly,the driver that should provide the stop hook may set the flag 
> staticlly, and it is a bug of the driver if it set the flag but without 
> a stop hook. Then giving an error shall be more striking.
> Secondly, the user can change the flag using module parameter. Is it 
> reasonable to just ignore the STOP_ON_REBOOT flag and give a warning 
> when the user truely want it? And under this circumstance a warning is 
> easier to get unnoticed than an error.
> I prefer to stop the registering process and return an error in those 
> two scenes.
> 

I disagree. A bad module parameter should not result in module load
failures.

Guenter

> Thanks
> > 
> >>   
> >> +		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> >>   		ret = register_reboot_notifier(&wdd->reboot_nb);
> >>   		if (ret) {
> >>   			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> >> -- 
> >> 2.25.0
> >>
> > 
> 
