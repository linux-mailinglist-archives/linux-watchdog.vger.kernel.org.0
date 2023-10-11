Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63FB7C60AA
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Oct 2023 00:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbjJKW4u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 18:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjJKW4t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 18:56:49 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFE0A9
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 15:56:48 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-692779f583fso297614b3a.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065008; x=1697669808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+Wd5EIBxy7tg1IcC5pX8wjJFGApZ86qa6K6AgCJp6k=;
        b=G/WVRDarUVzQ0zIf9jTro8qy2mZVpTMOSwuWWjmXjtPZJIDD40XfFEIVsar9zyRGu1
         NVkwCSQyauq1GfalRbeT60whdnjYmjjukdn5NiX5YfWfJtBzs7isTj2yHODl3UJ9n7vK
         3ZFfCxhWSvqUfvhBNLGto6aktRDoSy/uF3/pu19KtiRnIDSEUzmd+mCw85+pC/Pcbx8u
         XoAyKC42FRYMjXHKCBl1Zo6p4rd1VtkSPCeCbC8Axt8t4FKh/tVL9RHsxLpO9XIKkdG1
         LUMR38oUqhFhC78fvlZyjd5SvYc3bR1K4ABK5W3pfxZhPKFUztO+QjLvg1sgHGXpsuI8
         IuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065008; x=1697669808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+Wd5EIBxy7tg1IcC5pX8wjJFGApZ86qa6K6AgCJp6k=;
        b=gXue1rJVnydNaXZYFM85BWHqHC2H5Iybu39i1NVcXLApY79CJU0uKcMhopvD5s9QR6
         TOEtjkBbdVqK2LkF9+ttpfaZBLulpufc7WTSlEes+TXEwYJvFM6u81uzQ42dUwmWWLzo
         oYf6bRxyZYRh+XopNN3VLe8o5OP5YyTl/cjDUlOJyDGdaOfGvW2bBQMm6d1BeZhxZ1Vg
         oBWsU9zfkZEuO7orDdrQTa9VI6yyJfmu0LnV4Ik7HuESiLdyAHqQsHuFVi37OvHlbxvZ
         eDxeU4zxsMjh5NluFb5HSeuqxkIkXuC0shIXokjQnNOqtf/h3ibitUIgYvsmY4ifDvLT
         R4TA==
X-Gm-Message-State: AOJu0YwZqAI8eYzTqz84WTBFaEKMMStfut3M09v2PXEnWVfeOCnrEn6q
        YxHACGGv62UpfJC5hPLKewvAb6QzL4Yz/eI82yER/g==
X-Google-Smtp-Source: AGHT+IHWOczWu7WQV1EKAk6a/KcbReCPfGwJhoqvpNTDXWx/1qiK3Ag9j63GW3w5nl3ySyA5aOL457sQ0LvlcBwTEtw=
X-Received: by 2002:a05:6a20:a11b:b0:16b:7fcb:4257 with SMTP id
 q27-20020a056a20a11b00b0016b7fcb4257mr16749547pzk.4.1697065007917; Wed, 11
 Oct 2023 15:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-4-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-4-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 17:56:37 -0500
Message-ID: <CAPLW+4koMf3gcdyBC5vuBDxCyu_2MJT91zuC4diGHFY6FNyMyA@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> GS101 has three different SYSREG controllers, add dedicated
> compatibles for them to the documentation.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index 163e912e9cad..dbd12a97faad 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -30,6 +30,12 @@ properties:
>                - samsung,exynos5433-fsys-sysreg
>            - const: samsung,exynos5433-sysreg
>            - const: syscon
> +      - items:
> +          - enum:
> +              - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
> +              - google,gs101-apm-sysreg
> +          - const: syscon
>        - items:
>            - enum:
>                - samsung,exynos5433-sysreg
> --
> 2.42.0.655.g421f12c284-goog
>
