Return-Path: <linux-watchdog+bounces-3839-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111ADAFBE6A
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 00:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319BC42127E
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A10B25A359;
	Mon,  7 Jul 2025 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WECOzjhb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3482E370C;
	Mon,  7 Jul 2025 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751928904; cv=none; b=dBRxi2Drw0RmFIOX5jSjzJVBoQU75kC8Ut382yLOSvQSxNwpaybl9/I0oE0Vf+npSrd3jtYXu8V+aQqtZ/SiREG+Q6JxZ71Xoh8cx32opGO+a0J7u0vZLUFLzkcbhO3AKdiMtLVbz5YqkRLn5GnYhFK+w6pIqxVKFldgrHiRio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751928904; c=relaxed/simple;
	bh=+G+RIcW9LTIQlqVUhDb94U9QPdzuIs2sWuY6iBWt0mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrdF25OHFeygt+8rVQQICuCJgnrhr0uaQBANkbOpboM1wqkVEqDDraNNt6+yRESliTfb5eccp/pTzU55xKNG1koZ+SLHihqGX4J2Ma4I1Dr5xs3vStFaeFbjTr+I07zxymXqEeGZfFbS07foOiWjivDQe3KG2/QEkgk+rLbhmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WECOzjhb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234fcadde3eso54737585ad.0;
        Mon, 07 Jul 2025 15:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928902; x=1752533702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q3eO8XR+BDXiQEg/nZxeSyP3WmhBw4zvdWqBxn/MlY=;
        b=WECOzjhb/Zww6Sasy0sBjK87b5oBWX2T9oy1P6sSSA/8bWHGynCyGE2sMV3T3lmLIc
         u1xvzNvbnLraYqCbb1VrnYtR9p/y0VMsXCT3nggaWjs8fCP5sQ1r1qDuMjq/4zdDCq0j
         pcg1S2GwafhFrG27j1/6oC2yMgJ0phQvBsR/CLVAHOEWiodmbzB2ilyftRy7Wym0EgH4
         IBwk53GQfJXXGgjOpoRrzZF5ehPmj3e0l9mejSKIcsTcczcxc5d6dHOtxUsHFbIalrHt
         h0XANtF59xTBUPNKiVhQOj/32YQdeTGbX8kzUhysf5XjtWM0/XHqw0QuAfZI7xjTH5YY
         m+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928902; x=1752533702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q3eO8XR+BDXiQEg/nZxeSyP3WmhBw4zvdWqBxn/MlY=;
        b=GaDKE0PXCRNM0AAd6D4hLtO8Wf54UoEA0X/1pv/4B4foVdFoKKI8xg35nqWw6gJrvW
         yldNxJEaEnnlXBVzDfGlDtZikUvykQYwtmApdE6UcLtebS/QgaiWZzRbgOYT8kFpAOrN
         WGHuSEaVwfUWTcrp824FcKY75hW5bYCpLncSWDe1XOybJ+qSH/MaUGoTmycEoLzx2AZg
         qS5AuN9yaZ8KtPUnoxZ5ujiFFfgPp1zg2jFmrhA4il/fkskke4F7rK/M36eKhdCfYa1l
         PVB48lBbA6AQTPPV1LFC8mzDcgiwPWdEJ0CQC0dFOXzZPwhrEfqwXjK3SHgoOz5BY4H1
         a3ag==
X-Forwarded-Encrypted: i=1; AJvYcCUdEfPVeJH2ihiYCra/dPdyABap7LzA0nZs8AhCMLWNPlMFNglw387UTRXXQvYTwTWAF8efBn5hPJSD@vger.kernel.org, AJvYcCVBPj0Umonh2UDSAI2BEOqv+A54SljghArCDlHEKoFG4HHfsE2lUgx1DMYN2rwJAMKXzVF8XUumv9TabQW6@vger.kernel.org, AJvYcCW/7TR0YnXAXyXBhEwQBskctyjynAVgKRj5Omevvpuz24ZJRQ1lk6PPoRBxbDU8MKe6kcYzGjthNZQxirIhtnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaReYaY4+pTmQr7iVRtzZvIedS6tghr+9aU85NRJtr1U+a3lCt
	KN9w9yNjMO4htUyXIXsVT4nL3F2+lZFw2Xwhj1JRbliHkcD/RAy6xOU4
X-Gm-Gg: ASbGnctpn4+N7NWhnz0st7jvinBR9Ibg6N3XLs7ceFX5hv4gIyvq1ktptxfO+mIosKV
	2e0cnXuAYZ9ywCXrE+BZfcctwauWGdyKJJzylRMevo7mUDxFdLNQ2qXxFG9YY93heQstCiLnyjT
	QDhDaPKWFREtf8z/bU8eB/hCWXXmUGIUgXO7R5yUNsNEHZhkWPIlICQ1WekTizg686Ss8JB8/nH
	//pn46sJkWc0xsy4M1w5uI6ZQtPkgfoWHPykdmMhd64SngKxzXwFz8ynX4l7nzQpjAm3TX9gS9V
	X4YG5wngkDmI8PyXzU8iIRlQtyDkmpJcq4DWxbYwvAAuvU9kVsrkbaqk+bQhMz5xoXZkKb9/iog
	=
X-Google-Smtp-Source: AGHT+IEV3IPAVCe5TkFaSzyJRvAmPhce9EAkTmETBTmJeqm0WuuEjr7zVyTKVNdaiPxhQUd4IvoEkA==
X-Received: by 2002:a17:902:ccc4:b0:235:e942:cb9d with SMTP id d9443c01a7336-23c8747dfafmr178981485ad.17.1751928901713;
        Mon, 07 Jul 2025 15:55:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a3e5sm98447515ad.2.2025.07.07.15.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:55:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Jul 2025 15:55:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
