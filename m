Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC4F2435E4
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Aug 2020 10:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgHMIVZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Aug 2020 04:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgHMIVX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Aug 2020 04:21:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A76C061384
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Aug 2020 01:21:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p14so3959289wmg.1
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Aug 2020 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TaF7t62kA/TvbRHcpZhhq+FrZ2BLcBcydNr4phobFUY=;
        b=CPBkyvZ7Ndj1BtjjpDBRw/IetD7Td9PZutM7CyHxXlYLdhRS82/KG1/k48nD+072A2
         bfJqnmgk46n6nhm7Q0Y0eVGg3udaq65u2D5ezFBkon8KkQnon/B8zkl1YhCxEKwDv3Yp
         5MT0Eer76Dw9KZoSyxzc4iJF/E0fnWqWb00Ae64OEuV0JUJxuUc7bk1YSEmDs3KdDEzv
         DovsGd3dkPcGBKmrCsQVcXVudeLx/4xpyB6t7sABAHxvOU7rHwE9/C7H4vsES/qRBh4q
         oMYngG5SioSQO91K+dUnCBQMgnCzeaGqew+HH73ui018xNWwc8Nv3TzCSD3Cnrl4EJpD
         pCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TaF7t62kA/TvbRHcpZhhq+FrZ2BLcBcydNr4phobFUY=;
        b=kijEEpll70sWmF0H6qqqAIK90ZsAi3RGyHKOVHfLMT9SvWfey6urxyQFF3onDTVKeF
         1Ng/g1W2Q/TqI3EDUmD6tIgPIVuRVz8TPChEnZjhejGGCBA5aDHDiBFwvPB/20J4YKcj
         fdT6aC2OSKKwYWHE42eIIFud/wHCYuZ2gkLn6g9rwhyedhFAZmZy6RDeS+YXALJAu0Hi
         qdAUpS13ovefaXIlbbSMedipPh97mk/+l7jjhidfyMDpVkrLE1oMsDTx1xOGCnVMcv6M
         /XidY6iRluDTZjgB59mUXZwiSKXvMqC+oSPGK30CpoosDQ8y0PibL15o3zgv1cKNEl/K
         o3Tg==
X-Gm-Message-State: AOAM531PPkVOzT3L0gEvPSu0jUKloP51x1uAU1/YdnwBcqFifSbi5rGK
        INh+NYpY2drLRLkVVaKOMO4l5A==
X-Google-Smtp-Source: ABdhPJyY8QcT9B4zABBhXsDNtkI2aIFl3IHofq+pxEnxc+vdzhF7RmON/IpqRCGobqpodwk32Gb2kQ==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr3088521wmg.184.1597306881679;
        Thu, 13 Aug 2020 01:21:21 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id h6sm8768350wrv.40.2020.08.13.01.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 01:21:20 -0700 (PDT)
Date:   Thu, 13 Aug 2020 09:21:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 06/13] pwm: add support for sl28cpld PWM controller
Message-ID: <20200813082118.GJ4354@dell>
References: <20200803093559.12289-1-michael@walle.cc>
 <20200803093559.12289-7-michael@walle.cc>
 <20200806084000.k3aj5nmqdodmb35v@pengutronix.de>
 <e288ca6cfee819223395712e04159dd9@walle.cc>
 <20200810071328.GB4411@dell>
 <2ca0a3a3f03a1f5b9b2777738824123b@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ca0a3a3f03a1f5b9b2777738824123b@walle.cc>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 10 Aug 2020, Michael Walle wrote:

> Am 2020-08-10 09:13, schrieb Lee Jones:
> > On Fri, 07 Aug 2020, Michael Walle wrote:
> > 
> > > Hi Uwe, Hi Lee,
> > > 
> > > Am 2020-08-06 10:40, schrieb Uwe Kleine-König:
> > > > On Mon, Aug 03, 2020 at 11:35:52AM +0200, Michael Walle wrote:
> > > > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > > > > index 7dbcf6973d33..a0d50d70c3b9 100644
> > > > > --- a/drivers/pwm/Kconfig
> > > > > +++ b/drivers/pwm/Kconfig
> > > > > @@ -428,6 +428,16 @@ config PWM_SIFIVE
> > > > >  	  To compile this driver as a module, choose M here: the module
> > > > >  	  will be called pwm-sifive.
> > > > >
> > > > > +config PWM_SL28CPLD
> > > > > +	tristate "Kontron sl28cpld PWM support"
> > > > > +	select MFD_SIMPLE_MFD_I2C
> > > >
> > > > Is it sensible to present this option to everyone? Maybe
> > > >
> > > > 	depends on SOME_SYMBOL_ONLY_TRUE_ON_SL28CPLD || COMPILE_TEST
> > > 
> > > Because there is now no real MFD driver anymore, there is also
> > > no symbol for that. The closest would be ARCH_ARM64 but I don't
> > > think that is a good idea.
> > > 
> > > Lee, what do you think about adding a symbol to the MFD, which
> > > selects MFD_SIMPLE_MFD_I2C but doesn't enable any C modules?
> > > 
> > > I.e.
> > > config MFD_SL28CPLD
> > >     tristate "Kontron sl28cpld"
> > >     select MFD_SIMPLE_MFD_I2C
> > >     help
> > >       Say yes here to add support for the Kontron sl28cpld board
> > >       management controller.
> > > 
> > > Then all the other device driver could depend on the MFD_SL28CPLD
> > > symbol.
> > 
> > You want to add a virtual symbol to prevent having to present a real
> > one?  How is that a reasonable solution?
> 
> (1) Its a symbol on which all sl28cpld will depend on. Thus they will
>     all be hidden if that is not set.
> (2) the drivers itself wouldn't need to depend on MFD_SIMPLE_MFD_I2C,
>     which is more correct, because they don't have anything to do with
>     i2c.

Yes, okay.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
