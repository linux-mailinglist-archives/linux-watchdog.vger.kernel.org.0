Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263507C653A
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Oct 2023 08:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376631AbjJLGQG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Oct 2023 02:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377163AbjJLGQF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Oct 2023 02:16:05 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCC0BA
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 23:16:03 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-278eaffd81dso499232a91.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091362; x=1697696162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=EVQ4AJbqgyOp6EuXe/x8YNXAVfHhR/SuDiGt5v/XDOn8SnUSWZtVRLhw2PjYcfLRzq
         vqw9bs5muSn5usSNIPnBXK+fZJm2Y83sc/SwkhPvv8RomE1kuvgSzCx6AGEiWJt0H2/+
         zcJFao1WbZV8DYqHDlWS0JQxDfdSTyvnWTd6QtMeADnq9WQrfZpx+La4NiLUE6Uq97Xb
         8KSggRFbdqq84OR4jx5INxap15k7RpbgpNLB2WwGkeerF3UGjja6Bl8skrz4nXyZXA6V
         ttUrYXqK+nY8cHUSAO8o+Pf0/zGLl/QhzYzVk6PSHRfKqUDRrqHx+tJbxuhy6KJesqmI
         7JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091363; x=1697696163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8esZ0yO2aAzAHHUJbhBO1Vz268Oa3brBkIMO3CyVGR0=;
        b=udTPcn5wUWthIaSVsVda+Z4tvabWMHO9DUesFlKl9dlC+AkMhyIck7IaVmrCGx0rwT
         D8RP6VY+T4FC3kYo00sNVzxgsKLdaZ+eLrsYqCMCHgrc7B7EnRUgnky3bxVEGUbXCpp7
         Y1z3ZCkAFa9uewaIaJqOegwqXx9BSzp4KlD6E83vz4sWhFhoe1eiIXOr+wkRvJTdibzR
         bO5jKhw6jmtTNYM3OV4GgQTOWk0SPHOLiYQJ4m1Z5hU5nikFWjdH+O5uygHc5uHJkixi
         uWQjszWM8CjQE4E0N6rfW779oLYhddWsE8VpkP4/vwLk9AP1KMtj+2k8x7//ygfg621E
         CPEA==
X-Gm-Message-State: AOJu0Yz4Ow3Bcp53U/A4Qui7dHK9zhYy184dBrU4bOn+k1Wnbfk8/DFD
        CWxfFMQDgCxTWnOBt/zyiKoIzyOsbyNDehUomVEXFw==
X-Google-Smtp-Source: AGHT+IFVQ9Wikpi2B+8rv5uas0wyJQjBlEO1BbvS/6y/xJD4K3tybOua8AIGJVAe27mvKcnQC5VVeozSwZ6aMTqh9LI=
X-Received: by 2002:a17:90a:488e:b0:27d:233e:b4f6 with SMTP id
 b14-20020a17090a488e00b0027d233eb4f6mr345442pjh.45.1697091362667; Wed, 11 Oct
 2023 23:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-20-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 01:15:51 -0500
Message-ID: <CAPLW+4mAeRQBZp1HKWDKLHV1cYafksjijzQJMGhMsz+e0cxhOg@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the Google Tensor SoC to the arm64 defconfig
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=3Dy
>  CONFIG_ARCH_BRCMSTB=3Dy
>  CONFIG_ARCH_BERLIN=3Dy
>  CONFIG_ARCH_EXYNOS=3Dy
> +CONFIG_ARCH_GOOGLE_TENSOR=3Dy
>  CONFIG_ARCH_SPARX5=3Dy
>  CONFIG_ARCH_K3=3Dy
>  CONFIG_ARCH_LG1K=3Dy
> --
> 2.42.0.655.g421f12c284-goog
>
