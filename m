Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7B56CAFFC
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Mar 2023 22:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjC0U2q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Mar 2023 16:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjC0U2q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Mar 2023 16:28:46 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4636C270B
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Mar 2023 13:28:44 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so6115860wmq.3
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Mar 2023 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679948922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6XyQGB5YTPzqeEncabjYPJXPQhCRKXMrHKIK18rowh8=;
        b=PwM5zTNc6t6e5pXudxvs7t7xKDNPvfG/rURST6WDCtP3mcyybZ102fqTIrXQWHn3jt
         GsqqgakjXsx6fToQ7fE5yhK8hav6uhemLk84xH2jD+DTzp9sloDFzZBlXg7ybcLlw4Ti
         0QmtudtFSsJrYaDAjmKNGWv0sOiWvUXKj90KJOJ9EV69agikfMqOdIAHfjizAYhxO/gt
         AQD7UqtKQvA0biIWVbHKWeSEV4VH51/j48VV72LBzIMPWu6tPoH3dRJrIofEWO7Tz06L
         4NrOTJdN8+hf9xupW3aD0Q5CIhblZVuLaT0WE7GXlHH5Y26V+Ez9sFkjz99tenE/uRvX
         Xnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679948922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XyQGB5YTPzqeEncabjYPJXPQhCRKXMrHKIK18rowh8=;
        b=diQ4c1D+TzV/HwBXh+VSbUf4wUbvoyfbtYgfxL0I2tJvHbpzeDdYSJtAccb+SD8bCx
         Tz/e9ETD69MGyTeThU2urOISXBIFIxLU5f66T07OprNse1MHIARlIp4TlonLNuAlNStF
         aUSSB78tNzyExmWpfneZVK+L7Kn4jgJhJUtpfleFggvA9E7wKvPke6mKNrUkIyj650Ep
         7dsS1/5whcSIR52770aoUrvBdoA6D3KxhYF0dndqtK2HHM3FaQj/WK6fOLZQuwJuZtSR
         TsgZI8WnVfUHQ05c2ml+BGYCyyVZTa/SYUwCo2RBmtlDjQSXJD1J1qqAYbkkZyNEx3CF
         qMDQ==
X-Gm-Message-State: AO0yUKU3JOmKaeM1rfQQqA0U1gnZZpsspe6F8MnlT/s6h2nQE3783FXy
        OzugfQ8QpgAxH6YFC9al4Vp2Yw44dcKKQeXw3WtOmtuSkou2ZlxL
X-Google-Smtp-Source: AK7set++o4/dXRKys9UorCef67oaPvg27xdjunH5dcKwpPvKZximdpQ8YdNUTuh/cGVbtlOL+fONXrkijAqK3Syb7Fs=
X-Received: by 2002:a7b:ce8f:0:b0:3ed:c669:8a13 with SMTP id
 q15-20020a7bce8f000000b003edc6698a13mr2804145wmj.8.1679948922332; Mon, 27 Mar
 2023 13:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230314051351.1754321-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20230314051351.1754321-1-bhupesh.sharma@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 28 Mar 2023 01:58:31 +0530
Message-ID: <CAH=2Ntzsppo6QmX27tRszHTf5LTwgL0goTqg06-PtpW4jEHbbQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm SM6115 watchdog
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, agross@kernel.org, andersson@kernel.org,
        saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 14 Mar 2023 at 10:44, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add devicetree binding for watchdog present on Qualcomm
> SM6115 SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
> Changes since v1:
> ~ v1 can be seen here - https://lore.kernel.org/linux-arm-msm/20230119122619.1020908-1-bhupesh.sharma@linaro.org/
> ~ v2 collects Ack from Krzysztof and also fixes the subject as per his
>   v1 review comments.
>
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 6448b633c970..4ba61e1831ec 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,apss-wdt-sdm845
>                - qcom,apss-wdt-sdx55
>                - qcom,apss-wdt-sdx65
> +              - qcom,apss-wdt-sm6115
>                - qcom,apss-wdt-sm6350
>                - qcom,apss-wdt-sm8150
>                - qcom,apss-wdt-sm8250
> --
> 2.38.1

Gentle ping. Any updates on this patch?

Thanks,
Bhupesh
