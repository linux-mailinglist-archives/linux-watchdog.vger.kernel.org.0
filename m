Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C9F7C5FB3
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 23:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbjJKV4W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 17:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbjJKV4V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 17:56:21 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759BDBA
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:56:19 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9c496c114so63005ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061379; x=1697666179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=OpZFEaUYEfgGhOBnIu2+My1gL1CE8z23QBVCFuCCTtMLHt2ToC4Joik3IsFsfHhLfM
         gOgBU0APmziLP6eSfDbf5BRi/ZufILzKl61KfyXZVRtp1HRiDHuUz/RFTnFOrh8MhC4J
         E50uMGtqZ6qrz2tNo8oDwM+x3iyawETKjdbTDreQkzbAJ9ygdA/8Llb7/G20/KKDmYCM
         5yGnLk/Be/iiQX8axZhke4YT7/GU04w01+h+4tuJ/i3v076CAQy9szf3h0yx/7/eLut5
         Pbu6Xy5VES/kM2X5KpPlGnedoIArgCGlHrfdLWw8/U7wDNGSQ3ZxeLli93J0BKbjOdg8
         wLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061379; x=1697666179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY2RJk7ue/Ex7NXo2WJS/YXw1Q/fILloVJYJ2jREcs0=;
        b=W7TFaWhv55cYy7HtQ0X6lKa6JX5+p1G4np6TiTjP82AB8JU5cWIp02+XQ4kC1EdlO9
         LNbeyIw2pRJQjCvlCv/xx8gllop8bwe+KW77RPWypEYcf32v5OotHR1Y1Y7gOCLyCjS3
         GKyCYdZjwEgSvg7w/t/Tc+U3pxK0v9CXhNOez7l3905po59U2uIV9/Jejm/Z8saMTW+A
         9ZB6MLJoV7fNUUIavyzU3d2naTjSwJUTBxEH9uH0QFX8obNr9r1p2G0dNjEzTcuk3D9u
         kQLVVQtnNXpT3oYAe3MsrgSzw4dM9aFsseZzDDnWaVUvyTIrg+DnX9y5BK6ZsG0vsjtw
         bOvg==
X-Gm-Message-State: AOJu0YwIOqwsgfIM9C5c8U7G+W267BDy7Ap0cLXqf9jbxbTCPTrFpaeU
        K2yMIn1ml1bYp/bw0021tkZXKA==
X-Google-Smtp-Source: AGHT+IH0cLMnt++OxXQaz5pgZY6kHmQMxAtk4c0SyB052nIznwOmmp2huLT7DDHY0oMZldy8+AbXOQ==
X-Received: by 2002:a17:903:18b:b0:1c6:ec8:4c82 with SMTP id z11-20020a170903018b00b001c60ec84c82mr303280plg.23.1697061378736;
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id bt12-20020a17090af00c00b0026b12768e46sm383180pjb.42.2023.10.11.14.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:56:18 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:56:14 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 19/20] arm64: defconfig: Enable Google Tensor SoC
Message-ID: <ZScZ_sllcdyS7tCi@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-20-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-20-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Add the Google Tensor SoC to the arm64 defconfig
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5315789f4868..8a34603b1822 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
>  CONFIG_ARCH_BRCMSTB=y
>  CONFIG_ARCH_BERLIN=y
>  CONFIG_ARCH_EXYNOS=y
> +CONFIG_ARCH_GOOGLE_TENSOR=y
>  CONFIG_ARCH_SPARX5=y
>  CONFIG_ARCH_K3=y
>  CONFIG_ARCH_LG1K=y
> -- 
> 2.42.0.655.g421f12c284-goog
> 
