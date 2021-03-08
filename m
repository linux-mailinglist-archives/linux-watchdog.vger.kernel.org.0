Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8878331141
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 15:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCHOwy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 09:52:54 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:38158 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhCHOwe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 09:52:34 -0500
Received: by mail-lj1-f170.google.com with SMTP id 2so16430696ljr.5;
        Mon, 08 Mar 2021 06:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=WMzNMKgHpa+G4HfW7zckj8ZWhc6jqMkyy2g0cwRIC6c=;
        b=fx8y8KPu2rvhOv5Rwkb54AOm6RQOqMegmJ0sMwK3T/xQ1dzZbE7bp76NJB8vNQrpAi
         +GF8Pk1j0fHmzKXDatmOMKJ4oyOVXYtwfQfb1AL1Ibjb7EP4QsCxFAxqsBDyAhl90vCs
         v+2YGtCGxm9bUHVgC+RmAKR1fOizoyQZwamxEH3EnVtCq5hRM1uFJhWB4zBQRWAF++Ai
         7sZebmLB0CXlnyHHp6WGIgNkJIZmNuYJIK7QJTODOtVuocRPkM4Uo/JGw7JIo9f7sOjr
         wa/BA0sRlGtMpA4sWI+jwuyUAO2sDQ84NcTqkECoCgb3wAJWJgyVtBxmzOwudj1IKhAZ
         r2Wg==
X-Gm-Message-State: AOAM532fw9a618d9DGgIFJKykHMUtVCg1CafL7zRjMkiGnih3M84QQR3
        B8+QWOq2u3VH3HPJdAYl9MI=
X-Google-Smtp-Source: ABdhPJz9K+inMO0/ELRvxkwbW9NLe79/FhnmG+R8exnZE/rZkEedkN2TdnmorwlqfccJWiMG2wd7ug==
X-Received: by 2002:a2e:3206:: with SMTP id y6mr13673463ljy.208.1615215152340;
        Mon, 08 Mar 2021 06:52:32 -0800 (PST)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id z11sm1376445lfd.98.2021.03.08.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:52:31 -0800 (PST)
Message-ID: <29daa037a8097aeac032206480c0249bdd5d9e25.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v8 2/6] mfd: Support ROHM BD9576MUF and BD9573MUF
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20210308133614.GD4931@dell>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
         <560b9748094392493ebf7af11b6cc558776c4fd5.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
         <20210308133614.GD4931@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 08 Mar 2021 16:52:22 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Lee,

On Mon, 2021-03-08 at 13:36 +0000, Lee Jones wrote:
> On Thu, 11 Feb 2021, Matti Vaittinen wrote:
> 
> > Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> > mainly used to power the R-Car series processors.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > Changes:
> >  - Comments fixed based on suggestions from Lee
> >  - Name of regulator cell changed as suggested by Lee
> >  - Renamed MFD cell variables for better readability
> >  - Aligned header definitions for better readability
> > 
> >  drivers/mfd/Kconfig              |  11 ++++
> >  drivers/mfd/Makefile             |   1 +
> >  drivers/mfd/rohm-bd9576.c        | 109
> > +++++++++++++++++++++++++++++++
> >  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
> >  include/linux/mfd/rohm-generic.h |   2 +
> >  5 files changed, 182 insertions(+)
> >  create mode 100644 drivers/mfd/rohm-bd9576.c
> >  create mode 100644 include/linux/mfd/rohm-bd957x.h
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index bdfce7b15621..53c7c96283bd 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1998,6 +1998,17 @@ config MFD_ROHM_BD71828
> >  	  Also included is a Coulomb counter, a real-time clock (RTC),
> > and
> >  	  a 32.768 kHz clock gate.
> >  
> > +config MFD_ROHM_BD957XMUF
> > +	tristate "ROHM BD9576MUF and BD9573MUF Power Management ICs"
> > +	depends on I2C=y
> > +	depends on OF
> > +	select REGMAP_I2C
> > +	select MFD_CORE
> > +	help
> > +	  Select this option to get support for the ROHM BD9576MUF and
> > +	  BD9573MUF Power Management ICs. BD9576 and BD9573 are
> > primarily
> > +	  designed to be used to power R-Car series processors.
> > +
> >  config MFD_STM32_LPTIMER
> >  	tristate "Support for STM32 Low-Power Timer"
> >  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 14fdb188af02..e58fae024bb2 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -262,6 +262,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
> >  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
> >  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
> >  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
> > +obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
> >  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
> >  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
> >  
> > diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> > new file mode 100644
> > index 000000000000..efd439677c9e
> > --- /dev/null
> > +++ b/drivers/mfd/rohm-bd9576.c
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2020 ROHM Semiconductors
> 
> If you get a chance, could you please update these?

I'll respin the series as I'll add designated initializers for MFD
regulator array cell as you suggested. So I'll update this at the same
time.

> 
> > + * ROHM BD9576MUF and BD9573MUF PMIC driver
> > + */
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 


