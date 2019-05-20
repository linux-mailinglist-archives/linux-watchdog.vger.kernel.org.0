Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E7622E1C
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 10:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbfETIOW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 04:14:22 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:37881 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfETIOW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 04:14:22 -0400
Received: by mail-yb1-f195.google.com with SMTP id p134so5359387ybc.4;
        Mon, 20 May 2019 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b1Nie3BHb8c5BThPo1teBTJYFUp/LwJ6jQaWfDHPCns=;
        b=orGKLIROZ7tGEQuodcexsNLM/J7Eloft4Fij9jIp16hMPAhZ/+C44L3zyBKn3OBND7
         rFWx1HZgVkLm1nv2wVExi1d65uJd1Dj/1xW8fhhncmsLJNb/32cM/afhGqy80DCctZdi
         vHoM569tfWfq+9yliuVCVdrgF8b7MtVPfFEv1HRZ4WQZBL2Mq4Rv+t6KTswgzh7zNT4B
         z4IUQ7aFfppvp3suIYgI8jxrllUNpDaVEBp/wYa/HZqQBVeRcMSXPS4E9kE9sp23ICM1
         BJz5oSRwzpmxzvC8HsX0sRq8jTJhK/UBkZS9E3bkgRDcJ/PNrN8coDtyP/RnAWL027p5
         oHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b1Nie3BHb8c5BThPo1teBTJYFUp/LwJ6jQaWfDHPCns=;
        b=HhktVUhTE+BkcGYE1hNl5kkQNvk6HbxCogHbBZfo3hZM2CtEwmYUSRh4qkgF/PsYV3
         XWAwAMitEMXLtsHAAOyPaPqzlf/BkalpeHf+yoTQeuFbxQfNqnKMX/TFJwYj/kFVoCn7
         tGCuRhqxmayIv0gq4da0bGpyPwuyL6Hn51tV5LrsewJcOCNhuKsx87U9OvxssAyad7ED
         Xx0Z6mc0/C40UXOzhFouy9uLolUjYrq9uR/YO8gcwjUUjGUroe8R9mLkmfmfa7wnXLvS
         l4XWlSB4tcy8qxhej+tLWwtHjQ8/tg5j78a2q8K1I/q5M6r3RvW1PqRinfuofUd0O+PQ
         qn9A==
X-Gm-Message-State: APjAAAUykV6kWojHH/KWL7M+KTdcLj+P2M98KyAt4ee2NXvVdq/ARoVV
        ohgTya18AIZ3vnr4lyIhOkJTr1LAL9ocAR5kENk=
X-Google-Smtp-Source: APXvYqzdITGOm1uzRAMhHCqrI7yUvwqh/7HPIVaKHQ0kbZdNv8+oko8EF3XU1eHAr4qQmZTySGwd1ZSxf66Go5tE4Aw=
X-Received: by 2002:a25:10c2:: with SMTP id 185mr32216064ybq.379.1558340061612;
 Mon, 20 May 2019 01:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-2-peron.clem@gmail.com>
 <20190520073529.nxptfbibexrqyzfi@flea>
In-Reply-To: <20190520073529.nxptfbibexrqyzfi@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 20 May 2019 10:14:10 +0200
Message-ID: <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Maxime,

On Mon, 20 May 2019 at 09:35, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 18, 2019 at 05:23:52PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 has a similar watchdog as the A64 which is already
> > a compatible of the A31.
> >
> > This commit sort the lines and add the H6 compatible.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../devicetree/bindings/watchdog/sunxi-wdt.txt         | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b=
/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > index 46055254e8dd..f4810f8ad1c5 100644
> > --- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> > @@ -3,10 +3,12 @@ Allwinner SoCs Watchdog timer
> >  Required properties:
> >
> >  - compatible : should be one of
> > -     "allwinner,sun4i-a10-wdt"
> > -     "allwinner,sun6i-a31-wdt"
> > -     "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > -     "allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
>
> That sorting was kind of intentional
Arg indeed, I will remove it.


>
> > +     - "allwinner,sun4i-a10-wdt"
> > +     - "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > +     - "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> > +       "allwinner,sun6i-a31-wdt"
>
> Is there a reason to keep the A64 compatible?
Yes, A64 and H6 has the exact same memory mapping looking at the datasheet.
So if there is an errata or a new feature for the A64, it should be
also compatible with the H6.
Which is not the case with A31 (WDT_KEY_FIELD is not preset)

Thanks,
Clement

>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
