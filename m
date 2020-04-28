Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E526E1BCD02
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 22:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgD1UHC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 16:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD1UGf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 16:06:35 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE08C03C1AB
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Apr 2020 13:06:35 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c24so22780429uap.13
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Apr 2020 13:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWN2pTS6iB36h7DaRZrhXtMe3/2D3xJNS6+5ajy+5jY=;
        b=lxlBvAi5+Kp0E1kvuLZIfX3f5amfiRbPoT6rwz3YRt6V2J5+GvjYw+NTGMfqvzrN5e
         8VVsWcLM3UTsASESHTZPQ57s3QqSBVpqWcc2FO4IpeAbwUgcS0LVqe1vsODS2nG7Bz+d
         FscPV1JN0QyruGS7iIFxIIT5zT9F53xrKisX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWN2pTS6iB36h7DaRZrhXtMe3/2D3xJNS6+5ajy+5jY=;
        b=TuNRDyQu9W7xaU7UPHZg45ONrm4+vKgEh2PF4SDHsR/QTCITVmNZj9KkP+wsmZGmv4
         iXkFWORRbawyMPubugYBw7RzJzgFzWQMQ385lFgejSXWoRpZABWhh0G1+Ec1iAXgYAj5
         LKGySrrmDBCUfTWQjLWeOizJc0erDJvMsVPIbwzNgNOZ8Nue+zVo2VejtFN7qk8A1h34
         NQTdklA2KCiXCndbDcsXQ2fHYm5lzQg0F1pkdRXKsokLCVqc669wzWXsLz3s35QLo6qF
         +5k/U9LHcm6/nahSbknUgPakqDKUkzbJ2+/05LQmp/HU+QuYSmiq1+zIkas0anjPdJAt
         0O1g==
X-Gm-Message-State: AGi0Pua2SYS81PPiPNKT59m7o9lMUwjjv/nXseMeTt1rKA4IqZkmeh5f
        zRuaZEeV4MtzEzM+624axVuWkgJ3dD+r2yix97a09g==
X-Google-Smtp-Source: APiQypJ5GASwyuTmq6vb+mMs8GlOiPOB+ZU/74cFC69Z5RtuhkUtZGHT2TQvquei4X23XLIf2FoJH6WJiKs+6iDLpWw=
X-Received: by 2002:ab0:689a:: with SMTP id t26mr24178132uar.105.1588104394359;
 Tue, 28 Apr 2020 13:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org>
 <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com> <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
In-Reply-To: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 28 Apr 2020 13:06:21 -0700
Message-ID: <CAODwPW9STGmh5EZjhxARmY+PFLC_UoQYxbfGoRTD5w4BvMv=0g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     Julius Werner <jwerner@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> I think I have misunderstood the device tree json-schema spec.
> My intention was for the device tree to fill in a default value in the dtb for
> arm,smc-id if it was omitted in the dts. But now I see that does not seem to
> happen, I cannot really find any documentation of `default`, so I will just put
> a documentation string in instead and force the default in the driver.

The bindings in Documentation/device-tree are just for informational
purposes, they do not have any direct effect on anything. If you want
there to be a default, you'll have to write the kernel code to fill it
in.
