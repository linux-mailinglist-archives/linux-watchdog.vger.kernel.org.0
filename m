Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1498C133E21
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 10:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbgAHJOn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 04:14:43 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:40003 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgAHJOj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 04:14:39 -0500
Received: by mail-qv1-f68.google.com with SMTP id dp13so1088011qvb.7
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jan 2020 01:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPzHp/TCuO+PA2nHlHMVzeUghB/5uams6CZGUZBj35o=;
        b=K/jE8RWozDdRYmSsW9itFfvjGkVpL/zCzGu39X34ur7j0Be+cWMBI2auPmoluvn4c1
         /S/feNX81zbnksyn4ZVjM/8vfVA6T/7g7v52oVDY/X+5X9Y9F/hAbdyl8xKfHD3iR7ln
         3kR5KrCmE2zxPQDibCfArttMxzqMRbVfVXuiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPzHp/TCuO+PA2nHlHMVzeUghB/5uams6CZGUZBj35o=;
        b=tHyv6/HrPcmG95PWLdIooCCaaliSyjNdSLRs+vTntqPkb3zjPBieJLHwTTmRiJVme9
         xLCm1JBky/MsQ6pJ2K3MgvEF8OHMqQG++aB2ZIZxwXGLOX94SwgUf2l1MEkgzipWnXGk
         5kV8WlxWyPekJjgCR0Jd2OLgXMPPXmhuRnJBztEQeQUImwtbFN8eusH4A/aRa8sxK5pL
         XCOqBSSEAic0SIrSv5jh5wREztJnM4KtDeAlirwetuSraoZKhLm6owx0JbAKGRVCi3wP
         Bm58zHhp6DBgRQx58mlMp1d8G3T0JTWCTw55eiKcY0oAH1y1/Ax2t20ytuBd1YVuflHP
         9GCg==
X-Gm-Message-State: APjAAAVOL9fU0Zbl4PkvaCNdSM50F9XFpg0BjC0YSyWkdJyjaRvi73yk
        AaBjpxudnSy6VGo2HzI1NXpB+TlQ7ikNp9p5T37dFtZGyCE=
X-Google-Smtp-Source: APXvYqxf/pnt/xOzQY9MksejO/BRE5fT3xBR6Oezhn4Kzl/SblH+zp9r0nnNwuErhStHc9QFh2BYf2nQYASas+C1/yI=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr3236524qvn.6.1578474878009;
 Wed, 08 Jan 2020 01:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com> <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
In-Reply-To: <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 Jan 2020 17:14:27 +0800
Message-ID: <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To:     Yong Liang <yong.liang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 8, 2020 at 4:56 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> minor nit, s/amr64/arm64/ in the commit title.
>
> On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
> >
> > From: "yong.liang" <yong.liang@mediatek.com>
> >
> > 1. Include mt8183-reset.h and add reset-cells in infracfg
> > in dtsi file

Err, wait, doesn't this depend on
http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026170.html
?

> > 2. Add watchdog device node

Can we have a patch with just this change instead, since you're
sending the binding with it.

> >
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
>
> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > [snip]
