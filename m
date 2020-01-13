Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA61138BC9
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 07:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgAMG1j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 01:27:39 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35110 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729184AbgAMG1i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 01:27:38 -0500
Received: by mail-qk1-f196.google.com with SMTP id z76so7567152qka.2
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Jan 2020 22:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qqU50tJXg4btjktw2VvbKv0T9TvXNsl1InIj+ksOmtQ=;
        b=BesEvaNjkjkIaEKU8s1yXxtetLayewpTzSIxgPAnNIWav0rTK98k3PPyGaPY2ooOev
         PIM5l4QCvCTOXJN9/lV28q95hAXAwCBK0NsqjUnuTxlcAFy50WZaCvEZUAtRr7ZYVZUl
         GjvY+SmcmMu/fBk4T4iGDv10EKa6Rk0lxaUB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qqU50tJXg4btjktw2VvbKv0T9TvXNsl1InIj+ksOmtQ=;
        b=okwyOwhf5Avv9Bn1JfaKgE4gtiUNF87B85/35n6lx7IdeEd9IQTuIjK/ywIwTiLpnp
         W77SQnOYeCvJJSGAnZU2MRUem1VWCur8ySO/fuzF1gimbRGjD7sjzf9o5LQwrTsUMP2m
         Hu1bEyorksENfqEftx1JDc5F4wsbMgLXO1LTz8QQ8nnLP5dgfjUxfKIozkgIVolJ5sKd
         PZRGSydWtiTvrjNbqWq3IFPALEcIMTApUifo78lrhXywaxGbLuwKYw1inYBt4w8uk7nf
         g6l2EoR/Y/W7VeUe3QHhb9CdEI8MAizzBjWNWWfJjOeWfAx67V5t2cl0U98bcRxqi9rk
         4Zag==
X-Gm-Message-State: APjAAAU7wuOfIHf8JbUaxlSnInly9K0OM8at+V45MhYdfzJJI8ChdxJB
        zCnExLm/wPELnCBLKnaC3sbhKB6nHJeXiu0eDCZiYg==
X-Google-Smtp-Source: APXvYqzP2GQhgfRONDK0y5ZOBxgMhbBnqFh8jwEdZzw+mIw4d1s/lLCcUIgYHMP8DEVTe7wIzDfiU37pKS7LntYC0ao=
X-Received: by 2002:a37:6551:: with SMTP id z78mr15363934qkb.144.1578896857929;
 Sun, 12 Jan 2020 22:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com> <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
 <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
 <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com> <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
In-Reply-To: <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 13 Jan 2020 14:27:27 +0800
Message-ID: <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Yong Liang <yong.liang@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

+Jiaxin +Sj Huang

On Mon, Jan 13, 2020 at 12:44 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Fri, Jan 10, 2020 at 6:09 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > [snip]
> > That's all a bit confusing, I thought we are fine to add the reset cells to
> > infracfg as we have the resets defined in
> > 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
>
> You're right, we're fine. But at least in theory, we should still have
> the binding documentation that I linked above.
>
> I will try to pick up all the required patches, split them across
> 8183/2712 and resend as one series.

Okay, summary of the patches, there are 2 series:

https://patchwork.kernel.org/patch/11311237/
[1.1] [v3,1/2] amr64: dts: modify mt8183.dtsi
  => Partially applied to Matthias' v5.5-next/dts64
  => Other part depend on [1.2], needs to be applied
https://patchwork.kernel.org/patch/11311241/
[1.2] [v3,2/2] dt-bindings: mt8183: Add watchdog dt-binding
  => Pending Guenter/Wim

https://patchwork.kernel.org/cover/11326757/
[2.0] [PATCH v11 0/3] ASoC: mt8183: fix audio playback slowly after playback
[2.1] [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
  => IMHO adding mt2712 compatible should be another patch
  => Depends on [1.2]
  => Tags should be all dropped
[2.2] [PATCH v11 2/3] watchdog: mtk_wdt: mt8183: Add reset controller
  => Issues about tags
[2.3] [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
  => Issues about tags

Jiaxin/Yong Liang/Matthias: Please let me know, I'm happy to pick up
the patches, clean them up and resend them, if you think that helps.


> > That's why I took this part from:
> > https://lore.kernel.org/linux-mediatek/20191226093930.22413-1-yong.liang@mediatek.com/
> >
> > Please let me know if I'm wrong and I'll drop it.
> >
> > Regards,
> > Matthias
> >
> > >>> 2. Add watchdog device node
> > >
> > > Can we have a patch with just this change instead, since you're
> > > sending the binding with it.
> > >
> > >>>
> > >>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > >>
> > >> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> > >>
> > >>> ---
> > >>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> > >>>  1 file changed, 8 insertions(+)
> > >>> [snip]
