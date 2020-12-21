Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF232DF881
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Dec 2020 06:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgLUFHE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Dec 2020 00:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgLUFHE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Dec 2020 00:07:04 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA62C061282
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Dec 2020 21:06:23 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y8so4996517plp.8
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Dec 2020 21:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aD8F3zpX0cSK92jlYFm0rPZ8cbFr64Bk+pWnjCzU/v4=;
        b=VFBOP49Tf/oZgAntdNhW5/0rbkNZyek5OtZgtlCtgrFklLUdLxiiSxWiqp6YFwULR/
         Lh8v1fWx8j7cTko5rRy7P1bKsLyVCSmbbqfalpCUvGLhkLAVL9eu7glGvXEJj6N/NFce
         iYj5D/l7NIjLbunQgdF+139RCpCyYWV7jpktQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aD8F3zpX0cSK92jlYFm0rPZ8cbFr64Bk+pWnjCzU/v4=;
        b=MxSBFHdJdZ9sjmhHwrjNgcN1Jmhs8du0Ie95MRrnTUpOydgGVZ52dZfYoVofdYWJB8
         2CWsm/D1sJBmPJmQuT8WIvJKIyzV9XvO4txYx/2X+WP/WrN0xcDTwDCVn2eR9Hpesphw
         y7+KF57UO1gaKciV6bmQY7rXxtolZWlOIcm5N2C5j+/t1GZQYZbxj90qjQWdI82fVsU1
         inJI9IjwlW5sf/zW1b+Dacw4I+64Rx3y7pb94MFE7c+p/KQgkxxGTCKI9DC/zA5NE4GE
         8wk53R9+nlEG8Ge7N1yjkms1rSHYjzpsJVczoF3o1nP8yNL0PhUK5ASAcpUh21Gj0ffx
         lvvw==
X-Gm-Message-State: AOAM532QiN44SFw4dQxRipkuH6hySTvd/mOtGy+Yf5os7Jp3xKAPz4LU
        Nf84sGK92TBwg+CXLkSBRCSq+CSURVkZiJ2RaTfQgtbDrPBEpw==
X-Google-Smtp-Source: ABdhPJw8d7KjqC65970hMryKNpzWdCeSPfe/lxCWvLhC2qMbCfOgQK8Qiu6yJLpZ5qihETaT+x5hLUOxaozHWXP1e5w=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr10529936vsb.47.1608512380324;
 Sun, 20 Dec 2020 16:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com> <1605529631.14806.57.camel@mhfsdcap03>
In-Reply-To: <1605529631.14806.57.camel@mhfsdcap03>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 21 Dec 2020 08:59:29 +0800
Message-ID: <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To:     Crystal Guo <crystal.guo@mediatek.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= 
        <seiya.wang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 16, 2020 at 8:27 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>
> Hi Maintainers,
>
> Gentle pin for this patch.
>
> Thanks
>
> On Wed, 2020-10-14 at 21:19 +0800, Crystal Guo wrote:
> > update mtk-wdt document for MT8192 platform

Rob: I assume your input is required here? Any chance we could have
your ack/review on this trivial patch? It seems like the series is
blocked pending on a review of this patch -- and I don't think it has
been reviewed before.

Thanks,


> >
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 45eedc2c3141..e36ba60de829 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -12,6 +12,7 @@ Required properties:
> >       "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> >       "mediatek,mt8183-wdt": for MT8183
> >       "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > +     "mediatek,mt8192-wdt": for MT8192
> >
> >  - reg : Specifies base physical address and size of the registers.
> >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
