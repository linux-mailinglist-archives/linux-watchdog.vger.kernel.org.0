Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754B17C6E24
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Oct 2023 14:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjJLMd4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Oct 2023 08:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378971AbjJLLxy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Oct 2023 07:53:54 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686425FD9
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Oct 2023 04:51:19 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66cfef11a25so5089196d6.3
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Oct 2023 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697111470; x=1697716270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wguIFACywm82p+kwjY1C1abIOanzWtWu5hp7VdYjEQ=;
        b=Z4U/+th/egFk8MmlMe51P1QDT1DNtPvvKYERJLMtNUAu4M1cv1BxyhPKQgRl6xQ7cf
         IvgMlpRUD4Ri/F20Arw31eY9Joa34yYp1AXPzsLtsCggUWoOUyYqkzV2XWPQXCl4IkUM
         ai0oHYqn36eJlNdS2Q3nH911LJi+s3oZyb5PIl/ssCP/q+/EYYDvgT1ICRVJI6kRoEaq
         GuHLl4n1Es/y+XW0qlbzJHLhkJF2LzkcAspzL2mjQYBR3/i6NYTlaabEnS+cxrp2/28D
         RkZa6PN3UweN56aV2+3OSXDCjX98r9PEX2wdQvw0Fx6oFbj2mWBGk+3eXfIXwOryVoiZ
         XfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697111470; x=1697716270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wguIFACywm82p+kwjY1C1abIOanzWtWu5hp7VdYjEQ=;
        b=UkxmT4QbC70I9Teoj9gQzFUNdAHy1WiRN56ys6c5stG9WRVfZri+8IWl/NgUslLE+l
         OcHwggR0zFd0PfbjeYPktkS7wvFqd7/lif4koC2eII40QhKKSCQ2NC25TPQn5lT7ufdG
         RCqJFxtojuR0FRXvEBqHI9dCxDmG1qgh7UAcxFilByepDl/A8cPRMo6F8/O5pBpHPjmS
         alXeGgb8MVANoQSywwK7KaFazlVGYX632Z4U+aKhdkn9vzvHe0pnSJm/utWSxB/mz/U6
         TvdztlQx8dcEj/23bB/lU2Gdiwm6f5OeaEQn6RqJevM6jQMO5HQQiSfZbSbmPQJid9vm
         khJQ==
X-Gm-Message-State: AOJu0Yx2g6U6YSnHpZacqCFo8qqqjNCuuKXoe0hHJKnAv1NF9uvhb0k7
        tGhXBP8YsW89/6cV9ysNFCaYkpc30OKCZopstkABnQ==
X-Google-Smtp-Source: AGHT+IEvqT6kbO6hVsQ4G1yNHRRTZQluz8FwmB8xQs8FuXvEunZhGsOYdqUcE+o4RW+c8m2PI7lkpx1R0l5LGmrcKek=
X-Received: by 2002:a0c:d641:0:b0:668:7bc2:d64d with SMTP id
 e1-20020a0cd641000000b006687bc2d64dmr21776663qvj.27.1697111470058; Thu, 12
 Oct 2023 04:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org> <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
In-Reply-To: <CAPLW+4nmonxdLCWEZy15attd5ULUfL0VgZf5YQzFBA_0bvUwUw@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 12:50:58 +0100
Message-ID: <CADrjBPoCOzJ0tNU3XSZFy7PAVAUAqCN3bFFDZZPaeyZ_wTJygw@mail.gmail.com>
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Sam,

On Thu, 12 Oct 2023 at 00:19, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> >
> > pll0516x: Integer PLL with high frequency
> > pll0517x: Integer PLL with middle frequency
> > pll0518x: Integer PLL with low frequency
> >
> > PLL0516x
> > FOUT =3D (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> >
> > PLL0517x and PLL0518x
> > FOUT =3D (MDIV * FIN)/PDIV*2^SDIV)
> >
> > The PLLs are similar enough to pll_0822x that the same code can handle
> > both. The main difference is the change in the fout formula for the
> > high frequency 0516 pll.
> >
> > Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor=
.
> > MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> >
> > When defining the PLL the "con" parameter should be set to CON3
> > register, like this
> >
> > PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
> >     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
> >     NULL),
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
> >  drivers/clk/samsung/clk-pll.h | 3 +++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pl=
l.c
> > index 74934c6182ce..4ef9fea2a425 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(=
struct clk_hw *hw,
> >         pdiv =3D (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK=
;
> >         sdiv =3D (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK=
;
> >
> > -       fvco *=3D mdiv;
> > +       if (pll->type =3D=3D pll_0516x)
> > +               fvco =3D fvco * 2 * mdiv;
> > +       else
> > +               fvco *=3D mdiv;
> > +
>
> Can be written like this I guess:
>
>        fvco *=3D mdiv;
>        if (pll->type =3D=3D pll_0516x)
>               fvco *=3D 2;
>
> if you think it's more neat. Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

I will update like you suggest and add your Reviewed-by tag.

regards,

Peter.
