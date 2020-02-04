Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFB4151E0C
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 17:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgBDQQk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 11:16:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55226 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgBDQQk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 11:16:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id g1so3931194wmh.4;
        Tue, 04 Feb 2020 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=SXm3XL3dA+/VBPTJD5LXtGXc0xkjEsC/eMsEFI2RJnI=;
        b=GZvXZumMysVKyH3+4yFvO8jSBxnPFKNXUpo1/Fgq41/5lQrRGqyKhpspC0vNYPWDRo
         B4rvjpTQGdo8W8S6XHF+utg3n0Joq2soyocY3IMqk8y4YXF5VDgmVn2mH2eevjyuB1dQ
         It4XVGrYBVGQyPGcpYM+IUvqaF+manJgRebB5SF8/3yFcBYsAMQzTf4fxUXNMFSd8y1A
         W6r3kdho9GKjRHbWrjFSt8RjQ042sAuGTYcE8NOpyVXs2Klt1naHxVPayUqGl8qh8FS5
         CQKnqZaLhooYKLUo6l4D5h0M88AVXOY8D5c/KvFAI90phdMpYYP5kTGtWdruwX0pM31T
         Fx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=SXm3XL3dA+/VBPTJD5LXtGXc0xkjEsC/eMsEFI2RJnI=;
        b=cj4t6ZCNlxFuhNEQ57m4tf5mFF2F1CfVANWcocAdlNUXcuYGmxe7YadUM1aHXrn0Tj
         FS84eF1DsQP9z2ihRSPB7WflcfR855hDAj3G/ipDwn5xMqPymdVBLHmKXV1o5DkQSnKE
         3wA1Vs6onmQNmgUnDk0Kzr9MqB5dMoStqRYzsQfdtyjXxLvo/E2uDODI8M9/qozbjBJ+
         NdcJXFZoPckODzvtZ/qGlVi23fsghWFN+pVIIONEz2qtEL/QMwcm9+/KlUfOAiHx37bU
         vxYvEluYa4T5wjo2qK6N0zMeOjJ6RtkYlLOobCuv5kFGfUtuRG7nhnK8M5RWZkWCcUKP
         DbAQ==
X-Gm-Message-State: APjAAAWhAJegdEiuEHgFDIOI2q3KW4oiXMtlsgaSA2i2f7ufHYGSzkr1
        ywz/i05CJsRKb5KPCCQECsw=
X-Google-Smtp-Source: APXvYqy8EwE7BuzVxXfZC2hABmQrghLVi0aOkNSWaMucsFv9DSaW1miCEOeS8WT8Sq5bgp3n81GVog==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr6645639wmb.54.1580832998607;
        Tue, 04 Feb 2020 08:16:38 -0800 (PST)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.gmail.com with ESMTPSA id n16sm31045987wro.88.2020.02.04.08.16.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 08:16:37 -0800 (PST)
From:   <ansuelsmth@gmail.com>
To:     "'Guenter Roeck'" <linux@roeck-us.net>
Cc:     "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Wim Van Sebroeck'" <wim@linux-watchdog.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200204152104.13278-1-ansuelsmth@gmail.com> <20200204160824.GA17320@roeck-us.net>
In-Reply-To: <20200204160824.GA17320@roeck-us.net>
Subject: R: [PATCH 1/3] watchdog: qcom-wdt: add option to skip pretimeout
Date:   Tue, 4 Feb 2020 17:16:34 +0100
Message-ID: <035201d5db76$78f56670$6ae03350$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQHIAHuJN4fpJ8MkOCYMUgPEMn1OlAJOMHpaqBR5SfA=
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If something like this is used, msm-timer require interrupts. Without this
configuration, the device is unbootable as the system froze on system
bootup.

timer@200a000 {
			compatible = "qcom,kpss-timer", "qcom,msm-timer";
			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
						 IRQ_TYPE_EDGE_RISING)>,
				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
						 IRQ_TYPE_EDGE_RISING)>,
				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) |
						 IRQ_TYPE_EDGE_RISING)>,
				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) |
						 IRQ_TYPE_EDGE_RISING)>,
				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
						 IRQ_TYPE_EDGE_RISING)>;
			no-pretimeout;
			reg = <0x0200a000 0x100>;
			clock-frequency = <25000000>,
					  <32768>;
			clocks = <&sleep_clk>;
			clock-names = "sleep";
			cpu-offset = <0x80000>;
		};

> On Tue, Feb 04, 2020 at 04:21:01PM +0100, Ansuel Smith wrote:
> > Some platform like ipq806x doesn't support pretimeout.
> > As the driver check if there are available interrupts and ipq806x
> > use msm-timer that require interrupts, the watchdog fail to probe
> > as request_irq tries to use a ppi interrupt. Add an option to skip
> > pretimeout setup and use the normal watchdog probe.
> >
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  drivers/watchdog/qcom-wdt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> > index a494543d3ae1..e689e97e883e 100644
> > --- a/drivers/watchdog/qcom-wdt.c
> > +++ b/drivers/watchdog/qcom-wdt.c
> > @@ -189,6 +189,7 @@ static int qcom_wdt_probe(struct platform_device
> *pdev)
> >  	u32 percpu_offset;
> >  	int irq, ret;
> >  	struct clk *clk;
> > +	bool nopretimeout;
> >
> >  	regs = of_device_get_match_data(dev);
> >  	if (!regs) {
> > @@ -204,6 +205,8 @@ static int qcom_wdt_probe(struct platform_device
> *pdev)
> >  	if (!res)
> >  		return -ENOMEM;
> >
> > +	nopretimeout = of_property_read_bool(np, "no-pretimeout");
> > +
> >  	/* We use CPU0's DGT for the watchdog */
> >  	if (of_property_read_u32(np, "cpu-offset", &percpu_offset))
> >  		percpu_offset = 0;
> > @@ -247,7 +250,7 @@ static int qcom_wdt_probe(struct platform_device
> *pdev)
> >
> >  	/* check if there is pretimeout support */
> >  	irq = platform_get_irq(pdev, 0);
> > -	if (irq > 0) {
> > +	if (!nopretimeout && irq > 0) {
> 
> That is unnecessary; such platforms should simply not provide an
interrupt.
> Or, in other words, what is the point of assigning an interrupt to be used
> for pretimeout if the platform doesn't support it ? And then to add yet
> another attribute to tell the driver not to use it ?
> 
> Guenter
> 
> >  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> >  				       IRQF_TRIGGER_RISING,
> >  				       "wdt_bark", &wdt->wdd);
> > --
> > 2.24.0
> >

