Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656837E294B
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 17:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjKFQBs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 11:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjKFQBs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 11:01:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897A0184;
        Mon,  6 Nov 2023 08:01:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso4667257b3a.2;
        Mon, 06 Nov 2023 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286505; x=1699891305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9g9CJdOT5exx1UmkTNwpwNtQ67IAsvOnnzfWKi9SLsM=;
        b=fnargay0UVx+PmHEqXtYmyLCrC5LUpeVIkDKu73RUTL7HX1tsI1WH4ZI9T8xiExAVT
         NFighhvSChk+FGbHQ2pLPlldZBT/c/ck2VXxVe4eVYdU6uS02e5mfK4yjdcxJBpaskDM
         ykVV6W2HexI5ywXczsCOVGEOgqiVHFyxZqBHKUaQ8oTCxZQDiSrM77y0yO/0z0xhWn66
         0Axqi9ZWZ8hm9+vHie5LAgBqXGpqq/LGItNd6Y5d7FAqtmPMaP1ryptO4+2nOPiYzn3F
         g7Ow7gnBT+6tV9ik5woO3BchNJE4LROkagyrccjytH7ZxCeMqGjS9Et19Bz+LUuWXDlt
         kFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286505; x=1699891305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9g9CJdOT5exx1UmkTNwpwNtQ67IAsvOnnzfWKi9SLsM=;
        b=BTy3nA80uzfez7IDCmMVgnGpoM1V8b8fgdvKXS7KADutz3kgFH2ceIaq+MJbt89nkR
         Mbl9OaTl8a+eOGwnpQQHEoOaWruLjibSMJUgE204pA29DJMOLEA+d0hEQUAWdgZlpHPM
         p4qbW5Ej5xh7l7k19zymQH+3SkVNUBqGOP08sg7Goq0fP54ZVoTS28t079NlVW2hVomU
         xtvCH6u99jyrIpXgw8+KDt4sraPIWlbqiDesNZef7/qdrkuY8vNrXc7mxKEYzj5UaFfK
         nmNtAtMXbJ70AGLIvFmGhiz2n1NbyBgjLCBeH0WMMU3hdNPDQR19D0K7RtkVBbeiRao2
         1kWw==
X-Gm-Message-State: AOJu0Yx7MRFdyjkJs5UW0ADX+hbT/ldlPGlzcfboDXUq5trsY2oeLp52
        ycpetOH7+hWc6y86jYV2jvAXI4CbYTw=
X-Google-Smtp-Source: AGHT+IHa1Seod2+YJfMi2H1+psXXcDvr+RlCpvjPS58nxXuVmEokNTtqsAWghRmYRsMayR+a4ax40Q==
X-Received: by 2002:a05:6a21:3d84:b0:184:1c37:c3d2 with SMTP id bj4-20020a056a213d8400b001841c37c3d2mr4552071pzc.21.1699286504876;
        Mon, 06 Nov 2023 08:01:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id du8-20020a056a002b4800b0069346777241sm5951461pfb.97.2023.11.06.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:01:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Nov 2023 08:01:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/5] watchdog: at91sam9: Stop using
 module_platform_driver_probe()
Message-ID: <b03b55f0-deba-41c5-acef-38338afa34bb@roeck-us.net>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106154807.3866712-2-u.kleine-koenig@pengutronix.de>
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

On Mon, Nov 06, 2023 at 04:48:09PM +0100, Uwe Kleine-König wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
> 
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=1) modpost warning:
> 
> 	WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in reference: at91wdt_driver+0x4 (section: .data) -> at91wdt_remove (section: .exit.text)
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
