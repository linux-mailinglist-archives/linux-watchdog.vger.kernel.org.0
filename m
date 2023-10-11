Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81DD7C49A3
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 08:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344303AbjJKGK5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 02:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343923AbjJKGK4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 02:10:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21EBA4
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 23:10:53 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5044dd5b561so7829748e87.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Oct 2023 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697004652; x=1697609452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs18PpUTYGWS2Th+7r2apLAIVKCdnE29uQIUA8oLSLc=;
        b=IFS/XObEQu8N2atOHdejXRWDS0/5390hx78wtOwEkAf0xWTiX7pMl2cA/B+WrLGgH+
         /5O7Dd5XkTkNl5vqD7NZ2mMr+1N6Y5KchOcOuQSpIxCwe9Fxw3lDkIHft5yEwiX0XLbk
         efEUqB74Owv+jZlPljD4Z9WjfrrV8ZRqmIqMDjtKU8vjTN99Bek2ipbp72wto86743m6
         VghDbl6TDBDAiy5V6VsfOGfQW6+oFHM7YVMU4/lfFbzg5tex22tyIDpDqnCahHN6+GNf
         9JGAWlQdQB/W0DctVllr9VLMYXjF82E7ATj7C+xZ11NVMZRWZ+yJVyNKVWQEROefJAZE
         AFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697004652; x=1697609452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rs18PpUTYGWS2Th+7r2apLAIVKCdnE29uQIUA8oLSLc=;
        b=Qg+tsnbzoWrR5wFKzOmMI/I3soo0OUCHcSKwtb6zpp1RE2czVxJtt5V6aarSNQRkVi
         8EZVhFbCiyFHFG/XqjNpVLzSvRmrNbNN9puBbwim6BWtkVPE/3yLUZes+7r0hG7WxFup
         KvE7i9MeBDX/vUJ/10CTepAd98gXkLi0I1UUn0AXKLfYcc0HWHqI8grWqC+MP4h28EWs
         PUorWfJaCXgmuyZX3rKT4oq21F7vNOI4dfF8BngHd4RiusOxwOoH/v34dc3SXNO/KWhQ
         ewXTPRsdPmY6yf2G6mcaGzJm8xVqmZWCStj+WjnquNxiHpqt7wIatty9XKgL2UG0LMY7
         p7fw==
X-Gm-Message-State: AOJu0Yy8HCA3ZEw/c6rF4RSPQqX2FJr0RzxP/uB2Sw0zxHq5nC7O8Nk7
        JRC0gKgKnbE8G7SypAgR/fZBnw==
X-Google-Smtp-Source: AGHT+IE89HVDFcFfC44P/nItl+VCGsnDCkj5yP8HJ1NhznNZ/lQEYkHEO99NParLo+oTfKlWtRa/Pg==
X-Received: by 2002:a19:7b03:0:b0:500:aed0:cb1b with SMTP id w3-20020a197b03000000b00500aed0cb1bmr16439849lfc.24.1697004651641;
        Tue, 10 Oct 2023 23:10:51 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm2102818lfp.230.2023.10.10.23.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 23:10:50 -0700 (PDT)
Message-ID: <92de302a-f6b5-465c-a5da-2a711861089e@linaro.org>
Date:   Wed, 11 Oct 2023 07:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Peter,

On 10/10/23 23:49, Peter Griffin wrote:
> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl
> compatible` I tried to narrow the interrupts check to
> google,gs101-pinctrl but I still see a warning: gs101-oriole.dtb:
> pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long If anyone can
> educate me on what I've done wrong here it would be most appreciated!

I guess the initial definition of the number of interrupts should
include the largest min/maxItems. I no longer see the warning with this
change:

diff --git
a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 2464bc43aacb..6dc648490668 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -59,7 +59,8 @@ properties:
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50

   power-domains:
     maxItems: 1
