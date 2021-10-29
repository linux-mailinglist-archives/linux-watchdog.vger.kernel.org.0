Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A5F43F845
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 09:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhJ2H6d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 03:58:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38598
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232243AbhJ2H6c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 03:58:32 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6DB7F3F165
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635494161;
        bh=LyyBRaeBvGMAnLsFN/eJuaykDGWSSKpKnsQjNh6rDIk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GyCZ7ZC60+Km16be+ADFcNX4LoEhwUoHYI4LEml4EyWvmRXzWjn/z90KbO04iZJfM
         lWNILUoqaDGRhWFrZSkSg6ACt5542NM8e6hIPmoW6xybhsUIdsEn8ZjGWs0vEH/tLf
         ZtiJRPsAPaWkTVOTIkrWqEiFDLb+NOtZcB/kMk4dDK0/4iGlwmLFDRAfE7a1k9hTrz
         hzKRz8iWtzu1pAjhVoFCxBVvBsc/LwJWOvF1LHG7iRRtZmH4h1Fkgq64Li2tipjaRC
         Gv0AwR+09QpfxAwMu4jXXeveZsYxfjI8+27yC+r6AQeu9sosve4p/tIlfp1yedTtPc
         Q0mO1uBbPJ1XQ==
Received: by mail-lj1-f199.google.com with SMTP id f6-20020a2e9e86000000b00211349f9ce3so2777769ljk.3
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LyyBRaeBvGMAnLsFN/eJuaykDGWSSKpKnsQjNh6rDIk=;
        b=mNlstWKChG3Nhoro6n2I0Q7VyjRkHtAnb+o/1c4dNtTzXxGr6YUU0ys59ZEGAddkU6
         AfPPbhrCGT0ljY8QDqyJbKQKkLklXtlvofz9iQaKqy4z+DisDlvqX+jo4u3swmNTdDI0
         EjJBwEyyp7e8+t5NqrAliEwXjnCaffCVWWiSvhCwZIpSTr1y4G8h0/r2aLLb001snY/e
         yqu2JP5gI52CraHBzQNLqq8qejnooATlNV88iHEpEcJeXoeYWUyZKKqQ7t4IzIq7hYY+
         tHEUbYodmHHeunWp0q3dp+QiIJK9eppxuTvJrfMMey5xnSBrpF/JXjJo2p8834UBbQK7
         bMMw==
X-Gm-Message-State: AOAM5337lLGf+plpGx0OXT41VsdcExzWkaDsxJNsTopRxcR34ia4uOaa
        YQSgzqKBNzrn3Z6hXK3IOJahSM+nOl8GV7HsLglwVlnhZ6Bimo1jYozMEDe1U425aQ0aJ5a6JJ5
        p9oDOBdk/Zy+/u17o5+Ltrjt16RDR0yjQwWMmweHXs+Cg
X-Received: by 2002:a05:651c:88d:: with SMTP id d13mr9891263ljq.399.1635494160905;
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjD+ZyZDA5TH1MYDJvmel7PgaO0VMDmzw3+uqvozcCuzMQMxxuuiC2S7FaeIi+F7wLIc61Fw==
X-Received: by 2002:a05:651c:88d:: with SMTP id d13mr9891235ljq.399.1635494160646;
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o1sm533211lfk.159.2021.10.29.00.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
Subject: Re: [PATCH 1/7] dt-bindings: watchdog: Require samsung,syscon-phandle
 for Exynos7
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <99f7e45d-7c27-1ad9-edf5-a5075e8e323b@canonical.com>
Date:   Fri, 29 Oct 2021 09:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/10/2021 20:35, Sam Protsenko wrote:
> Exynos7 watchdog driver is clearly indicating that its dts node must
> define syscon phandle property. That was probably forgotten, so add it.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog
device on Exynos7")

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
