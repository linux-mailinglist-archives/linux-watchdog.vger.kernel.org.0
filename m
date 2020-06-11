Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DA81F6C9B
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 19:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgFKRJw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 13:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgFKRJv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 13:09:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3DCC08C5C1;
        Thu, 11 Jun 2020 10:09:50 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z63so2009129pfb.1;
        Thu, 11 Jun 2020 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tyHbXeosM2dGn8ctHsVNHECdKzxXjGiOzze56QKF4fM=;
        b=qNg4jL/ViHHZH09XkCQBWqC5JTg6PQgIK1Z6UnNZErJ7PVvQWXyRK358nn0RhTwslk
         11uBBTkxv646xxvpuQdkuz6GFk4jTgku/n6lDPPURQplHkJOZUTkGdNLl73NnPvtJ7or
         GB2PZTcvtnhI6oyHICzvtPn7LV4mHZYZ7IIjANClS2Tqs6dZbr11a76kL+E0MSdXop/s
         OYFTWuO19zU+dQwYLOi4P01Sj+68P+mnhI4UzsaC1Hj64UlTUfintmt2a8bYYiWtUm/3
         DHp/QhMmLOnrgIF8ODhDBC4rche77xMTtwYSjo/kFy2pWu6h5CErMmo/AUuHVKAdvLbX
         vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=tyHbXeosM2dGn8ctHsVNHECdKzxXjGiOzze56QKF4fM=;
        b=IBM67AWlrC276jAs2ZBTz610yNq6Ja++XVCstarI1ns14c0DP4wVID0s8qMw2Ia+vN
         l0uNF16H/nc1ufRBtxZR58DZNVaPbbmZlDPQiVfoYgPePwwueDbqnnVHA3okbaPnZLOO
         SPmWF6Z2Vu5VZVbetNeNl1Pv9NqF/nJuMOgp9V812vkEB1SFJXyehlufbO5zoVGJ8dLq
         ywbQZghaUdBx/drq5XeJ8n1y7yJqxrf3IXKER/8a/176kHME6z2VqzN/RcYI3MMpE4Z3
         ZViZYNgRRwgYm/Pphb/yKx6a9PQRDhhdqF7nnxW/F8T9ZQYGFPg9pwhces+X0yZZI8UL
         BDMg==
X-Gm-Message-State: AOAM5308CjW5Etvc1B3RDAsydI0u84QTdQa5EsxAueGAm5K6YUzcDicB
        Bl5BYlVxjipETEnKvxoHl6I=
X-Google-Smtp-Source: ABdhPJyhoBlrc1apK/VfDXDccMgZT+ulv/6Cc2mm4EZHUfi5UyuQ5GrxawPgG6uBpsO/602D1sqvcA==
X-Received: by 2002:a62:c105:: with SMTP id i5mr8205394pfg.250.1591895389697;
        Thu, 11 Jun 2020 10:09:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b7sm3570250pfo.202.2020.06.11.10.09.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 10:09:47 -0700 (PDT)
Date:   Thu, 11 Jun 2020 10:09:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, robbh@kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: intel: Add YAML Schemas for
 Watchdog timer
Message-ID: <20200611170946.GA70281@roeck-us.net>
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <ac89e289b79fec0a82d1dd060e17eeca024885d5.1591584255.git.eswara.kota@linux.intel.com>
 <235d301b-3b25-bb00-bd1b-c4392fa23c63@roeck-us.net>
 <4a336f1d-68da-3356-a73a-95747ba4af4c@linux.intel.com>
 <83812b78-41e3-299d-36a0-6ce1576e7e78@roeck-us.net>
 <aabceb6f-265d-fd11-eee1-6bccf2160512@linux.intel.com>
 <c294ced9-a37b-6a90-511e-187bacdec80c@roeck-us.net>
 <4feae044-1956-fb70-7786-19c7c48cc391@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4feae044-1956-fb70-7786-19c7c48cc391@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 05:38:14PM +0800, Dilip Kota wrote:
> 
> On 6/10/2020 9:05 PM, Guenter Roeck wrote:
> > On 6/10/20 12:54 AM, Dilip Kota wrote:
> > > On 6/9/2020 9:46 PM, Guenter Roeck wrote:
> > > > On 6/9/20 1:57 AM, Dilip Kota wrote:
> > > > > On 6/8/2020 9:37 PM, Guenter Roeck wrote:
> > > > > > On 6/7/20 10:49 PM, Dilip Kota wrote:
> [...]
> > > > > > > +
> > > > > > > +description: |
> > > > > > > +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
> > > > > > > +  be configured as Clocksource, real time clock and Watchdog timer.
> > > > > > > +  Each General Purpose Timer Counter has three timers. And total four General
> > > > > > > +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
> > > > > > > +  to 12 timers.
> > > > > > > +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
> > > > > > > +  timer as watchdog timer. Total four timers are configured as watchdog timers
> > > > > > > +  on Lightning Mountain SoC.
> > > > > > > +
> > > > > > Why not just one ? The watchdog subsystem does not monitor individual CPUs,
> > > > > > it monitors the system.
> > > > > Intel Atom based Lightning Mountain SoC, system has four CPUs. On Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers and reset controller unit. On Lightning Mountain SoC, each CPU is configured with one GPTC timer, so that if any of the CPU hangs or freezes, the watchdog daemon running on respective CPU cannot reset/ping or pet the watchdog timer. This causes the watchdog timeout. On watchdog timeout, reset controller triggers the reset to respective CPU.
> > > > > 
> > > > A system watchdog driver should not duplicate functionality
> > > > from kernel/watchdog.c, which monitors individual CPUs.
> > > > If the SoC does nto provide a system watchdog timer (which
> > > > I think is unlikely), it should stick with that. A watchdog
> > > > resetting an individual CPU instead of the entire system
> > > > isn't something I would want to see in the watchdog subsystem.
> > > My bad here, complete hardware reset happens on watchdog timeout not a single CPU or core.
> > > Could you please clarify: The complete system means, you mean, "a watchdog susbsystem should monitor all the cores/cpus in the SoC. Not like each core/cpu in SoC having a wdt".
> > > 
> > No, the watchdog subsystem does not monitor "all cores".
> > Again, that is the responsibility of kernel/watchdog.c.
> I am a bit confused here.
> I have gone through the kernel/watchdog.c code and i see hrtimers are used
> and panic is triggered for lockup on CPU/core.
> It looks similar to the watchdog subsystem which uses wdt and triggers
> hardware reset on timeout, whereas kernel/watchdog.c using hrtimers and
> triggers panic on timeout.
> To my understanding Watchdog timer recovers the hardware from software hangs
> or freeze states on the CPU / cores.
> Also, what does system mean in your statement " watchdog subsystem monitors
> the system"? What all comes under the system other than the cores/cpus.
> And also i see there is no other watchdog subsystem in Lightning Mountain
> architecture.
> 

From my perspective, we are not going to duplicate functionality covered
by kernel/watchdog.c, which means we are not going to support per cpu core
watchdog drivers in drivers/watchdog.

If you insist doing it anyway, please disuss with Wim.

Thanks,
Guenter
