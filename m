Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2D3151E3D
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 17:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgBDQZT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 11:25:19 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39287 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgBDQZS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 11:25:18 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so7472481plp.6;
        Tue, 04 Feb 2020 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O/sCeixAp7RG7twZulDcz878W1v+r0QG4QBn97QB9rg=;
        b=g6AkK9qWCKU3Yfgak1ZzxPplEEuZm5WS9jkpqbTozPyu4F7s75YCaIkpQxTl6+N9Qr
         BKac/0+fytPBY0MZtL8uGnvRDrp5/+RZhDqknJ6j99aQERefyozvFNfyqbvKohuPq7xl
         sJtSJ8iO3UOenan3dBTZiFd6Q+zfZtpOeiYP4EWC7HDE0znJQlisO9I9DmtQNB8/7n6z
         dqyc59QzAGmcgUgBqyPUOLbyewRSFVNmi97x5WoCwcy6HXhjuurxQOGnpk6h/+PyJPC9
         P/jSItGYGXkxwOgJ0DI6HXeAOHPF9o5skHRRgCnPZ7/EkbyMvn9FeW0QoigWIsEq9bq1
         Tl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=O/sCeixAp7RG7twZulDcz878W1v+r0QG4QBn97QB9rg=;
        b=JSiKW5cUExXErgNWshQMMJDYNVakWgiCwSwzh1QyftKFCQLQ6g1KlhjRyoz9Z4YZRx
         p77Q6T/xUrLWv/MzzaF1f5Z8t9oWKyn7LbIXgU1i+KsJzG2CrcHNiQI3u4pD5PE1jNaR
         n5J1h0HqDJzvvET/p2reYfx1OCLd7F22QCImim6yFrYggmPUrG6vNbL1MwV6xGnCDlnW
         kHJWhDqDg+ZsfNt5pLO5399se8khScymbdJjTwlVmLCeux5lRl8ptEonCBj7+sPzW64R
         GFqWzResEx3tuiEsuSPaDFLB6JWBshm3NchKVezzOObxmaox1snYTfVO3cir1a4LSsft
         PFGg==
X-Gm-Message-State: APjAAAX2yur7HUm1TzoPnNdkWd96O7CcWjuz6/1nn77mucUAx7IQwaka
        J7Q3ICUnJDqEIberjZSPc9k=
X-Google-Smtp-Source: APXvYqxsd7qC0DJSURNNHya+EzrexA8llJ52xqkcSMF38z9LBvQk/VZwgInLjeqfMdyHtNnlg5CCeQ==
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr30840031plp.144.1580833518073;
        Tue, 04 Feb 2020 08:25:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c68sm25237454pfc.156.2020.02.04.08.25.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 08:25:17 -0800 (PST)
Date:   Tue, 4 Feb 2020 08:25:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     ansuelsmth@gmail.com
Cc:     'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Wim Van Sebroeck' <wim@linux-watchdog.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: R: [PATCH 1/3] watchdog: qcom-wdt: add option to skip pretimeout
Message-ID: <20200204162516.GA22814@roeck-us.net>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
 <20200204160824.GA17320@roeck-us.net>
 <035201d5db76$78f56670$6ae03350$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <035201d5db76$78f56670$6ae03350$@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 05:16:34PM +0100, ansuelsmth@gmail.com wrote:
> If something like this is used, msm-timer require interrupts. Without this
> configuration, the device is unbootable as the system froze on system
> bootup.
> 
> timer@200a000 {
> 			compatible = "qcom,kpss-timer", "qcom,msm-timer";
> 			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
> 						 IRQ_TYPE_EDGE_RISING)>,
> 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
> 						 IRQ_TYPE_EDGE_RISING)>,
> 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) |
> 						 IRQ_TYPE_EDGE_RISING)>,
> 				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) |
> 						 IRQ_TYPE_EDGE_RISING)>,
> 				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
> 						 IRQ_TYPE_EDGE_RISING)>;
> 			no-pretimeout;
> 			reg = <0x0200a000 0x100>;
> 			clock-frequency = <25000000>,
> 					  <32768>;
> 			clocks = <&sleep_clk>;
> 			clock-names = "sleep";
> 			cpu-offset = <0x80000>;
> 		};
> 

I think this is all wrong; the new property shows up in a node which
is completely unrelated to a watchdog. Maybe it wasn't such a good idea
to tie the watchdog to the timer node. At the very least, the situation
should be handled in the driver via of_table flags. If the situation can't
be handled that way, something is even more wrong. In that case it might
be better to revert commit 36375491a439 until that is sorted out properly.

Guenter

> > On Tue, Feb 04, 2020 at 04:21:01PM +0100, Ansuel Smith wrote:
> > > Some platform like ipq806x doesn't support pretimeout.
> > > As the driver check if there are available interrupts and ipq806x
> > > use msm-timer that require interrupts, the watchdog fail to probe
> > > as request_irq tries to use a ppi interrupt. Add an option to skip
> > > pretimeout setup and use the normal watchdog probe.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/watchdog/qcom-wdt.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> > > index a494543d3ae1..e689e97e883e 100644
> > > --- a/drivers/watchdog/qcom-wdt.c
> > > +++ b/drivers/watchdog/qcom-wdt.c
> > > @@ -189,6 +189,7 @@ static int qcom_wdt_probe(struct platform_device
> > *pdev)
> > >  	u32 percpu_offset;
> > >  	int irq, ret;
> > >  	struct clk *clk;
> > > +	bool nopretimeout;
> > >
> > >  	regs = of_device_get_match_data(dev);
> > >  	if (!regs) {
> > > @@ -204,6 +205,8 @@ static int qcom_wdt_probe(struct platform_device
> > *pdev)
> > >  	if (!res)
> > >  		return -ENOMEM;
> > >
> > > +	nopretimeout = of_property_read_bool(np, "no-pretimeout");
> > > +
> > >  	/* We use CPU0's DGT for the watchdog */
> > >  	if (of_property_read_u32(np, "cpu-offset", &percpu_offset))
> > >  		percpu_offset = 0;
> > > @@ -247,7 +250,7 @@ static int qcom_wdt_probe(struct platform_device
> > *pdev)
> > >
> > >  	/* check if there is pretimeout support */
> > >  	irq = platform_get_irq(pdev, 0);
> > > -	if (irq > 0) {
> > > +	if (!nopretimeout && irq > 0) {
> > 
> > That is unnecessary; such platforms should simply not provide an
> interrupt.
> > Or, in other words, what is the point of assigning an interrupt to be used
> > for pretimeout if the platform doesn't support it ? And then to add yet
> > another attribute to tell the driver not to use it ?
> > 
> > Guenter
> > 
> > >  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> > >  				       IRQF_TRIGGER_RISING,
> > >  				       "wdt_bark", &wdt->wdd);
> > > --
> > > 2.24.0
> > >
> 
