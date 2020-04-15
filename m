Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0CF1AB40D
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 01:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388105AbgDOXMV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Apr 2020 19:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388104AbgDOXMS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Apr 2020 19:12:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F75DC061A0C;
        Wed, 15 Apr 2020 16:12:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so520573pjb.3;
        Wed, 15 Apr 2020 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F4xy1ePNo4/sZnGsQ3y2Wap+w9rXMc+z0VuLe1xlqjQ=;
        b=jbf+wIu44k/DfZ3pl3RN+n8kY8thZUYIw2Ipq5qKiQqOd/un49pRkXwqToVPR3gfGM
         5lzD4YNJtHJ0TGIWKmkezhGKrohuQUNdMiKAzjgH4WQ0s5uhMDPh+7VtzTnU6ZF7LMYL
         AArC6zrxH/IvRd+ZEHod9VC+ODN/CPXgaHPQj7INdhHFYuBjxAOOaGhNwOV7dUpyS2qz
         vvderTdPOUm401Bji072y+qFP0V/DdRRmegOHp2CObNYas3awA3FjgTC3n2QM+RjU7d1
         sW2K1ZtsER7ExRKQfhhSylNPe65vHzYtoQLWVx1cmcLnuRLqHO/Y05+1qQq5GFHPRxgI
         KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=F4xy1ePNo4/sZnGsQ3y2Wap+w9rXMc+z0VuLe1xlqjQ=;
        b=PvyF6y/dspDli9XoY7OG2U8WnzLKkEif4JD1HoB3JL0EwAX7OzntC/DGGTTXdBZPnN
         QXk65JIRkdyDxzHPAw2+4CzwDXyEIKar11ytXNQq5IYMZTdfZj7v0Rc4am6kgLV0JtTx
         PP5S4Umn6o3F+k5oRvs+ufTJeHqkVMLGFUPwOySu7IczEjLm26JoJKL+rvovGcyBwiUC
         AjtFnBFcfkjAihSiCgGeQZ7An+l8cjyKvesCBL57dnV68RS2eyfg3tc0IjucNotVegr9
         pLboSRkzXqv99VD5qacB5dxTEfBifKJFOdSKQrEcZcvrqnhsinemz56SPAPessokG0Gp
         lLdg==
X-Gm-Message-State: AGi0PuYCJESJ9xEBWtJLLnlFLvTE/p5GImPcP4I+AVa22gxKR0+Z98j0
        hs5YFqqGAowLqatSchLdozY=
X-Google-Smtp-Source: APiQypIYdvm0Liaxe68090I5H87tFeGCrKfeq9nu/dduUJbnTStMnEQZdx4m1HvArqBCM2DSzI/AIA==
X-Received: by 2002:a17:902:7289:: with SMTP id d9mr6991775pll.49.1586992337834;
        Wed, 15 Apr 2020 16:12:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l71sm9190804pge.3.2020.04.15.16.12.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 16:12:17 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:12:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Julius Werner <jwerner@chromium.org>
Cc:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Evan Benn <evanbenn@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure
 Monitor Calls.
Message-ID: <20200415231215.GA182398@roeck-us.net>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 15, 2020 at 03:29:29PM -0700, Julius Werner wrote:
> > In addition, It looks more reasonable to use the "msec" as the unit of
> > timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
> >
> > - The fw interface will compatible with the uboot generic watchdog
> > interface at [0], and there is no need to convert timeout from msec
> > to sec.
> 
> I think we're trying hard to keep this compatible to a Trusted
> Firmware counterpart that we have already shipped, so we would prefer
> to keep it at seconds if possible. That's what the Linux watchdog core
> uses as well after all, so it just seems natural. I don't really see
> how what U-Boot does would have anything to do with this.
> 
> > - Some vendor's watchdog may be not support the "wdt_trigger_reset"
> > reset operation, but they can use the method below to reset the system
> > by the watchdog right now.
> >
> > watchdog_set_time(1);  //1ms
> > watchdog_enable();
> 
> They can still do that but they should do that on the Trusted Firmware
> side. Emulating a missing reset functionality should be handled by the
> hardware abstraction layer (in this case Trusted Firmware), not at the
> Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> but then Trusted Firmware can choose to implement that by setting the
> watchdog to the smallest possible timeout (which it can because it's
> accessing it directly, not through this SMC interface) and letting it
> expire.

I agree. Using a watchdog to implement reset functionality is always a
means of last resort and should be avoided if possible.

Guenter
