Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753BE7C60DF
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Oct 2023 01:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbjJKXK6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 19:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbjJKXK5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 19:10:57 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F00EB8
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so279656a12.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065855; x=1697670655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=rn5XYdpXBJmRRxzLl64pOttL81Znkyvc86DtKfvm77gnnEK1y3GCexHtg24ZtaNfwC
         5kC6okwJQ6Kr1w52vg8THyT8T1L/bRs3s59hHR7N/zYScOTeJUteUeJp07DUw4IM/V94
         GqOoz/E6LzU08J/nvRQLOVmiYcRsRPq06yEkgXubs3bT0HomCcFPbjmpbqmOoq7tKVmo
         VXneyDRSRYs97RiJ+jJtTl8YtpEVT7pRLLJ+ac8PlFEg6oqrnqRi4unckdzVZZJesB6f
         W/ceZ+orIlLpE3zo9v5Vmna5m+X86ialW+78PTDRZkre7jubvuILSRzvpeiE2vn0W75Q
         TRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065855; x=1697670655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/jasr9MC8Q6p4ZHn0V5Ncug2TkCqML9WgvcfMCVqZc=;
        b=AI28/Gap0XEPOHnJZoiSrswWCQDe1foII7rUWASFt7cZz8EvQ4V52YiUcUm37f43Fa
         jttInceTUx80ZAF7b2vShZiMTmx+Dhf7SVNJazdr299GdFElGRmlVkr+yGLkXHfISQrl
         Yrx6vcImTDUIfvv3BgvuEkO88A/MwcqB9QwBXERALL2u/m1ln1QSqmTKOJcNvbfkAfSj
         ZaeXuGCRM68cOCLzOjhum8nBzfe0BnbB2a+HnAnxi7S/tivY5zZ9tukks1zqEZUpsruY
         1jDSA7HYy+X74i92Nol/UChKXCJ2JSF0iZi+cKLd+TMkguYl00bzRG02HS7LpUtsHfqp
         0riA==
X-Gm-Message-State: AOJu0Yyh4oma08yhWdeeQD+Jky/iyzsQg9t297k5gN604peA6KTz37fo
        qe5I5tS/s8XTI/TRxQt7dDXi5tkPbAxgotTZni2n2g==
X-Google-Smtp-Source: AGHT+IFIp8h+HJuF+A0hsmsQVC0HXjBDyrJM8tEfZ3SsW5MlLdmWSUbNrzXCF7aVJEtvzszUcBZLzs/De5VMD3dWoVE=
X-Received: by 2002:a05:6a20:5485:b0:161:25e5:8de9 with SMTP id
 i5-20020a056a20548500b0016125e58de9mr24576989pzk.48.1697065854855; Wed, 11
 Oct 2023 16:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-7-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-7-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:10:43 -0500
Message-ID: <CAPLW+4n=dBdpwPP5bgww6wGE1bPd32k=OT4R8ZUOt4BUvjVPGg@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
To:     Peter Griffin <peter.griffin@linaro.org>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
>
> Add maxItems of 50 for the interrupts property as gs101 can have
> multiple irqs.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 26614621774a..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -35,6 +35,7 @@ properties:
>
>    compatible:
>      enum:
> +      - google,gs101-pinctrl
>        - samsung,s3c2412-pinctrl
>        - samsung,s3c2416-pinctrl
>        - samsung,s3c2440-pinctrl
> @@ -58,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>
>    power-domains:
>      maxItems: 1
> @@ -134,6 +136,24 @@ allOf:
>            minItems: 1
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          description:
> +            Required for external wakeup interrupts. List all external
> +            wakeup interrupts supported by this bank.
> +          minItems: 1
> +          maxItems: 50
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.42.0.655.g421f12c284-goog
>
