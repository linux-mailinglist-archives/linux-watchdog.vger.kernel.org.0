Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED527C4CD7
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 10:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjJKIQo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 04:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjJKIQn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 04:16:43 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41DEB9
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 01:16:40 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77574c6cab0so465931885a.3
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697012199; x=1697616999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=xl8Go/6yojwnAlAX/9Y6ZEG3orREXWGbRUwpZPFNBqMyv7+E9gYYFpTqJvQbokYEG8
         mx9jPMhbcdZKuVCIXKYR2B7/0UoxrvSQb0Kndcwv5Scrd0lzhYIlpKH9BLDeRGXmo8RC
         MSGJZJ20Ohu7A4jy6JuZKSpgNe0oihcy1jgLyzBeAYKnihl9GzfzJfVrMxMQJrJm1zHy
         TZ7NoxjwHh+6UgQNr9Jc+GxunvO0Vhtneql7YrT5NlkmKL2H7Jo7hGeOlrxXKBIiQyvy
         q7KtpPOg2DcBQYC1silkk3dmQgLFldWfUGA2LJTuQUEcBC9RckC+LIKw7oGVm3kpjFqh
         vhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012199; x=1697616999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA0RDDaTkiz/7JWtA8mSntXcdVkGEnyXDFoq63BjRlY=;
        b=wh9KCz0F2oRju5Lt8kAAXA1MtZ0WeKhhJTH42ySybk6idMZbb0Pk0HHZiKczXBNeuA
         hkcWRpVa7oKZ44KLTrYbpAzwyOVrMyN5BO83NwT+yqjVafehn+sftkdsAd5OzH/ER4Np
         CDq+VsMiI7kFczgGmkwGIwX+jLAbDVRmISbDl2TkCYYoFvf4Xs0Y/Hk5cw2OCcQQM8aJ
         ABoTVm6FixZjXlLNclFzfRRICLC5qOQsJYI57bXjqDMjCChbUf+xqfTzWp/yw2p1/Y4r
         SU9Ne9MISMmGjKPpw3LavcGk7JB0TSyjAUD3IV+gEsFHXtosa+F28LTod6D0/L3Ran3P
         qwrA==
X-Gm-Message-State: AOJu0YwM9E6S9t9A72cqBcbo6rjt2VcMNCcp5/QCwHyTlkVFsYbgVUwk
        Hehg37fsoUNocVYJgWO8uLCddqpsc1YtTyMR2iZQUA==
X-Google-Smtp-Source: AGHT+IG+0ROOZO1mYXDe5AanejoBg3TXGpWOGx8a61SnY82+auoDhpY/ZD9spxpXsT1DrFa9tocnRlQSlCFjBmjz/zI=
X-Received: by 2002:a0c:aa9a:0:b0:65b:771:f2ea with SMTP id
 f26-20020a0caa9a000000b0065b0771f2eamr15590074qvb.53.1697012199437; Wed, 11
 Oct 2023 01:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
In-Reply-To: <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 09:16:27 +0100
Message-ID: <CADrjBPqOmGEzeVEKiysxQNo9+B0=zD3Z+G24fPDKrFsgUXYJjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Tudor,

Thanks for your reply.

On Wed, 11 Oct 2023 at 07:10, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Hi, Peter,
>
> On 10/10/23 23:49, Peter Griffin wrote:
> > Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> > compatible` I tried to narrow the interrupts check to
> > google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> > pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> > educate me on what I've done wrong here it would be most appreciated!
>
> I guess the initial definition of the number of interrupts should
> include the largest min/maxItems. I no longer see the warning with this
> change:

Yes that is how it was in v1. The review feedback though was to narrow
the scope to just google,gs101-pinctrl compatible using if: then: else: which
is what I can't get to work properly.

regards,

Peter.


>
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 2464bc43aacb..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -59,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
