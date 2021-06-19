Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665463ADC0D
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Jun 2021 01:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhFSXVt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 19 Jun 2021 19:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFSXVs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 19 Jun 2021 19:21:48 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB65C061574;
        Sat, 19 Jun 2021 16:19:36 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so13615397otu.6;
        Sat, 19 Jun 2021 16:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aDfNGXcPF1Bi/JGi+LKoV/bPtk1Foubw8INWIdn030g=;
        b=FyYvR+xLQT1b1SnKaRS7stgd0khsFCXdySsLS4iRuyhwkWVqBamCZlocDWBBYv6gf3
         VMOgM8fIa/E5pw2xBRc3HkMZkpMAO1/bHcS622nUWrAgVmBQIePwiOCkCuPVZM4hKXex
         ujF0NZORjuhtpLAN/uIlpriPaTY0auLf0Eu8LF6zBHvjimJOlV8iNjGMn+ox6IvVqd5E
         2tYQ/JHlLHDxwHHyvclrERJ+CyFPBCPtX5691rSNJEyyM8FukmpVpQJq32yOIKx41DoP
         WkflxdrJG30yqYyhTLm/TQ1GHDmxEuCwW1rGeeCE2k2P38gTDifMT6jAKmrdbmPTKYZM
         PzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=aDfNGXcPF1Bi/JGi+LKoV/bPtk1Foubw8INWIdn030g=;
        b=rAHjEwUWNzEuOIfpgvTOtIKp8N1vgWmXJYRrGypfqDXA8kYRdKeZflrjUhvvuKh9Pa
         SqIZu/9Qd9brFbOTD5wiKVg/yoW8a/866QVYsTjVF78VAcNFmVGe4tDQ7GnaoIcZq5kX
         L93WekySllJl1+V7rE2PaBFTXTAs+20WqHq+37urD5/FfiNtv4xbT3WGkqZ4X6quc3yo
         rSmivRk0hd0Ulybu9dxepRsSy2RZv7Z3CXc3O4b3n1eYQGL8z32/cq8/j5ajabsBNuXP
         MgF6tHWHld8C7D2rYjWCc8m1vcIm5wArA8n2SPwrWWEnOGXhLi8jRKn4XBW0cYMXooPX
         uiZw==
X-Gm-Message-State: AOAM530MlX4N2duous+lbRI/+jZ0bVLQvEPqn35OGyeB87ec52S1lH5s
        kCys/MHQZj75fXbKdn2YLMc=
X-Google-Smtp-Source: ABdhPJwvHPcUYItMgvcgZF9MNmUcNY5MnqqFWEG7xfbgO8ra+6h5nuv3LL6MijtbhnruVSA8LYhL/Q==
X-Received: by 2002:a05:6830:c5:: with SMTP id x5mr14942410oto.59.1624144775339;
        Sat, 19 Jun 2021 16:19:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y17sm2737534oih.54.2021.06.19.16.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 16:19:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 19 Jun 2021 16:19:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     kernel test robot <lkp@intel.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: iTCO_wdt: use pm_ptr()
Message-ID: <20210619231933.GA3821829@roeck-us.net>
References: <20210616181708.19530-1-info@metux.net>
 <202106200634.4MqYLYfW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106200634.4MqYLYfW-lkp@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jun 20, 2021 at 06:27:52AM +0800, kernel test robot wrote:
> Hi "Enrico,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linux/master]
> [also build test ERROR on hwmon/hwmon-next linus/master v5.13-rc6 next-20210618]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Enrico-Weigelt-metux-IT-consult/watchdog-iTCO_wdt-use-pm_ptr/20210617-024441
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd860052c99b1e088352bdd4fb7aef46f8d2ef47
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/670a790c3acfccf4b5405459048ba2a05b912eef
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Enrico-Weigelt-metux-IT-consult/watchdog-iTCO_wdt-use-pm_ptr/20210617-024441
>         git checkout 670a790c3acfccf4b5405459048ba2a05b912eef
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/device.h:25,
>                     from include/linux/acpi.h:15,
>                     from drivers/watchdog/iTCO_wdt.c:48:
> >> drivers/watchdog/iTCO_wdt.c:645:21: error: 'iTCO_wdt_pm' undeclared here (not in a function); did you mean 'iTCO_wdt_ops'?
>      645 |   .pm     = pm_ptr(&iTCO_wdt_pm),
>          |                     ^~~~~~~~~~~
>    include/linux/pm.h:377:23: note: in definition of macro 'pm_ptr'
>      377 | #define pm_ptr(_ptr) (_ptr)
>          |                       ^~~~
> 
> 
> vim +645 drivers/watchdog/iTCO_wdt.c
> 
>    640	
>    641	static struct platform_driver iTCO_wdt_driver = {
>    642		.probe          = iTCO_wdt_probe,
>    643		.driver         = {
>    644			.name   = DRV_NAME,
>  > 645			.pm     = pm_ptr(&iTCO_wdt_pm),

I'll drop this patch for now.

Guenter

>    646		},
>    647	};
>    648	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


