Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAFF29A7A9
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Oct 2020 10:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505458AbgJ0JVp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Oct 2020 05:21:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45709 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404528AbgJ0JVp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Oct 2020 05:21:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id e17so983962wru.12;
        Tue, 27 Oct 2020 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z186JCjjaFAvCwc5lnsVqYkaLznjMGEXbtq2BCuMZUU=;
        b=R/zY8H/5RPpLm3egn2ta5iUiZIwEuBzVCXPw+Lg91p9vvPRrGBl2piv7GEZSMLjpfE
         ueb6cEurQZV2EBfy0xfbCkbpmsNtkSng1lab2hKeN2VHcpLcwer2p7ySHksmrwhHzCaA
         isMvam17ZW1fhjfjzEHD5oFU6pms1bfxiLTPWXI+8vas75xeAxnyN6HBUxnJddury4Ba
         VKWdjVUTfQkcLzGv49PIDfpjKrMcfepltj5TeQAFbPfSMjYD6JmZl6Xjj87LZL2tsimi
         waq91nLJhvvTJFvEBLnpZF0d/90+4zf+GaLd9IxeD7YcM72URPo04KwM/wTDY9F+0kp6
         Gvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z186JCjjaFAvCwc5lnsVqYkaLznjMGEXbtq2BCuMZUU=;
        b=dL/AnY3VCiQMI+C7MWRbLlwZl5Y9zsTmWmO2TU+X2hRhCU+URVIsWi0J6xzzpG6pbP
         QH9LKoGjKuv0PjNrAX1TmC0YrXmsZmimWV8KPfmRT3lffDT0xA9Do2Snh1WPhuL2L2q+
         wwmnO3YyCVdtL/wYHipD6LVspFohNrMZgByuRt7n3PHmkzwJOQMzbmcW8xhOch9ksVtH
         4sTjqYbibcufugJ7+qqG3lpebPKzSOTHLYUZJg7XflM58GPY34E0p+nuXPPMVaFD1Cxv
         kkAR0Emoga2ZpZa0yWFt3OK394Mb9xFSAXFVyqMJ9KDuF54V96fu98c9Igv2LSNERjBl
         z6ug==
X-Gm-Message-State: AOAM533rFWZoq/kjhxNcYMTMDKjOiEbYdpej4GPRr4Oh3AYgM/rVZxYU
        YztejqjRDsQ8No5ohmcfcP9jolrxL9pF2vbpHek=
X-Google-Smtp-Source: ABdhPJzLZIQloIRWMS3CKSzfJxNeKxMuq7Fc6dt5T+aLr/rd4csjRbbxN9ImnAaNVvWLX9fEwgmSwsjd/e6BlOpueGQ=
X-Received: by 2002:a5d:554b:: with SMTP id g11mr1665906wrw.370.1603790502743;
 Tue, 27 Oct 2020 02:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201026080919.28413-1-zhang.lyra@gmail.com> <20201026080919.28413-3-zhang.lyra@gmail.com>
 <1bb8a3cf-5cdf-2c7f-29a2-3307f0de7cb0@roeck-us.net>
In-Reply-To: <1bb8a3cf-5cdf-2c7f-29a2-3307f0de7cb0@roeck-us.net>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 27 Oct 2020 17:21:06 +0800
Message-ID: <CAAfSe-v1Qt1KG0DowigYWG=pK2abQ5UzQv4FqWRq8_YzYqKz7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] watchdog: sprd: change timeout value from 1000 to 2000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        jingchao.ye@unisoc.com, ling_ling.xu@unisoc.com,
        xiaoqing.wu@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 26 Oct 2020 at 22:36, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> > From: Lingling Xu <ling_ling.xu@unisoc.com>
> >
> > Because cpu_relax() takes different time on different SoCs, for some rare
> > cases, it would take more than 1000 cycles for waitting load operation
>
> waiting

Ok.

>
> > finished. The result of many times testing verified that changing the
> > timeout value to 2000 can solve the issue.
> >
>
> This is just a kludge that doesn't address the underlying problem.
> As the wait loop states, "Waiting the load value operation done,
> it needs two or three RTC clock cycles". This means the loop
> should wait for a maximum number of clock cycles, and not run
> as hot loop. If we assume that clk_get_rate() returns the clock
> frequency, that frequency can be used to determine how long this
> needs to be retried. It might also make sense - depending on how
> long this actually takes - to use usleep_range() instead of
> cpu_relax() to avoid the hot loop.

Agree, using usleep_range() instead makes more sense, I will look into that.

Thanks for your review.

Chunyan

>
> Guenter
>
> > Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> > Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> >  drivers/watchdog/sprd_wdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> > index f3c90b4afead..4f2a8c6d6485 100644
> > --- a/drivers/watchdog/sprd_wdt.c
> > +++ b/drivers/watchdog/sprd_wdt.c
> > @@ -53,7 +53,7 @@
> >
> >  #define SPRD_WDT_CNT_HIGH_SHIFT              16
> >  #define SPRD_WDT_LOW_VALUE_MASK              GENMASK(15, 0)
> > -#define SPRD_WDT_LOAD_TIMEOUT                1000
> > +#define SPRD_WDT_LOAD_TIMEOUT                2000
> >
> >  struct sprd_wdt {
> >       void __iomem *base;
> >
>
