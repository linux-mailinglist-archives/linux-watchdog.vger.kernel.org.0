Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA65E151F7A
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 18:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBDRar (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 12:30:47 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35164 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBDRar (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 12:30:47 -0500
Received: by mail-wr1-f67.google.com with SMTP id w12so13223993wrt.2;
        Tue, 04 Feb 2020 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dKb+2vXfSa15czwnAW1BPHH/lZLrvUB+89CORs28USQ=;
        b=bu4u7EiPcwy3dR9XXChdvY+2QuOwyrnBCocvyHJz+uzByTjtOH0OM0cLcsZG9VwPRH
         0aGCpE2SKOBF44qBat/IrAALOE5TOctSpwV8zRXi+wDSj0uXCJ/Bsl8I1ZT3V+LdoO4R
         Yvh+6NtQ0VAtaooGr/fWLn+jlzeNeQtXISv0JLdk/mxgZcF/pJOdTw2xQoJgRp8m7HJ0
         fZX+Aqh2eKd6MpErTFrKh1kqAPY8dWeZrFjkwKuBYwrkdYH+9d9a1drc/vm++YJ8MOis
         rJQ9KOPC3cHvl7hUCtaa6ChXKAXkYmjmu8yIMqJfNp0Fr5x96nAoh8Wm0WeGJJzRmr6J
         oxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dKb+2vXfSa15czwnAW1BPHH/lZLrvUB+89CORs28USQ=;
        b=j92eAoYi+r9Id1l1bPgldq9Hi9hJwSFla3BIMnzqs2w6n4esWw+sxYEZ1dvl38gkys
         1bb5XJfx+LFpPJwz0WWSpqCNBzT80tq41sEuiJqIa4u9ERI9pSZCOIvRiHNoFWfj2hkG
         FgwNuLU05fFxFOr46paAYa5UxKlIqGtJ7AxK9FDZEXMARXQe+JEqymZfU3E3cDHn10Ub
         E18nC935mb4pnuTL10hOe5rNQmainTlOHeqsn5DQnyoaDVrepsWcSJkyBVF4dMa8dv64
         gEnyTKyRERWC4pbdaJKYl49TVcp8Qpuni57hbVY5O1mqMoqr+lBs1syvN5tsECnpC3C1
         QPEA==
X-Gm-Message-State: APjAAAUF+9BZS6UMPR8sEDIKAPadu9CUMgtiXU2EouhkhLRk+9W0GvU/
        cnE8Uc6LnfdAykPVwpoNx8fNJjYE9ng=
X-Google-Smtp-Source: APXvYqxIOhls5KKicZxJ2jvCKlSBIJ4c3b6KDZN+py5MgxprlFzxofr9CvQHepvrqquwq3RBPgP3pQ==
X-Received: by 2002:adf:e610:: with SMTP id p16mr4794240wrm.81.1580837444314;
        Tue, 04 Feb 2020 09:30:44 -0800 (PST)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.gmail.com with ESMTPSA id e22sm4697122wme.45.2020.02.04.09.30.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 09:30:43 -0800 (PST)
From:   <ansuelsmth@gmail.com>
To:     "'Guenter Roeck'" <linux@roeck-us.net>
Cc:     "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Wim Van Sebroeck'" <wim@linux-watchdog.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200204152104.13278-1-ansuelsmth@gmail.com> <20200204160824.GA17320@roeck-us.net> <035201d5db76$78f56670$6ae03350$@gmail.com> <20200204162516.GA22814@roeck-us.net>
In-Reply-To: <20200204162516.GA22814@roeck-us.net>
Subject: R: R: [PATCH 1/3] watchdog: qcom-wdt: add option to skip pretimeout
Date:   Tue, 4 Feb 2020 18:30:40 +0100
Message-ID: <035f01d5db80$d2ed1fb0$78c75f10$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQHIAHuJN4fpJ8MkOCYMUgPEMn1OlAJOMHpaAfXvMGYCLKZZlqfzeb9g
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> On Tue, Feb 04, 2020 at 05:16:34PM +0100, ansuelsmth@gmail.com wrote:
> > If something like this is used, msm-timer require interrupts. Without
this
> > configuration, the device is unbootable as the system froze on system
> > bootup.
> >
> > timer@200a000 {
> > 			compatible = "qcom,kpss-timer", "qcom,msm-timer";
> > 			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
> > 						 IRQ_TYPE_EDGE_RISING)>,
> > 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
> > 						 IRQ_TYPE_EDGE_RISING)>,
> > 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) |
> > 						 IRQ_TYPE_EDGE_RISING)>,
> > 				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) |
> > 						 IRQ_TYPE_EDGE_RISING)>,
> > 				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
> > 						 IRQ_TYPE_EDGE_RISING)>;
> > 			no-pretimeout;
> > 			reg = <0x0200a000 0x100>;
> > 			clock-frequency = <25000000>,
> > 					  <32768>;
> > 			clocks = <&sleep_clk>;
> > 			clock-names = "sleep";
> > 			cpu-offset = <0x80000>;
> > 		};
> >
> 
> I think this is all wrong; the new property shows up in a node which
> is completely unrelated to a watchdog. Maybe it wasn't such a good idea
> to tie the watchdog to the timer node. At the very least, the situation
> should be handled in the driver via of_table flags. If the situation can't
> be handled that way, something is even more wrong. In that case it might
> be better to revert commit 36375491a439 until that is sorted out properly.
> 
> Guenter
> 

