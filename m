Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49346151F91
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 18:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBDRhV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 12:37:21 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35275 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgBDRhV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 12:37:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id q39so1697915pjc.0;
        Tue, 04 Feb 2020 09:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jRjcj/VJ7A9kdBwbhVlZG6Ayb9eCm4/PVayam2B0eBA=;
        b=uoR4KL1uKqJBStzO/JDHuWnpa9mC8rix26XYVdaBr7Cz4mZHfyWGsbeE/myQHlJrHt
         n8xWVieFoqAuXS206uRM5MRyF7VuWhT5wn5+nCZE/bGlW4q6B6aiHuJ38KZonamd74UK
         cuQpOLzpsssvZJ3b/haYr2Isl6OSaObekItK7GQ1LjlRj2ExvuaTl9/tmeNvzhGCyics
         l2KukTfliq10pu6rH9qwwsfFf9qcemhoNIRWsxEruiZtk7pOM/lgpA4lqsQH1bQ6qWeO
         7ax/oNGGb83hnH1dJ4GR/jMU3hhb5+vWLl5XyPBROBDDqR74dtitpmudcz1qTjCn+4WG
         b98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jRjcj/VJ7A9kdBwbhVlZG6Ayb9eCm4/PVayam2B0eBA=;
        b=rPKtbRlK9Ty4KwIj8+hO0m46QjJ7j6OzJ8ev0zuPzWG1U6tuRkHn0z6x/dJBIUbHdM
         pJ4mE6gTgig5S/VjZy7n9u7IGfFSCx4dPqHyhUQJwhDoTNiqrAlmjY7s2jJfdQ9DzWSR
         cvOhu49JE84hoGYXp7wEnuuBXwR0OZiOP0/W6G6JhIcZKM4FkWSE0TihbObCYuPzzu8d
         9vt21I7pEASIDG5G5zjN275xEKOyez5ArFPY0U5q77RMBmsgeqY7DbzDe5l5ArLuGwUw
         dQcY9bC3QzYVwRqaVZAWBI4187KHGUQfsEOChFGZx1cft1SHPKcPlSwzb4rtqMyIFHM1
         7u5Q==
X-Gm-Message-State: APjAAAURDxP+EwKT0OIy78I247vCgVAIY9RZ/R3eygqehiB2fZLzlLtB
        ARItaxuAwCAWopuaPMIJsUc=
X-Google-Smtp-Source: APXvYqy6Ik6qvV/q2oAsdNHITnU5LJJgHVNqOLjxz2QEyJpacbCpvipKCoB3ARIs8wV1gX86K67MYQ==
X-Received: by 2002:a17:902:740c:: with SMTP id g12mr32145514pll.166.1580837840541;
        Tue, 04 Feb 2020 09:37:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x197sm25258520pfc.1.2020.02.04.09.37.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 09:37:19 -0800 (PST)
Date:   Tue, 4 Feb 2020 09:37:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     ansuelsmth@gmail.com
Cc:     'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Wim Van Sebroeck' <wim@linux-watchdog.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: R: R: [PATCH 1/3] watchdog: qcom-wdt: add option to skip
 pretimeout
Message-ID: <20200204173718.GA10098@roeck-us.net>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
 <20200204160824.GA17320@roeck-us.net>
 <035201d5db76$78f56670$6ae03350$@gmail.com>
 <20200204162516.GA22814@roeck-us.net>
 <035f01d5db80$d2ed1fb0$78c75f10$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <035f01d5db80$d2ed1fb0$78c75f10$@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 06:30:40PM +0100, ansuelsmth@gmail.com wrote:
> > On Tue, Feb 04, 2020 at 05:16:34PM +0100, ansuelsmth@gmail.com wrote:
> > > If something like this is used, msm-timer require interrupts. Without
> this
> > > configuration, the device is unbootable as the system froze on system
> > > bootup.
> > >
> > > timer@200a000 {
> > > 			compatible = "qcom,kpss-timer", "qcom,msm-timer";
> > > 			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
> > > 						 IRQ_TYPE_EDGE_RISING)>,
> > > 				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
> > > 						 IRQ_TYPE_EDGE_RISING)>,
> > > 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) |
> > > 						 IRQ_TYPE_EDGE_RISING)>,
> > > 				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) |
> > > 						 IRQ_TYPE_EDGE_RISING)>,
> > > 				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
> > > 						 IRQ_TYPE_EDGE_RISING)>;
> > > 			no-pretimeout;
> > > 			reg = <0x0200a000 0x100>;
> > > 			clock-frequency = <25000000>,
> > > 					  <32768>;
> > > 			clocks = <&sleep_clk>;
> > > 			clock-names = "sleep";
> > > 			cpu-offset = <0x80000>;
> > > 		};
> > >
> > 
> > I think this is all wrong; the new property shows up in a node which
> > is completely unrelated to a watchdog. Maybe it wasn't such a good idea
> > to tie the watchdog to the timer node. At the very least, the situation
> > should be handled in the driver via of_table flags. If the situation can't
> > be handled that way, something is even more wrong. In that case it might
> > be better to revert commit 36375491a439 until that is sorted out properly.
> > 
> > Guenter
> > 
> 
> So pretimeout should be enabled only for kpss-wdt and disabled with a flag 
> in the of_table of the driver?
> 

Correct, if that is the determining factor.

Guenter
