Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E04271E51
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 10:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIUIrU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 04:47:20 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:54902 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIUIrU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 04:47:20 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 08L8koid019827; Mon, 21 Sep 2020 17:46:50 +0900
X-Iguazu-Qid: 2wHHUwt3Pz0wvvh0gy
X-Iguazu-QSIG: v=2; s=0; t=1600678010; q=2wHHUwt3Pz0wvvh0gy; m=0zEXxIcWnOF+gblniTiYWVlNOKvXel4cIO/JZFORh8Y=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1113) id 08L8kmMm014124;
        Mon, 21 Sep 2020 17:46:48 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08L8km8I017516;
        Mon, 21 Sep 2020 17:46:48 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08L8klTe009188;
        Mon, 21 Sep 2020 17:46:48 +0900
Date:   Mon, 21 Sep 2020 17:46:46 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] watchdog: Add Toshiba Visconti watchdog driver
X-TSB-HOP: ON
Message-ID: <20200921084646.w4cps33nnxnqxefx@toshiba.co.jp>
References: <20200920051807.288034-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200920051807.288034-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <87d02flhfr.fsf@kokedama.swc.toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d02flhfr.fsf@kokedama.swc.toshiba.co.jp>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Thanks for your review.

On Mon, Sep 21, 2020 at 04:25:44PM +0900, Punit Agrawal wrote:
> Iwamatsu-san,
> 
> Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:
> 
> > Add the watchdog driver for Toshiba Visconti series.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  drivers/watchdog/Kconfig        |   8 ++
> >  drivers/watchdog/Makefile       |   1 +
> >  drivers/watchdog/visconti_wdt.c | 191 ++++++++++++++++++++++++++++++++
> >  3 files changed, 200 insertions(+)
> >  create mode 100644 drivers/watchdog/visconti_wdt.c
> >
> 
> [...]
> 
> > diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> > new file mode 100644
> > index 000000000000..4a67b9fe9220
> > --- /dev/null
> > +++ b/drivers/watchdog/visconti_wdt.c
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 TOSHIBA CORPORATION
> > + * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
> > + * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> 
> interrupt.h doesn't seem to be used. It can be dropped.
> 

Right. I will remove this.


> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define WDT_CNT			0x00
> > +#define WDT_MIN			0x04
> > +#define WDT_MAX			0x08
> > +#define WDT_CTL			0x0c
> > +#define WDT_CMD			0x10
> > +#define WDT_CMD_CLEAR		0x4352
> > +#define WDT_CMD_START_STOP	0x5354
> > +#define WDT_DIV			0x30
> > +
> > +#define VISCONTI_WDT_FREQ	2000000 /* 2MHz */
> > +#define WDT_DEFAULT_TIMEOUT	10U /* in seconds */
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(
> > +	nowayout,
> > +	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT)")");


<snip>


> > +module_platform_driver(visconti_wdt_driver);
> > +
> > +MODULE_DESCRIPTION("TOSHIBA Visconti Watchdog Driver");
> > +MODULE_AUTHOR("TOSHIBA ELECTRONIC DEVICES & STORAGE CORPORATION");
> 
> The MODULE_AUTHOR() macro is usually used to represent the driver
> authors. Not sure about using it for the organization name which is
> already included in the copyright notice. Please drop it or replace it
> with the author name / email.

Well, it's unnecessary for MODULE_AUTHOR.
I will drop this.

> 
> > +MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp");
> > +MODULE_LICENSE("GPL v2");
> 
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> 

Thanks!

> Thanks,
> Punit
> 

Best regards,
  Nobuhiro