Message-ID: <953f78a8-3928-479d-8700-dfe1cea15454@roeck-us.net>
References: <20250707180002.3918865-1-jm@ti.com>
 <20250707180002.3918865-3-jm@ti.com>
 <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
 <d96541bc-644d-4c90-b9f7-1e4afd16aeb6@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d96541bc-644d-4c90-b9f7-1e4afd16aeb6@ti.com>

On Mon, Jul 07, 2025 at 04:49:31PM -0500, Andrew Davis wrote:
> On 7/7/25 3:58 PM, Guenter Roeck wrote:
> > On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
> > > This allows to configure reaction between NMI and reset for WWD.
> > > 
> > > On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
> > > to the ESM module which can subsequently route the signal to safety
> > > master or SoC reset. On AM62L, the watchdog reset output is routed
> > > to the SoC HW reset block. So, add a new compatible for AM62l to add
> > > SoC data and configure reaction to reset instead of NMI.
> > > 
> > > [0] https://www.ti.com/product/AM62L
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > ---
> > >   drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
> > >   1 file changed, 28 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> > > index d1f9ce4100a8..c9ee443c70af 100644
> > > --- a/drivers/watchdog/rti_wdt.c
> > > +++ b/drivers/watchdog/rti_wdt.c
> > > @@ -35,7 +35,8 @@
> > >   #define RTIWWDRXCTRL	0xa4
> > >   #define RTIWWDSIZECTRL	0xa8
> > > -#define RTIWWDRX_NMI	0xa
> > > +#define RTIWWDRXN_RST	0x5
> > > +#define RTIWWDRXN_NMI	0xa
> > >   #define RTIWWDSIZE_50P		0x50
> > >   #define RTIWWDSIZE_25P		0x500
> > > @@ -63,22 +64,29 @@
> > >   static int heartbeat;
> > > +struct rti_wdt_data {
> > > +	bool reset;
> > > +};
> > > +
> > >   /*
> > >    * struct to hold data for each WDT device
> > >    * @base - base io address of WD device
> > >    * @freq - source clock frequency of WDT
> > >    * @wdd  - hold watchdog device as is in WDT core
> > > + * @data - hold configuration data
> > >    */
> > >   struct rti_wdt_device {
> > >   	void __iomem		*base;
> > >   	unsigned long		freq;
> > >   	struct watchdog_device	wdd;
> > > +	const struct rti_wdt_data *data;
> > >   };
> > >   static int rti_wdt_start(struct watchdog_device *wdd)
> > >   {
> > >   	u32 timer_margin;
> > >   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> > > +	u8 reaction;
> > >   	int ret;
> > >   	ret = pm_runtime_resume_and_get(wdd->parent);
> > > @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
> > >   	 */
> > >   	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
> > > -	/* Generate NMI when wdt expires */
> > > -	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> > > +	/* Reset device if wdt serviced outside of window or generate NMI if available */
> > 
> > Shouldn't that be "or generate NMI if _not_ available" ?
> > 
> 
> For almost all the K3 devices, the WDT has two selectable outputs, one resets
> the device directly, the other is this "NMI" which is wired to an ESM module
> which can take other actions (but usually it just also resets the device).
> For AM62L that second NMI output is not wired (no ESM module), so our only
> choice is to set the WDT to direct reset mode.
> 
> The wording is a little strange, but the "or generate NMI if available" meaning
> if NMI is available, then do that. Reset being the fallback when _not_ available.
> 
> Maybe this would work better:
> 
> /* If WDT is serviced outside of window, generate NMI if available, or reset device */
> 

The problem is that the code doesn't match the comment. The code checks the
"reset" flag and requests a reset if available. If doesn't check an "nmi"
flag.

If the preference is NMI, as your comment suggests, the flag should be named
"nmi" and be set if NMI is available. That would align the code and the
comment. Right now both code and comment are misleading, since the presence
of a reset flag (and setting it to false) suggests that a direct reset is
not available, and that reset is preferred if available. A reset is the
normally expected behavior for a watchdog, so the fact that this is _not_
the case for this watchdog should be made more visible.

Guenter

> Andrew
> 
> > Guenter
> > 
> > > +	if (wdt->data->reset)
> > > +		reaction = RTIWWDRXN_RST;
> > > +	else
> > > +		reaction = RTIWWDRXN_NMI;
> > > +
> > > +	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
> > >   	/* Open window size 50%; this is the largest window size available */
> > >   	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> > > @@ -255,6 +268,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
> > >   	wdd->timeout = DEFAULT_HEARTBEAT;
> > >   	wdd->parent = dev;
> > > +	wdt->data = device_get_match_data(dev);
> > > +
> > >   	watchdog_set_drvdata(wdd, wdt);
> > >   	watchdog_set_nowayout(wdd, 1);
> > >   	watchdog_set_restart_priority(wdd, 128);
> > > @@ -369,8 +384,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
> > >   	pm_runtime_disable(&pdev->dev);
> > >   }
> > > +static struct rti_wdt_data j7_wdt = {
> > > +	.reset = false,
> > > +};
> > > +
> > > +static struct rti_wdt_data am62l_wdt = {
> > > +	.reset = true,
> > > +};
> > > +
> > >   static const struct of_device_id rti_wdt_of_match[] = {
> > > -	{ .compatible = "ti,j7-rti-wdt", },
> > > +	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
> > > +	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
> > >   	{},
> > >   };
> > >   MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
> > > -- 
> > > 2.49.0
> > > 