So pretimeout should be enabled only for kpss-wdt and disabled with a flag 
in the of_table of the driver?

> > > On Tue, Feb 04, 2020 at 04:21:01PM +0100, Ansuel Smith wrote:
> > > > Some platform like ipq806x doesn't support pretimeout.
> > > > As the driver check if there are available interrupts and ipq806x
> > > > use msm-timer that require interrupts, the watchdog fail to probe
> > > > as request_irq tries to use a ppi interrupt. Add an option to skip
> > > > pretimeout setup and use the normal watchdog probe.
> > > >
> > > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > > ---
> > > >  drivers/watchdog/qcom-wdt.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/watchdog/qcom-wdt.c
b/drivers/watchdog/qcom-wdt.c
> > > > index a494543d3ae1..e689e97e883e 100644
> > > > --- a/drivers/watchdog/qcom-wdt.c
> > > > +++ b/drivers/watchdog/qcom-wdt.c
> > > > @@ -189,6 +189,7 @@ static int qcom_wdt_probe(struct platform_device
> > > *pdev)
> > > >  	u32 percpu_offset;
> > > >  	int irq, ret;
> > > >  	struct clk *clk;
> > > > +	bool nopretimeout;
> > > >
> > > >  	regs = of_device_get_match_data(dev);
> > > >  	if (!regs) {
> > > > @@ -204,6 +205,8 @@ static int qcom_wdt_probe(struct platform_device
> > > *pdev)
> > > >  	if (!res)
> > > >  		return -ENOMEM;
> > > >
> > > > +	nopretimeout = of_property_read_bool(np, "no-pretimeout");
> > > > +
> > > >  	/* We use CPU0's DGT for the watchdog */
> > > >  	if (of_property_read_u32(np, "cpu-offset", &percpu_offset))
> > > >  		percpu_offset = 0;
> > > > @@ -247,7 +250,7 @@ static int qcom_wdt_probe(struct platform_device
> > > *pdev)
> > > >
> > > >  	/* check if there is pretimeout support */
> > > >  	irq = platform_get_irq(pdev, 0);
> > > > -	if (irq > 0) {
> > > > +	if (!nopretimeout && irq > 0) {
> > >
> > > That is unnecessary; such platforms should simply not provide an
> > interrupt.
> > > Or, in other words, what is the point of assigning an interrupt to be
used
> > > for pretimeout if the platform doesn't support it ? And then to add
yet
> > > another attribute to tell the driver not to use it ?
> > >
> > > Guenter
> > >
> > > >  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> > > >  				       IRQF_TRIGGER_RISING,
> > > >  				       "wdt_bark", &wdt->wdd);
> > > > --
> > > > 2.24.0
> > > >
> >

