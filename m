Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5391F7C6C35
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Oct 2023 13:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347163AbjJLLY0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Oct 2023 07:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347169AbjJLLYZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Oct 2023 07:24:25 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3991CD9
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Oct 2023 04:24:23 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7b92cd0ccso10869167b3.1
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Oct 2023 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697109862; x=1697714662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=pC8qsOokKo5AbJkBrTwjJRBiT/rfEBNg5zwnSUHxXYyX8E9oqJfB51849zwB4E8OQP
         nIqncBces2P7P3UlGIySWzHiUnVa2XB7XV5D2Nh9S04oeqnfQzltsZj+Tc0ANIgadgg3
         zg3Oy8r4BI6cxZ5krRgUtvdzg3WNjpdZ5Xm1bQ/INGeKCZXnvrZBjPmsuWcIeh1HNH/C
         4AkqSDvtO6i8oow/yuDKeaEc2N2ydjrmRzuqx8UuqwcYM/heWiWZ9H4Y/g5Eg/9LLONe
         lLyPhNsWzpxpGf8m/1RyTayegn9aYGso5k2uq94upg+YAp/S/2W9Y2AsiZZ/ww6RE3Rr
         iJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109862; x=1697714662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=YSIT6bBTlT7VSkX2hGrhhcSLDda0JOErBmBHYriLhTDdARnT1DC4V3ZJlAaFs7rtbu
         PHmje5CfjYhvlnsCTmsnIEQri5FTSPwdE/U2i0h9rMJcJqdbT2j82E+2/18WwJ6dMzTT
         yChghaIog5xo9r2RdS6fHtSvCqo2wKVgltstMmsGB9kYWVHIyhIXyrm5IZahluMayua4
         2DaESps2dPMGSg0Wmtz5PMWa3HeQu09i6D4eDKbS1bufvSqHTkHtuPS382rd+tWmmxgZ
         3ZuxkNb4ihGBZxsgxPPX0CrYiU9RHOhSGPdf0XtAmj4SCwWlFJZSlIjGnfQqWUK0OYkN
         9vTw==
X-Gm-Message-State: AOJu0YzmdlK8dS02hU2fQc0rDxssuxE5t9y2OM7gWVzEiXDLH5yKwJgM
        EhctEjsdMMS+qjZFnXVyEocRKXRfJt2bOEv5dfs4og==
X-Google-Smtp-Source: AGHT+IEyd9tU65OM05MFMUmFMfOwvob54pQV19I0WfH9OarQjpgIdu1hzRGw1nnfN1MVfenUQvBfK98TGAMRRXEgjxQ=
X-Received: by 2002:a05:690c:3744:b0:5a7:d4a2:cd13 with SMTP id
 fw4-20020a05690c374400b005a7d4a2cd13mr6139438ywb.8.1697109862319; Thu, 12 Oct
 2023 04:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-8-peter.griffin@linaro.org> <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
In-Reply-To: <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 12:24:11 +0100
Message-ID: <CADrjBPr6GY3YQdADhJZ7RC65-mUdYQ=Pk4XbOQ4nwfZt3EYr=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
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

Thanks for the review.

On Thu, 12 Oct 2023 at 00:12, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Tue, Oct 10, 2023 at 5:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> > where more than one pin controller can do external wake-up interrupt.
> > So add a dedicated compatible for it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-=
wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,p=
inctrl-wakeup-interrupt.yaml
> > index 1de91a51234d..7cddce761c46 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > @@ -29,6 +29,7 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wakeup-eint
> >        - samsung,s3c2410-wakeup-eint
> >        - samsung,s3c2412-wakeup-eint
> >        - samsung,s3c64xx-wakeup-eint
> > @@ -99,6 +100,7 @@ allOf:
> >              enum:
> >                - samsung,exynos850-wakeup-eint
> >                - samsung,exynosautov9-wakeup-eint
> > +              - google,gs101-wakeup-eint
>
> Maybe move it on top, to keep the list sorted alphabetically?

Will fix in v4
