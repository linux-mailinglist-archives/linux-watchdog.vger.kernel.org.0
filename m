Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCD11E39B4
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 May 2020 08:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgE0Gxu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 May 2020 02:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgE0Gxu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 May 2020 02:53:50 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C801C03E97D
        for <linux-watchdog@vger.kernel.org>; Tue, 26 May 2020 23:53:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so1947376wmd.5
        for <linux-watchdog@vger.kernel.org>; Tue, 26 May 2020 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KaQOkQA7F9aEmTtrQs4AHoVIEVINLPeKbMlE71dR8YI=;
        b=cPWisZ+A4SR3iQJ6RsEDeDne0OUCVjnfpAGxMjkPrCxzFO71csUJv0xmdBRl7npeZh
         AeFPi1ZmAv1VwihKmOwSRiZrJsJ1i6kwIn8Nkt2Ls6PrSh4pmaZSr97snzWfE0Tn5x79
         bn5tQlmvjopqjhhwA+8717mpKH4FIRbM2wsps9Yaybn+1Sbdk7PQ6e6xPJok7tTW3hQT
         6R8cBzso9tSPzo2k0UZJPVj9XZDBCfP717btD4AxbyDHH0f/x517SgR/trJkcSQlO6BB
         UekgSoUHoJVz0M2m9h5Iu/ibOmd2JCvlYeh977CW4E0Cm+pKuCkVczG89O4X7pFde+o4
         gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KaQOkQA7F9aEmTtrQs4AHoVIEVINLPeKbMlE71dR8YI=;
        b=bfd2m7FbNhTeQIBpJTRJesv+FdxgtFpcT2A8j5Plh3GUSQF5hxOoJ4WNSd3XiqpHmb
         1xrzbKj3sW0J3MOh+LPcKskhXMSuLebuYBEk2G2/qQqOrF3Fw0tIa8nZ6Sy5v8ZGAsUg
         d/rxJUBLnB5h+KGe3XBc0bG2QH/UUpUJ+EJyLJDZGj0EmkMpBIofUhrSYWtpp4wifx0k
         1ez+jqZomPeLHgUf8Rtg6mCG4oAnK3Va8hU/vTc+0q+iPGIuVHbVP0VpGR2/Rl1bZMk6
         Y3yMbICJ7cYj4fZjjExLcoFDsP1AFo1eKJC6xbsKgW9DPT+VlCvKp8qsmUChzSW6acJQ
         hRLA==
X-Gm-Message-State: AOAM533mF3piPiXeC/WPtZ4hyFNANdu7EaNTa5Z2rjhis7+daQ1x2+cQ
        j2OsnrfzrTZYILtWSYl7KiGIdw==
X-Google-Smtp-Source: ABdhPJzEz2uP3oWCohWVrLCnTYgAhvZIGv77IRU3z+lWX42qdjUmDcj2EC+NMT9wwZk7n/CATpsnBg==
X-Received: by 2002:a1c:25c3:: with SMTP id l186mr2814857wml.103.1590562426704;
        Tue, 26 May 2020 23:53:46 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id p23sm1900743wma.17.2020.05.26.23.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:53:46 -0700 (PDT)
Date:   Wed, 27 May 2020 07:53:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/16] mfd: mfd-core: match device tree node against
 reg property
Message-ID: <20200527065344.GP3628@dell>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-4-michael@walle.cc>
 <67e90dafd67c285158c2c6f67f92edb7@walle.cc>
 <20200515102848.GH271301@dell>
 <159e68b4ce53630ef906b2fcbca925bd@walle.cc>
 <20200526072427.GC3628@dell>
 <f5704ce5a3e280f63c81fe35efb08234@walle.cc>
 <20200526160336.GV1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526160336.GV1634618@smile.fi.intel.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 26 May 2020, Andy Shevchenko wrote:

> On Tue, May 26, 2020 at 05:54:38PM +0200, Michael Walle wrote:
> > Am 2020-05-26 09:24, schrieb Lee Jones:
> 
> ...
> 
> > Like I said, in the long term I would like to have support for
> > different versions of the board management controller
> 
> > without having to change the device tree and have device tree bindings for the
> > subdevices at the same time.
> 
> But isn't device tree to describe *very specific platform* rather than *class
> of platforms*?

Yes.  Device Tree describes the hardware.

If the hardware changes, so must the Device Tree.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
