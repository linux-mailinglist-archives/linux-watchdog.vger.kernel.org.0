Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C82396F3
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 22:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbfFGUlO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 16:41:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36766 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbfFGUlO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 16:41:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id d21so1255426plr.3;
        Fri, 07 Jun 2019 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ixc2M8woGOIxggbQrFACrPoIu4K++6YKpcQPW8eDSFw=;
        b=Pbx3lnAm6yRtx72O4losBkUP536cTibHA0OroXdLMJbYHOeTNX+T4zeDQu6HUVs7Pg
         Qjsnyckoa/CQmlV2Z8SKZeGXOzNbpnrmsXyX7Wu3oKi03XogaQR6CAlC5/hcsaQL6YlS
         ZPDsWOR61oDTzNOkIuJHfvm3yyxAM1eir0GPXNOAtC69fK1EumxyXW8QJPwswQ3Og8UC
         OSM5yVM5uxsqMp1lu7Z0F1W00Ra8CHnnKXsWH/1oFTzm0vSC2ws7fdvPa1xZcg+k9uP0
         ge8cqWHIORk20tnQeBiUQvHh9iWTyQ22Ky7OXVU000893ntmOO616eSdxVQz2TSW44GV
         OF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ixc2M8woGOIxggbQrFACrPoIu4K++6YKpcQPW8eDSFw=;
        b=nSdxglxwmAXn+p5kONvkGlny9S+PV9dW/NyCp4SJNk9nxAggLjrkpWO+Wn5pVVxPVO
         vMB26Dfrt+/LxA/vCk8I2SmbvHvHCBi5viSdzu+nMreDmY5SwxNrz+5J92YJaYwivisd
         R9hVzD05+MSuGjHKYmAinNDwjNTClgK7LYHLVwV4W61hZZO8SEXfO3DVHi2nJyIV5E1D
         ivUCm7Kg7P0ZUgp6yzrQoM7KRf0cMZeSJBlkDiZttvIHx4TRugU7DO4io3v7zoGtr3DT
         wouZ9w50RhIUN4exf4h1I+3ffCoz8mFy7a5oZPdzk2D7bYNHMt7qNqVg3PVaw8ro/crv
         0gUg==
X-Gm-Message-State: APjAAAW23VyUozjvj8q7gdYab28/CB7xdxzR7OSGDgSuObH0/MgbPeRM
        kSb0cqFGNcPx2p6BT5n0IOoDP3qm
X-Google-Smtp-Source: APXvYqxQHytqxDxJENMDlRhRcU267VAuufr2xj1Q2aEpPT582KBNbtCm0XCmkt3kps5uEox0V0Mufw==
X-Received: by 2002:a17:902:728b:: with SMTP id d11mr28359477pll.78.1559940073691;
        Fri, 07 Jun 2019 13:41:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8sm3412182pgb.76.2019.06.07.13.41.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 13:41:12 -0700 (PDT)
Date:   Fri, 7 Jun 2019 13:41:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: support handover from
 bootloader
Message-ID: <20190607204111.GA19123@roeck-us.net>
References: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
 <20190524135237.GC15892@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524135237.GC15892@kunai>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 24, 2019 at 03:52:37PM +0200, Wolfram Sang wrote:
> On Mon, Apr 15, 2019 at 12:52:01PM +0200, Wolfram Sang wrote:
> > Support an already running watchdog by checking its enable bit and set
> > up the status accordingly before registering the device.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> After second thought, I am getting confused a little. If the WDT is
> already running then
> 
> a) before this patch: after successful probe, RPM will disable the
> clock until userspace opens the watchdog device
> 
> b) after this patch: during probe, our default timeout will be
> programmed and because of WDOG_HW_RUNNING, the core will generate pings
> until userspace opens the watchdog device.
> 
> So, b) will protect from a crashing kernel (no pings anymore) but not
> from something like missing rootfs, or?
> 
> The usecase I had in mind ("give the kernel <x> seconds to boot into
> working userspace") seems to be achieved by loading the WDT driver as a
> module then, I guess?
> 

Would
https://lore.kernel.org/linux-watchdog/20190605140628.618-1-rasmus.villemoes@prevas.dk/

solve your use case ?

Guenter
