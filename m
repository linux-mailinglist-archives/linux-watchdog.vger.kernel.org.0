Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2458A23BDD
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 17:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387444AbfETPTa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 11:19:30 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:43541 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbfETPTa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 11:19:30 -0400
Received: by mail-yw1-f67.google.com with SMTP id t5so5991526ywf.10;
        Mon, 20 May 2019 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=plhElv+BUriUXkpSQXoRKCyimftsR0KZ9zPI/uX0VTQ=;
        b=g39fxCpP9jJ+hCzPERmfMVo1Ed4LieWjnbbF/wkeYiIRg/N0UscK7Q5MCGnojUCn6p
         A1FP94Fr43XeRPFA6q/WlPlOSQITHWQ4cqfvlpZq65nT5DzPAejfPlgmMyJrYy/PvfjV
         miI0HU5g0v4AwnjpQeLCHH9jDzcgLFn+VC+GbTe2j8/WvrOTZm9ipAm3Vn3V4w/h/Vot
         8YkjSbBlbpv5aYTZ3F4Nokl8+Flm43x5+NZWUiHwD1c52YH9SbbEhVJCHj9Xv+nsQI1B
         OCm05MS1tOSwpWfH+p2PxVuVVQAnrOsKvk8S5vkwJoVKdYx5y5FMLp244JrFtfTfX16x
         oGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=plhElv+BUriUXkpSQXoRKCyimftsR0KZ9zPI/uX0VTQ=;
        b=RpOuox7rEhJWruHgREowbgvG/0fbVhfLKg/favXZ2HqduAHdFaqj8RzTGh6Muev4tK
         IhGbdWn5deknA8vppvaqyJjC/H1cxgrLkedUr3PionKf61IzyjRERApbLK9wq3mkx3iI
         BvbJa/haMbZnZntCsICiAMrTxnHRkSr8XlO/WdaaQGql27RMtxEfquXCpvmaxCXQLbri
         cO1sUx36vQbHSGr4xn+XQszI0U9q/mvJqnkte22x3QkoqkB/Kw2sw/ItikoIdaNrX8ha
         tODagRTIHeZQI0Jy8nqCQFBXmORY6g3HZCAhDJY2QRfDLEI40HlvYEFGlTfIAyb2Pto2
         B7gw==
X-Gm-Message-State: APjAAAVjxXnRohAAcm+TwM2LpCbBf//a0iaTzApdPvBO79Qk3KXoV9Wj
        mlJUbU1hrRR3j7bxHDD5Vzr1Y9HbJ7Hhf5g/2Pc=
X-Google-Smtp-Source: APXvYqwU/0+XEhwYF+YlLZjzvLcGA3xe1OksHMiGFtm34/k1x/2galfCzg4w8Pmv+zx4UnYDt1r8ZsHWOdXIM2EFcAw=
X-Received: by 2002:a0d:ea4c:: with SMTP id t73mr35484753ywe.472.1558365569102;
 Mon, 20 May 2019 08:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-4-peron.clem@gmail.com>
In-Reply-To: <20190518152355.11134-4-peron.clem@gmail.com>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 20 May 2019 17:19:17 +0200
Message-ID: <CAJiuCcdNmf3+xj+KE4yihZk67QV7Ds8UTjzQ6JsPp=2KLJgOZg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: allwinner: h6: add r_watchog node
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-watchdog@vger.kernel.org,
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

On Sat, 18 May 2019 at 17:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Allwinner H6 has a r_watchdog similar to A64.
>
> Declare it in the device-tree.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 60b47f23b2f5..27647e496269 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -632,6 +632,14 @@
>                         #reset-cells =3D <1>;
>                 };
>
> +               r_watchdog: watchdog@7020400 {
> +                       compatible =3D "allwinner,sun50i-h6-wdt",
> +                                    "allwinner,sun50i-a64-wdt",
> +                                    "allwinner,sun6i-a31-wdt";
> +                       reg =3D <0x07020400 0x20>;
> +                       interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

Just want to point out that i have used the same bindings for WDT and R_WDT=
.
I think it would be better to also introduce a bindings like
"allwinner,sun50i-h6-r-wdt", "allwinner,sun6i-a31-wdt";

We don't have access to the datasheet of this IP but we can strongly
suppose that wdt and r-wdt are the same.

What do you think?

Regards,
Clement


> +               };
> +
>                 r_intc: interrupt-controller@7021000 {
>                         compatible =3D "allwinner,sun50i-h6-r-intc",
>                                      "allwinner,sun6i-a31-r-intc";
> --
> 2.17.1
>
